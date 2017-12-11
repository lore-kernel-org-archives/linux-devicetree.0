From: Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
Subject: Re: [PATCH 02/20] dt-bindings: gpio: Add ASPEED constants
Date: Mon, 11 Dec 2017 21:13:58 +1030
Message-ID: <CACPK8XekveEuX5vNv7uGVmSEqwLmQMqfdikV4F+xAiwmH9zkxQ@mail.gmail.com>
References: <20171211050704.20621-1-joel@jms.id.au> <20171211050704.20621-3-joel@jms.id.au>
 <CAK8P3a17iWxJVv=f+=w+4sS7zWimxMSD5+Gz9qC5ms-RrcQneg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAK8P3a17iWxJVv=f+=w+4sS7zWimxMSD5+Gz9qC5ms-RrcQneg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Andrew Jeffery <andrew-zrmu5oMJ5Fs@public.gmane.org>, Patrick Venture <venture-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Xo Wang <xow-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Lei YU <mine260309-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg-Bxea+6Xhats@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Jeremy Kerr <jk-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>, DTML <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux ARM <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-aspeed-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Dec 11, 2017 at 6:26 PM, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
> On Mon, Dec 11, 2017 at 6:06 AM, Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org> wrote:
>> These are used to by the device tree to map pin numbers to constants
>> required by the GPIO bindings.
>> +
>> +#define ASPEED_GPIO_PORT_A 0
>> +#define ASPEED_GPIO_PORT_B 1
>> +#define ASPEED_GPIO_PORT_C 2
>> +#define ASPEED_GPIO_PORT_D 3
>> +#define ASPEED_GPIO_PORT_E 4
>> +#define ASPEED_GPIO_PORT_F 5
>> +#define ASPEED_GPIO_PORT_G 6
>> +#define ASPEED_GPIO_PORT_H 7
>> +#define ASPEED_GPIO_PORT_I 8
>> +#define ASPEED_GPIO_PORT_J 9
>> +#define ASPEED_GPIO_PORT_K 10
>> +#define ASPEED_GPIO_PORT_L 11
>> +#define ASPEED_GPIO_PORT_M 12
>> +#define ASPEED_GPIO_PORT_N 13
>> +#define ASPEED_GPIO_PORT_O 14
>> +#define ASPEED_GPIO_PORT_P 15
>> +#define ASPEED_GPIO_PORT_Q 16
>> +#define ASPEED_GPIO_PORT_R 17
>> +#define ASPEED_GPIO_PORT_S 18
>> +#define ASPEED_GPIO_PORT_T 19
>> +#define ASPEED_GPIO_PORT_U 20
>> +#define ASPEED_GPIO_PORT_V 21
>> +#define ASPEED_GPIO_PORT_W 22
>> +#define ASPEED_GPIO_PORT_X 23
>> +#define ASPEED_GPIO_PORT_Y 24
>> +#define ASPEED_GPIO_PORT_Z 25
>> +#define ASPEED_GPIO_PORT_AA 26
>> +#define ASPEED_GPIO_PORT_AB 27
>> +#define ASPEED_GPIO_PORT_AC 28
>
> This looks like a 1:1 mapping, wouldn't it be easier to just describe
> it in the binding document?

You're right, it is a linear mapping. We use it so references to GPIO
numbers are human readable in the device tree:

#define ASPEED_GPIO(port, offset) \
        ((ASPEED_GPIO_PORT_##port * 8) + offset)

can be used:

                identify {
                        gpios = <&gpio ASPEED_GPIO(A, 2) GPIO_ACTIVE_LOW>;
                };

We find that has cut down on mistakes in calculating offsets into GPIO banks.

Cheers,

Joel
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
