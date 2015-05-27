#include <stdio.h>

typedef unsigned char uchar;
typedef unsigned long ulong;

ulong arr_to_ulong(uchar *p, int l) {
    ulong f = 0;
    
    while (l > 0) {
        f *= 10;
        f += *p;
        p += 1;
        l -= 1;
    }

    return f;
}

void send_more_money(uchar arr[8], ulong *send, ulong *more, ulong *money) {
    uchar tmp[5];

    // send
    tmp[0] = arr[0];
    tmp[1] = arr[2];
    tmp[2] = arr[7];
    tmp[3] = arr[5];
    *send = arr_to_ulong(tmp, 4);

    // more
    tmp[0] = arr[1];
    tmp[1] = arr[4];
    tmp[2] = arr[3];
    tmp[3] = arr[2];
    *more = arr_to_ulong(tmp, 4);

    // money
    tmp[0] = arr[1];
    tmp[1] = arr[4];
    tmp[2] = arr[7];
    tmp[3] = arr[2];
    tmp[4] = arr[6];
    *money = arr_to_ulong(tmp, 5);    
}

int present(uchar a[8], uchar i, int e) {
    int q;
    for(q=0; q<e; q+=1) {
        if (i == a[q]) {
            return 1;
        }
    }

    return 0;
}

int main() {
    uchar smerodyn[8];
    ulong send, more, money;

    uchar *f = smerodyn;

    for (f[0]=1; f[0]<10; f[0]+=1)
    for (f[1]=1; f[1]<10; f[1]+=1) if (present(smerodyn, f[1], 1)) continue; else
    for (f[2]=0; f[2]<10; f[2]+=1) if (present(smerodyn, f[2], 2)) continue; else
    for (f[3]=0; f[3]<10; f[3]+=1) if (present(smerodyn, f[3], 3)) continue; else
    for (f[4]=0; f[4]<10; f[4]+=1) if (present(smerodyn, f[4], 4)) continue; else
    for (f[5]=0; f[5]<10; f[5]+=1) if (present(smerodyn, f[5], 5)) continue; else
    for (f[6]=0; f[6]<10; f[6]+=1) if (present(smerodyn, f[6], 6)) continue; else
    for (f[7]=0; f[7]<10; f[7]+=1) if (present(smerodyn, f[7], 7)) continue; else {
        send_more_money(smerodyn, &send, &more, &money);

        if (money == send + more) {
            printf("match found: send=%d, more=%d, money=%d\n", send, more, money);
        }        
    }
}
