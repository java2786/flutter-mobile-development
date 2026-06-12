import "dart:io";

int n = 8;

void main(){
    // triangle1();
    // triangle2();
    // triangle3();
    // triangle4();
    // triangle4_2();
    W_pattern();
}

void triangle1(){
    for(int i=1;i<=n;i++){
        String stars = "";
        for(int j=1;j<=i;j++){
            stars = stars + "* ";
        }
        print(stars);
    }

}
void triangle2(){
    for(int i=1;i<=n;i++){
        String stars = "";
        for(int j=n;j>=i;j--){
            stars = stars + "* ";
        }
        print(stars);
    }
}
void triangle3(){
    for(int i=1;i<=n;i++){
        String stars = "";
        for(int j=n;j>i;j--){
            stars = stars + ". ";
        }
        for(int j=1;j<=i;j++){
            stars = stars + "* ";
        }
        print(stars);
        // stdin.readLineSync();
    }

}

void triangle4(){
    for(int i=1;i<=n;i++){
        String stars = "";
        for(int j=i;j<n;j++){
            stars = stars + "  ";
        }
        for(int j=1;j<=i;j++){
            stars = stars + "* ";
        }
        for(int j=1;j<i;j++){
            stars = stars + "* ";
        }
        
        print(stars);
    }

 
}

void triangle4_2(){
    for(int i=1;i<=n;i++){
        String stars = "";
        for(int j=i;j<n;j++){
            stars = stars + "  ";
        }
        for(int j=1;j<i*2;j++){
            stars = stars + "* ";
        }
        
        print(stars);
    }

 
}


void W_pattern(){
    /*

* * * * * * * * * * *
* * * * *   * * * * *
* * * *       * * * *
* * *           * * *
* *               * *
*                   *

    */

    int num = 4;
    for(int i=1;i<=num;i++){
        String line = "";
        for(int stars=i;stars<=num;stars++){
            line = line + "* ";
        }

        // for(int space=1;space<i;space++){
        //     line = line + ". ";
        // }
        // for(int space=1;space<i;space++){
        //     line = line + ". ";
        // }
        for(int space=1;space<(2*i)-1;space++){
            line = line + ". ";
        }

        for(int stars=i;stars<=num;stars++){
            line = line + "* ";
        }
        print(line);
    }
}