defmodule Othello.Game do
    def new do
        %{
            squares: [nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,0,1,nil,nil,nil,nil,nil,nil,1,0,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil],
            score1: 0,
            score2: 0,
            turn: false
        }

    end

    def client_view(game) do
        %{
            squares: game.squares,
            score1: game.score1,
            score2: game.score2,
            turn: game.turn
        }
    end

    def getFirstHorizontal(squares, i, lower,limit,turn) do
        flag = false
        if(limit>=lower) do
            if(Enum.at(squares,limit) !=turn and Enum.at(squares,limit)!=nil) do
                getFirstHorizontal(squares,i,lower,limit-1,turn)
            else 
                if(Enum.at(squares,limit)==turn) do
                    flag = true
                end
            end
        end
        if(flag==true) do
            limit
        else
            limit+1
        end
    end

    def getFirstSquareHorizontal(squares,i,turn) do
        row1 = [0,7]
        row2 = [8,15]
        row3 = [16,23]
        row4 = [24,31]
        row5 = [32, 39]
        row6 = [40, 47]
        row7 = [48, 55]
        row8 = [56,63]
        index = -1
        limit = i
        if(i>=Enum.at(row1,0) and i<=Enum.at(row1,1)) do
            lower = Enum.at(row1,0)
            index = getFirstHorizontal(squares, i,lower,limit,turn)
        end
        if(i>=Enum.at(row2,0) and i<=Enum.at(row2,1)) do
            lower = Enum.at(row2,0)
            index = getFirstHorizontal(squares, i,lower,limit,turn)
        end 
        if(i>=Enum.at(row3,0) and i<=Enum.at(row3,1)) do
            lower = Enum.at(row3,0)
            index = getFirstHorizontal(squares, i,lower,limit,turn)
        end       
        if(i>=Enum.at(row4,0) and i<=Enum.at(row4,1)) do
            lower = Enum.at(row4,0)
            index = getFirstHorizontal(squares, i,lower,limit,turn)
        end
        if(i>=Enum.at(row5,0) and i<=Enum.at(row5,1)) do
            lower = Enum.at(row5,0)
            index = getFirstHorizontal(squares, i,lower,limit,turn)
        end
        if(i>=Enum.at(row6,0) and i<=Enum.at(row6,1)) do
            lower = Enum.at(row6,0)
            index = getFirstHorizontal(squares, i,lower,limit,turn)
        end
        if(i>=Enum.at(row7,0) and i<=Enum.at(row7,1)) do
            lower = Enum.at(row7,0)
            index = getFirstHorizontal(squares, i,lower,limit,turn)
        end
        if(i>=Enum.at(row8,0) and i<=Enum.at(row8,1)) do
            lower = Enum.at(row8,0)
            index = getFirstHorizontal(squares, i,lower,limit,turn)
        end
        index
    end

    def changeSquareColor(squares,i,color) do
        squares = List.replace_at(squares,i,color)
        squares
    end

    def changeLeftHorizontal(squares,i,index,color) do
        if(i>=index) do
            squares = changeSquareColor(squares,i,color)
            changeLeftHorizontal(squares,i-1,index,color)
        end
        squares
    end

    #returns : the rightmost square of the given row higher index
    def getLastHorizontal(squares, i, higher,limit,turn) do

        flag = false
        if(limit<=higher) do
            if(Enum.at(squares,limit) !=turn and Enum.at(squares,limit)!=nil) do
                getLastHorizontal(squares,i,higher,limit+1,turn)
            else
                if(Enum.at(squares,limit)==turn) do
                    flag = true
                end
            end
        end
        if(flag==true) do
            limit
        else
            limit-1
        end
    end

    def getLastSquareHorizontal(squares,i,turn) do
        row1 = [0,7]
        row2 = [8,15]
        row3 = [16,23]
        row4 = [24,31]
        row5 = [32, 39]
        row6 = [40, 47]
        row7 = [48, 55]
        row8 = [56,63]
        index = -1
        limit = i
        if(i>=Enum.at(row1,0) and i<=Enum.at(row1,1)) do
            higher = Enum.at(row1,1)
            index = getLastHorizontal(squares, i,higher,limit,turn)
        end
        if(i>=Enum.at(row2,0) and i<=Enum.at(row2,1)) do
            higher = Enum.at(row2,1)
            index = getLastHorizontal(squares, i,higher,limit,turn)
        end 
        if(i>=Enum.at(row3,0) and i<=Enum.at(row3,1)) do
            higher = Enum.at(row3,1)
            index = getLastHorizontal(squares, i,higher,limit,turn)
        end       
        if(i>=Enum.at(row4,0) and i<=Enum.at(row4,1)) do
            higher = Enum.at(row4,1)
            index = getLastHorizontal(squares, i,higher,limit,turn)
        end
        if(i>=Enum.at(row5,0) and i<=Enum.at(row5,1)) do
            higher = Enum.at(row5,1)
            index = getLastHorizontal(squares, i,higher,limit,turn)
        end
        if(i>=Enum.at(row6,0) and i<=Enum.at(row6,1)) do
            higher = Enum.at(row6,1)
            index = getLastHorizontal(squares, i,higher,limit,turn)
        end
        if(i>=Enum.at(row7,0) and i<=Enum.at(row7,1)) do
            higher = Enum.at(row7,1)
            index = getLastHorizontal(squares, i,higher,limit,turn)
        end
        if(i>=Enum.at(row8,0) and i<=Enum.at(row8,1)) do
            higher = Enum.at(row8,1)
            index = getLastHorizontal(squares, i,higher,limit,turn)
        end
        index
    end

    def changeRightHorizontal(squares,i,index,color) do
        if(i<=index) do
            squares = changeSquareColor(squares,i,color)
            changeRightHorizontal(squares,i+1,index,color)
        end
        squares
    end

    def checkHorizontal(squares,i,valid,turn) do
        if (valid == false) do
            if(Enum.at(squares,i-1) != nil and Enum.at(squares,i+1) == nil) do
                index = getFirstSquareHorizontal(squares,i,turn) #first filled square of that row
                if(index >= 0 and index-i>1) do
                    squares = changeLeftHorizontal(squares,i,index,turn)
                    valid = true
                end
            else
                if (Enum.at(squares,i-1) == nil and Enum.at(squares,i+1) != nil) do
                    index = getLastSquareHorizontal(squares,i,turn)
                    if (index>=0 and i-index>1) do
                        squares = changeRightHorizontal(squares,i,index,turn)
                        valid = true
                    end
                end
            end
        end
        %{
            squares: squares
            valid: valid
        }
    end

    def checkValidMove(squares,i,valid,turn) do
        check = checkHorizontal(squares,i,valid,turn)
        #check = checkVertical(check.squares,i,check.valid,turn)
        #check = checkDiagonal(check.squares,i,check.valid,turn)
    end

    def handleClickByServer(game,i) do
        squares = game.squares
        score1 = game.score1
        score2 = game.score2
        turn = game.turn

        if(Enum.at(squares,i) == nil) do
            valid = false
            squares = checkValidMove(squares,i,valid,turn)
        end
    
        
          
    end

    
end