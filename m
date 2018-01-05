From: Jassi Brar <jaswinder.singh@linaro.org>
Subject: Re: [PATCHv5 2/3] net: socionext: Add Synquacer NetSec driver
Date: Fri, 5 Jan 2018 22:23:21 +0530
Message-ID: <CAJe_Zhe6OkvTiGz=q8XFN0Sedd7EDPKWV2rt67p8zt-+uozyzQ@mail.gmail.com>
References: <1514783559-4226-1-git-send-email-jassisinghbrar@gmail.com>
 <1514783689-4352-1-git-send-email-jassisinghbrar@gmail.com> <20180103.103546.528269429969753470.davem@davemloft.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20180103.103546.528269429969753470.davem@davemloft.net>
Sender: netdev-owner@vger.kernel.org
To: David Miller <davem@davemloft.net>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, netdev@vger.kernel.org, Devicetree List <devicetree@vger.kernel.org>, Arnd Bergmann <arnd.bergmann@linaro.org>, Andrew Lunn <andrew@lunn.ch>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Masami Hiramatsu <masami.hiramatsu@linaro.org>
List-Id: devicetree@vger.kernel.org

On 3 January 2018 at 21:05, David Miller <davem@davemloft.net> wrote:
> From: jassisinghbrar@gmail.com
> Date: Mon,  1 Jan 2018 10:44:49 +0530
>
>> +#define DRING_TAIL(r)                ((r)->tail)
>> +
>> +#define DRING_HEAD(r)                ((r)->head)
>
> These macros do not help readability at all.
>
>> +#define MOVE_TAIL(r)         do { \
>> +                                     if (++(r)->tail == DESC_NUM) \
>> +                                             (r)->tail = 0; \
>> +                             } while (0)
>> +
>> +#define MOVE_HEAD(r)         do { \
>> +                                     if (++(r)->head == DESC_NUM) \
>> +                                             (r)->head = 0; \
>> +                             } while (0)
>> +
>> +#define JUMP_HEAD(r, n)      do { \
>> +                                     int i; \
>> +                                     for (i = 0; i < (n); i++) \
>> +                                             MOVE_HEAD(r); \
>> +                             } while (0)
>
> Neither do these.
>
OK, I have removed these.

> And JUMP_HEAD is so inefficient, it's a constant time calculation:
>
>         r->head += n;
>         if (r->head >= DESC_NUM)
>                 r->head -= DESC_NUM;
>
How about the more compact    r->head = (r->head + n) % DESC_NUM

> All of this stuff can be done inline without all of these CPP macros
> which are discouraged, have multiple evaluation issues, and decrease
> the amount of type checking going on.
>
> If you absolutely must have helpers, use static functions (without
> the inline keyword, let the compiler device).
>
>> +static inline int available_descs(struct netsec_desc_ring *r)
>
> No inline functions in foo.c files, let the compiler device.
>
OK. I have already started selling it downstream.

>> +/*************************************************************/
>> +/*********************** NETDEV_OPS **************************/
>> +/*************************************************************/
>
> Please, comments are not billboards or Star Wars openning sequences.
> Simplify this, thank you.
>
Done  :)

>> +
>> +static void netsec_set_tx_de(struct netsec_priv *priv,
>> +                          struct netsec_desc_ring *dring,
>> +                          const struct netsec_tx_pkt_ctrl *tx_ctrl,
>> +                          const struct netsec_desc *desc,
>> +                          struct sk_buff *skb)
>> +{
>> +     struct netsec_de *de;
>> +     int idx = DRING_HEAD(dring);
>> +     u32 attr;
>
> Please order local variables from longest to shortest line.
>
> Please audit your entire submission for this issue.
>
That was the only occurrence. I already am particular about following
that style.

Thank you.
