package main
import "bufio"
import "fmt"
import "os"
import "strconv"

type point struct {
  row int
  col int
}

type Tree struct {
  value int
  children []Tree
}

func tree_displayer (tree Tree){

  fmt.Print(tree)

}


func row_checker(x int, y int, arr[3][3] int, tree Tree){

  var x_arr[] int

  for j := 0; j < len(arr); j++ {
    if (arr[y][j] != 0) {
      x = j
      x_arr = append(x_arr, x)
      var child Tree
      child.value = arr[y][x]
      tree.children = append(tree.children, child)
      arr[y][j] = 0
    }
  }
  //fmt.Println(tree)
  tree_displayer(tree)
  for i := 0; i < len(tree.children); i++ {
    col_checker (x_arr[i], y, arr, tree.children[i])
  }
}

func col_checker(x int, y int, arr[3][3] int, tree Tree){

  var y_arr[] int
    for i := 0; i < len(arr); i++ {
      if (arr[i][x] != 0) {
        y = i
        y_arr = append(y_arr, y)
        var child Tree
        child.value = arr[y][x]
        tree.children = append(tree.children, child)
        arr[i][x] = 0
      }
    }

    // fmt.Println(tree)
    tree_displayer(tree)

    for i := 0; i < len(tree.children); i++ {
      row_checker(x, y_arr[i], arr, tree.children[i])
    }
}

func stepping_stone_calculator(coord *point, arr [3][3]int){

  //var sum []int

  var x int = coord.col
  var y int = coord.row

  for i := 0; i < len(arr); i++{
    for j := 0; j < len(arr); j++ {
      fmt.Print (arr[i][j])
      fmt.Print (" ")
    }
    fmt.Println()
  }

  var tree Tree

  row_checker(x, y, arr, tree)

}


func scanWords(path string) ([]string, error) {
  file, err := os.Open(path)
  if err != nil {
    return nil, err
  }
  defer file.Close()
  scanner := bufio.NewScanner(file)
  scanner.Split(bufio.ScanWords)
  var words []string
  for scanner.Scan() {
    words = append(words, scanner.Text())
  }
  return words, nil
}


func stepping_stone(arr [3][3] int, file_name string){
  var word_arr[3][3] string
  var word_arr_int [3][3] int
  words, err := scanWords(file_name)
  if err != nil {
    panic (err)
  }

  for i := 0; i < len(words); i++{
    if (words[i] == "-"){
      words[i] = "0"
    }
  }

  word_arr[0][0] = words[6]
  word_arr[0][1] = words[7]
  word_arr[0][2] = words[8]
  word_arr[1][0] = words[11]
  word_arr[1][1] = words[12]
  word_arr[1][2] = words[13]
  word_arr[2][0] = words[16]
  word_arr[2][1] = words[17]
  word_arr[2][2] = words[18]

  for i := 0; i < 3; i ++ {
    for j := 0; j < 3; j++ {
      word_arr_int[i][j], _ = strconv.Atoi(word_arr[i][j])
      //fmt.Println(word_arr_int[i][j])
    }
  }

  ///////////////////////////////////////////////////////////
  // identifying where the 0's in the array's are
  var zero_index = [] point {}
  for i := 0; i < 3; i++ {
    for j := 0; j < 3; j++{
      if (word_arr_int[i][j] == 0){
        zero_index = append(zero_index, point{i,j})
      }
    }
  }

  // for i := 0; i < len(zero_index); i++{
  //   fmt.Println(zero_index[i])
  // }

  for i := 0; i < len(zero_index); i++{
    fmt.Println(zero_index[i])
    stepping_stone_calculator(&zero_index[i], word_arr_int)
  }

}


func main() {
  fmt.Print("Enter the name of the file: ")
  var file_name string
  fmt.Scanln(&file_name)
  fmt.Println(file_name)
  fmt.Println()

  switch file_name{
  case "3by3_initial.txt":
    //arr_33 := make([][]int, 3, 3)
    var arr_33 [3][3] int
    stepping_stone(arr_33, file_name)
  // case "3by4_initial.txt":
  //   fmt.Println("3x4")
  //   var arr_34 [3][4] int
  //   stepping_stone(arr_34, file_name)
  // case "4by4_initial.txt":
  //   fmt.Println("4x4")
  //   var arr_44 [4][4] int
  //   stepping_stone(arr_44, file_name)
  // case "10by10_initial.txt":
  //   fmt.Println("10x10")
  //   var arr_1010 [10][10] int
  //   stepping_stone(arr_1010, file_name)
  default:
    fmt.Println("File does not exist")
  }
}
