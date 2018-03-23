defmodule Othello.Game do
    def new do
        %{
            squares: [nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,1,0,nil,nil,nil,nil,nil,nil,0,1,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil],
            score1: 0,
            score2: 0,
            turn: 0
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


    def getFirstHorizontal(squares,i,lower,limit,turn,turnCount,lastTurn) do
        IO.puts("lgetFirstHori ka limit and higher")
        IO.puts(limit)
        IO.puts(lower)
        if(limit>=lower) do
            if(Enum.at(squares,limit)!=nil) do
                if(Enum.at(squares,limit)==turn) do
                    turnCount = turnCount+1
                    lastTurn = limit
                end
                obj=getFirstHorizontal(squares,i,lower,limit-1,turn,turnCount,lastTurn)
                limit = obj.limit
                turnCount = obj.turnCount
                lastTurn = obj.lastTurn
            end
        end
        %{
            limit: limit,
            turnCount: turnCount,
            lastTurn: lastTurn
        }
    end

    #def getFirstHorizontal(squares, i, lower,limit,turn) do
     #   flag = false
      #  IO.puts(lower)
       # IO.puts(limit)
        #if(limit>=lower) do
         #   IO.puts("limit more than lower")
          #  if(Enum.at(squares,limit) !=turn and Enum.at(squares,limit)!=nil) do
           #     IO.puts("should recurse")
            #    limit = getFirstHorizontal(squares,i,lower,limit-1,turn)
            #else 
             #   if(Enum.at(squares,limit)==turn) do
              #      flag = true
               # end
            #end
        #end
        #if(flag==true) do
         #   limit
        #else
         #   limit
        #end
    #end

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
        limit = i-1
        if(i>=Enum.at(row1,0) and i<=Enum.at(row1,1)) do
            lower = Enum.at(row1,0)
            indexObj = getFirstHorizontal(squares, i,lower,limit,turn,0,i)
        end
        if(i>=Enum.at(row2,0) and i<=Enum.at(row2,1)) do
            lower = Enum.at(row2,0)
            indexObj = getFirstHorizontal(squares, i,lower,limit,turn,0,i)
        end 
        if(i>=Enum.at(row3,0) and i<=Enum.at(row3,1)) do
            lower = Enum.at(row3,0)
            indexObj = getFirstHorizontal(squares, i,lower,limit,turn,0,i)
        end       
        if(i>=Enum.at(row4,0) and i<=Enum.at(row4,1)) do
            #IO.puts("came to row4")
            lower = Enum.at(row4,0)
            indexObj = getFirstHorizontal(squares, i,lower,limit,turn,0,i)
        end
        if(i>=Enum.at(row5,0) and i<=Enum.at(row5,1)) do
            lower = Enum.at(row5,0)
            indexObj = getFirstHorizontal(squares, i,lower,limit,turn,0,i)
        end
        if(i>=Enum.at(row6,0) and i<=Enum.at(row6,1)) do
            lower = Enum.at(row6,0)
            indexObj = getFirstHorizontal(squares, i,lower,limit,turn,0,i)
        end
        if(i>=Enum.at(row7,0) and i<=Enum.at(row7,1)) do
            lower = Enum.at(row7,0)
            indexObj = getFirstHorizontal(squares, i,lower,limit,turn,0,i)
        end
        if(i>=Enum.at(row8,0) and i<=Enum.at(row8,1)) do
            lower = Enum.at(row8,0)
            indexObj = getFirstHorizontal(squares, i,lower,limit,turn,0,i)
        end
        IO.puts(index)
        indexObj
    end

    def changeSquareColor(squares,i,color) do
        squares = List.replace_at(squares,i,color)
        IO.puts("changeSquareColor")
        IO.puts(i)
        IO.puts(Enum.at(squares,i))
        squares
    end

    def changeLeftHorizontal(squares,i,index,color) do
        #IO.puts("in checklefthori")
        if(i>=index) do
            #IO.puts("in uska if")
            squares = changeSquareColor(squares,i,color)
            squares = changeLeftHorizontal(squares,i-1,index,color)
        end
        squares
    end

    def getLastHorizontal(squares,i,higher,limit,turn,turnCount,lastTurn) do
        IO.puts("lgetLastHori ka limit and higher")
        IO.puts(limit)
        IO.puts(higher)
        if(limit<=higher) do
            if(Enum.at(squares,limit)!=nil) do
                if(Enum.at(squares,limit)==turn) do
                    turnCount = turnCount+1
                    lastTurn = limit
                end
                obj = getLastHorizontal(squares,i,higher,limit+1,turn,turnCount,lastTurn)
                limit = obj.limit
                turnCount = obj.turnCount
                lastTurn = obj.lastTurn
            end
        end
        %{
            limit: limit,
            turnCount: turnCount,
            lastTurn: lastTurn
        }
    end

    #returns : the rightmost square of the given row higher index
    #def getLastHorizontal(squares, i, higher,limit,turn) do
     #   IO.puts("in getlasthori")
      #  flag = false
       # if(limit<=higher) do
        #    IO.puts("limit less than higher")
         #   if(Enum.at(squares,limit) !=turn and Enum.at(squares,limit)!=nil) do
          #      IO.puts("in that if")
           #     limit = getLastHorizontal(squares,i,higher,limit+1,turn)
            #else
             #   if(Enum.at(squares,limit)==turn) do
              #      flag = true
               # end
            #end
        #end
        #if(flag==true) do
         #   limit
        #else
         #   limit
        #end
   # end

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
        limit = i+1
        if(i>=Enum.at(row1,0) and i<=Enum.at(row1,1)) do
            higher = Enum.at(row1,1)
            indexObj = getLastHorizontal(squares, i,higher,limit,turn,0,i)
        end
        if(i>=Enum.at(row2,0) and i<=Enum.at(row2,1)) do
            higher = Enum.at(row2,1)
            indexObj = getLastHorizontal(squares, i,higher,limit,turn,0,i)
        end 
        if(i>=Enum.at(row3,0) and i<=Enum.at(row3,1)) do
            higher = Enum.at(row3,1)
            indexObj = getLastHorizontal(squares, i,higher,limit,turn,0,i)
        end       
        if(i>=Enum.at(row4,0) and i<=Enum.at(row4,1)) do
            
            higher = Enum.at(row4,1)
            indexObj = getLastHorizontal(squares, i,higher,limit,turn,0,i)
        end
        if(i>=Enum.at(row5,0) and i<=Enum.at(row5,1)) do
            higher = Enum.at(row5,1)
            indexObj = getLastHorizontal(squares, i,higher,limit,turn,0,i)
        end
        if(i>=Enum.at(row6,0) and i<=Enum.at(row6,1)) do
            higher = Enum.at(row6,1)
            indexObj = getLastHorizontal(squares, i,higher,limit,turn,0,i)
        end
        if(i>=Enum.at(row7,0) and i<=Enum.at(row7,1)) do
            higher = Enum.at(row7,1)
            indexObj = getLastHorizontal(squares, i,higher,limit,turn,0,i)
        end
        if(i>=Enum.at(row8,0) and i<=Enum.at(row8,1)) do
            higher = Enum.at(row8,1)
            indexObj = getLastHorizontal(squares, i,higher,limit,turn,0,i)
        end
        indexObj
    end

    def changeRightHorizontal(squares,i,index,color) do
        #IO.puts("in changerighthori")
        if(i<=index) do
            #IO.puts("uska if")
            squares = changeSquareColor(squares,i,color)
            squares = changeRightHorizontal(squares,i+1,index,color)
        end
        squares
    end

    def handleEnds(squares,i,turn) do
        if(i==0) do
            if(Enum.at(squares,i+1)!=nil) do
                indexObj = getLastSquareHorizontal(squares,i,turn)
                index = indexObj.limit
                turnCount = indexObj.turnCount
                lastTurn = indexObj.lastTurn
                notAllSame = lastTurn - i
                
                if(index==lastTurn and not(notAllSame == 0)) do
                    squares = changeRightHorizontal(squares,i,index,turn)
                    valid = true
                else
                    if(lastTurn != i) do
                        squares = changeRightHorizontal(squares,i,lastTurn,turn)
                        valid = true
                    end
                end
            end
        else
            if(Enum.at(squares,i-1)!=nil) do
                indexObj = getFirstSquareHorizontal(squares,i,turn) #first filled square of that row
                index = indexObj.limit
                turnCount = indexObj.turnCount
                lastTurn = indexObj.lastTurn
                notAllSame = i - lastTurn
                IO.puts("index")
                IO.puts(index)
                IO.puts("lastturn")
                IO.puts(lastTurn)
                IO.puts("notallsame")
                IO.puts(notAllSame)
                if(index==lastTurn and notAllSame != turnCount) do
                #IO.puts("index")
                #IO.puts(index)
                #if(index >= 0) do
                    IO.puts("calling changelefthori if")
                    IO.puts(i)
                    IO.puts(index)
                    squares = changeLeftHorizontal(squares,i,index,turn)
                    valid = true
                else
                    IO.puts("calling changelefthori else")
                    IO.puts(i)
                    IO.puts(lastTurn)
                    if(lastTurn != i and notAllSame != turnCount) do
                        IO.puts("uska if")
                        squares = changeLeftHorizontal(squares,i,lastTurn,turn)
                        valid = true
                    end
                end
            end
        end
        %{
            squares: squares,
            valid: valid
        }
    end

    def handleOnlyLeft(squares,i,turn) do
        #IO.puts("will get row now")
        indexObj = getFirstSquareHorizontal(squares,i,turn) #first filled square of that row
        index = indexObj.limit
        turnCount = indexObj.turnCount
        lastTurn = indexObj.lastTurn
        notAllSame = i - lastTurn
        IO.puts("index")
        IO.puts(index)
        IO.puts("lastturn")
        IO.puts(lastTurn)
        IO.puts("notallsame")
        IO.puts(notAllSame)
        if(index==lastTurn and notAllSame != turnCount) do
        #IO.puts("index")
        #IO.puts(index)
        #if(index >= 0) do
            IO.puts("calling changelefthori if")
            IO.puts(i)
            IO.puts(index)
            squares = changeLeftHorizontal(squares,i,index,turn)
            valid = true
        else
            IO.puts("calling changelefthori else")
            IO.puts(i)
            IO.puts(lastTurn)
            if(lastTurn != i and notAllSame != turnCount) do
                IO.puts("uska if")
                squares = changeLeftHorizontal(squares,i,lastTurn,turn)
                valid = true
            end
        end
        %{
            squares: squares,
            valid: valid
        }
    end

    def handleOnlyRight(squares,i,turn) do
        #IO.puts("will get row")
        indexObj = getLastSquareHorizontal(squares,i,turn)
        index = indexObj.limit
        turnCount = indexObj.turnCount
        lastTurn = indexObj.lastTurn
        notAllSame = lastTurn - i
        
        if(index==lastTurn and notAllSame != turnCount) do
        
        #if (index>=0) do
            #IO.puts("calling changerighthori")
            squares = changeRightHorizontal(squares,i,index,turn)
            valid = true
        else
            if(lastTurn != i and notAllSame != turnCount) do
                squares = changeRightHorizontal(squares,i,lastTurn,turn)
                valid = true
            end
        end
        %{
            squares: squares,
            valid: valid
        }
    end

    def handleBothSides(squares,i,turn) do
        obj = handleOnlyLeft(squares,i,turn)
        obj = handleOnlyRight(obj.squares,i,turn)
        valid = obj.valid
        squares = obj.squares
        %{
            squares: squares,
            valid: valid
        }
    end

    def checkHorizontal(squares,i,valid,turn) do
        #IO.puts("check horizontal")
        #AVOIDS ENCOUNTERING -1 AND 64 ARRAY INDEXING
        if(i==0 or i==63) do
            obj = handleEnds(squares,i,turn)
            squares = obj.squares
            valid = obj.valid
        else
            #CHECKS IF NOTHING ON RIGHT OF IT BUT SOMETHING TO ITS LEFT
            #IO.puts("valid false")
            if(Enum.at(squares,i-1) != nil and Enum.at(squares,i+1) == nil) do
                obj = handleOnlyLeft(squares,i,turn)
                squares = obj.squares
                valid = obj.valid
            else
                #CHECKS ONLY IF NOTHING ON LEFT BUT SOMETHING ON RIGHT
                #IO.puts("checking rightside")
                if (Enum.at(squares,i-1) == nil and Enum.at(squares,i+1) != nil) do
                    obj = handleOnlyRight(squares,i,turn)
                    squares = obj.squares
                    valid = obj.valid
                else
                    #HERE GOES CODE WHEN THE BALL FALLS IN BETWEEN TWO BALLS
                    if(Enum.at(squares,i-1) != nil and Enum.at(squares,i+1) != nil) do
                        obj = handleBothSides(squares,i,turn)
                        squares = obj.squares
                        valid = obj.valid
                    end
                end
            end
        end
       
        %{
            squares: squares,
            valid: valid
        }
    end


    def getFirstSquareVertical(squares,i,limit,upLimit,turn,turnCount,lastTurn) do
        IO.puts("in getfirstsqverti")
        IO.puts("uplimi")
        IO.puts(upLimit)
        if(limit>=upLimit) do
            if(Enum.at(squares,limit)!=nil) do
                if(Enum.at(squares,i)==turn) do
                    turnCount = turnCount + 1
                    lastTurn = limit
                end
                obj = getFirstSquareVertical(squares,i,limit-8,upLimit,turn,turnCount,lastTurn)
                limit = obj.limit
                turnCount = obj.turnCount
                lastTurn = obj.lastTurn
                IO.puts("lt")
                IO.puts(lastTurn)
            end
        end
        %{
            limit: limit,
            turnCount: turnCount,
            lastTurn: lastTurn
        }
    end

    def getLastSquareVertical(squares,i,limit,downLimit,turn,turnCount,lastTurn) do
        #IO.puts("in getlastsqverti")
        #IO.puts("limit")
        #IO.puts(limit)
        if(limit<=downLimit) do
            if(Enum.at(squares,limit)!=nil) do
                if(Enum.at(squares,limit)==turn)do
                    turnCount = turnCount+1
                    lastTurn = limit
                end
                obj = getLastSquareVertical(squares,i,limit+8,downLimit,turn,turnCount,lastTurn)
                limit = obj.limit
                turnCount = obj.turnCount
                lastTurn = obj.lastTurn
            end
        end
        %{
            limit: limit,
            turnCount: turnCount,
            lastTurn: lastTurn
        }
    end

    def getUpLimit(limit) do
        if(limit-8>7) do
            limit = getUpLimit(limit-8)
        end
        limit
    end

    def getDownLimit(limit) do
        if(limit+8<64) do
            limit = getDownLimit(limit+8)
        end
        limit
    end

    def changeUpVertical(squares,i,upLimit,turn) do
        if(upLimit <= i) do
            squares = changeSquareColor(squares,i,turn)
            squares = changeUpVertical(squares,i-8,upLimit,turn)
        end
        squares
    end

    def changeDownVertical(squares,i,downLimit,turn) do
        if(downLimit >= i) do
            squares = changeSquareColor(squares,i,turn)
            squares = changeDownVertical(squares,i+8,downLimit,turn)
        end
        squares
    end

    def handleFirstLastRow(squares,i,turn) do
        if(i<8) do
            if(Enum.at(squares,i+8)!=nil) do
                limit = i+8
                downLimit = getDownLimit(i) + 8
                indexObj = getLastSquareVertical(squares,i,limit,downLimit,turn,0,i) 
                index = indexObj.limit - 8
                turnCount = indexObj.turnCount
                lastTurn = indexObj.lastTurn
                notAllSame = lastTurn - i
                if(index==lastTurn and notAllSame != turnCount) do
                    squares = changeDownVertical(squares,i,index,turn)
                    valid = true
                else
                    if(lastTurn != i and notAllSame != turnCount) do
                        squares = changeDownVertical(squares,i,lastTurn,turn)
                        valid = true
                    end
                end
            end
        else
            if(Enum.at(squares,i-8)!=nil) do
                limit = i-8
                upLimit = getUpLimit(i) - 8
                indexObj = getFirstSquareVertical(squares,i,limit,upLimit,turn,0,i)
                index = indexObj.limit + 8
                turnCount = indexObj.turnCount
                lastTurn = indexObj.lastTurn
                notAllSame = i - lastTurn
                if(index==lastTurn and notAllSame != turnCount) do
                    squares = changeUpVertical(squares,i,index,turn)
                    valid = true
                else
                    if(lastTurn != i and notAllSame != turnCount) do
                        squares = changeUpVertical(squares,i,lastTurn,turn)
                        valid = true
                    end
                end
            end
        end

        %{
            squares: squares,
            valid: valid
        }
    end

    def handleOnlyUp(squares,i,turn) do
        #IO.puts("came to up if")
        limit = i-8
        upLimit = getUpLimit(i) - 8
        indexObj = getFirstSquareVertical(squares,i,limit,upLimit,turn,0,i) 
        index = indexObj.limit + 8
        turnCount = indexObj.turnCount
        lastTurn = indexObj.lastTurn
        notAllSame = i - lastTurn
        IO.puts("index")
        IO.puts(index)
        IO.puts("lastturn")
        IO.puts(lastTurn)
        if(index==lastTurn and notAllSame != turnCount) do
            IO.puts("if lastturn==index which should be false")
            squares = changeUpVertical(squares,i,index,turn)
            valid = true
        else
            if(lastTurn != i and notAllSame != turnCount) do
                IO.puts("in else but it should not be here either")
                squares = changeUpVertical(squares,i,lastTurn,turn)
                valid = true
            end
        end
        %{
            squares: squares,
            valid: valid
        }
    end

    def handleOnlyDown(squares,i,turn) do
        #IO.puts("check down")
        limit = i+8
        downLimit = getDownLimit(i) + 8
        indexObj = getLastSquareVertical(squares,i,limit,downLimit,turn,0,i)
        index = indexObj.limit - 8
        turnCount = indexObj.turnCount
        lastTurn = indexObj.lastTurn
        #IO.puts("index")
        #IO.puts(index)
        #IO.puts("downlimit")
        #IO.puts(downLimit)
        notAllSame = lastTurn - i
        if(index==lastTurn and notAllSame != turnCount) do
            squares = changeDownVertical(squares,i,index,turn)
            valid = true
        else
            if(lastTurn != i and notAllSame != turnCount) do
                squares = changeDownVertical(squares,i,lastTurn,turn)
                valid = true
            end
        end
        %{
            squares: squares,
            valid: valid
        }
    end

    def handleUpDown(squares,i,turn) do
        obj = handleOnlyUp(squares,i,turn)
        obj = handleOnlyDown(obj.squares,i,turn)
        valid = obj.valid
        squares = obj.squares
        %{
            squares: squares,
            valid: valid
        }
    end

    def checkVertical(squares,i,valid,turn) do
        #IO.puts("in checkverti")
        #AVOIDS ARRAY INDEXING ERROR
        if(i<8 or i>63) do
            obj = handleFirstLastRow(squares,i,turn)
            squares = obj.squares
            valid = obj.valid
        else
            #CHECKS WHEN NOTHING DOWN BUT SOMETHING UP
            if(Enum.at(squares,i-8) !=nil and Enum.at(squares,i+8) == nil) do
                obj = handleOnlyUp(squares,i,turn)
                squares = obj.squares
                valid = obj.valid
            else
                #WHEN NOTHING UP BUT SOMETHING DOWN
                if(Enum.at(squares,i-8) ==nil and Enum.at(squares,i+8) != nil) do
                    obj = handleOnlyDown(squares,i,turn)
                    squares = obj.squares
                    valid = obj.valid
                else
                    #WHEN SOMETHING UP AND DOWN
                    if(Enum.at(squares,i-8) !=nil and Enum.at(squares,i+8) != nil) do
                        obj = handleUpDown(squares,i,turn)
                        squares = obj.squares
                        valid = obj.valid
                    end
                end
            end
        end
        %{
            squares: squares,
            valid: valid
        }
    end

    def checkValidMove(squares,i,valid,turn) do
        IO.puts("checkvalidmove")
        check = checkHorizontal(squares,i,valid,turn)
        check = checkVertical(check.squares,i,check.valid,turn)
        #check = checkDiagonal(check.squares,i,check.valid,turn)
    end

    def handleClickByServer(game,i) do
        squares = game.squares
        score1 = game.score1
        score2 = game.score2
        turn = game.turn

        if(Enum.at(squares,i) == nil) do
            valid = false
            obj = checkValidMove(squares,i,valid,turn)
            squares = obj.squares
            
        end

        if(turn == 0) do
            turn = 1
        else
            turn = 0
        end
        
        %{
            squares: squares,
            score1: score1,
            score2: score2,
            turn: turn
        }   
    end
end