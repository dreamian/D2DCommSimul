void InsertNumber()
{
    
    int flag[N+1] = { 0, };
    int n[N] = { 0, };
 
    // 난수 생성기 시드 지정
    srand((unsigned int)time(NULL));
 
    int count = 0;
    do
    {
        int number = (rand() % N_COUNT) + 1;
        if( flag[number] == 0 )
        {
            n[count] = number;
            flag[number] = 1;
            count++;
        }
    }
    while( count < N_MAX );
 
    for(int i=0; i < N_COUNT; ++i )
        printf( "%d ", n[i] );
 
    printf("\n");
}