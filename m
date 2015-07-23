From: Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: Add STM32429i-EVAL board support
Date: Thu, 23 Jul 2015 07:16:22 +0200
Message-ID: <CALszF6ALmeVv+T_TkL9AKu_XqDe2=5REpyOriKsq_rgA1ww51g@mail.gmail.com>
References: <1436693957-30855-1-git-send-email-mcoquelin.stm32@gmail.com>
	<CAOesGMjLBwQgfm=nP+qTD9J8mfdoDb1PYCJ5cv2rT10+QY539Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAOesGMjLBwQgfm=nP+qTD9J8mfdoDb1PYCJ5cv2rT10+QY539Q-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Kevin Hilman <khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Daniel Thompson <daniel.thompson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Kamil Lulko <rev13-5tc4TXWwyLM@public.gmane.org>, =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Olof,

2015-07-23 1:42 GMT+02:00 Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>:
> Hi,
>
> On Sun, Jul 12, 2015 at 2:39 AM, Maxime Coquelin
> <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>
>> +/ {
>> +       model = "STMicroelectronics STM32429i-EVAL board";
>> +       compatible = "st,stm32429i-eval", "st,stm32f429";
>> +
>> +       chosen {
>> +               bootargs = "console=ttyS0,115200 root=/dev/ram rdinit=/linuxrc";
>> +               linux,stdout-path = &usart1;
>
> You should use stdout-path here instead, and with that you'll no
> longer need the console arg in the bootargs.
>
> See: https://www.kernel.org/doc/Documentation/devicetree/bindings/chosen.txt

Thanks for the hint! I was not aware of that.

I will send the new pull request fixing this, and also fixing
STM32F429 Discovery board shortly.

Thanks,
Maxime
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
