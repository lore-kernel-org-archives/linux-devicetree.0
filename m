From: Jassi Brar <jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 4/9] clk: Add clock driver for mb86s7x
Date: Fri, 21 Nov 2014 18:52:47 +0530
Message-ID: <CAJe_ZhcxHnoUeBUk3w=_xyk5oMAuena9RjDnyRvzLtV2=LpQxw@mail.gmail.com>
References: <1416486442-25200-1-git-send-email-Vincent.Yang@tw.fujitsu.com>
	<1416486975-25385-1-git-send-email-Vincent.Yang@tw.fujitsu.com>
	<2396055.pBuh1YtUHT@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <2396055.pBuh1YtUHT@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Vincent Yang <vincent.yang.fujitsu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org" <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Andy Green <andy.green-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Patch Tracking <patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Vincent Yang <Vincent.Yang-l16TxrwUIHTQFUHtdCDX3A@public.gmane.org>, Tetsuya Nuriya <nuriya.tetsuya-+CUm20s59erQFUHtdCDX3A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 21 November 2014 18:33, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
> On Thursday 20 November 2014 20:36:15 Vincent Yang wrote:
>> +#define __DTS_MB86S70_CLK_H
>> +
>> +#define MB86S70_CRG11_ALW      0
>> +#define MB86S70_CRG11_DDR3     1
>> +#define MB86S70_CRG11_MAIN     2
>> +#define MB86S70_CRG11_CA15     3
>> +#define MB86S70_CRG11_HDMI     4
>> +#define MB86S70_CRG11_DPHY     5
>> +
>> +#define MB86S70_CRG11_UNGPRT   8
>>
>
> The clock driver doesn't seem to use those macros at all, how does the
> driver know which clock you are referring to?
>
That was just an attempt to make a bit verbose the controller
instance. Instead of specifying controller:=4, it reads better
controller:=MB86S70_CRG11_HDMI in the clock DT nodes. The clock driver
simply fills in controller+domain+port of the given clock into mailbox
payload.

Only MB86S70_CRG11_UNGPRT is marked to mean one special (non-maskable)
port on the controller, which the clock driver does make use of.

Thanks
Jassi
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
