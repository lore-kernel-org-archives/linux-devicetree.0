From: Jassi Brar <jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 7/9] dt: mb86s7x: add dt files for MB86S7x evbs
Date: Fri, 21 Nov 2014 23:05:28 +0530
Message-ID: <CAJe_Zhee6XG5=izSccDDmL4cTyXLeYO3EdaUA=inmrV5MdF12Q@mail.gmail.com>
References: <1416486442-25200-1-git-send-email-Vincent.Yang@tw.fujitsu.com>
	<2581182.ZW92kSfUJp@wuerfel>
	<CAJe_ZhfJBftYd7oYNqUsgZsVZS8ccRA5XngJ=msRnt7RSE+C2Q@mail.gmail.com>
	<6351620.x1OFSWlVbH@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <6351620.x1OFSWlVbH@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Vincent Yang <vincent.yang.fujitsu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Andy Green <andy.green-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, "ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org" <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Patch Tracking <patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Vincent Yang <Vincent.Yang-l16TxrwUIHTQFUHtdCDX3A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Tetsuya Nuriya <nuriya.tetsuya-+CUm20s59erQFUHtdCDX3A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 21 November 2014 22:39, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
> On Friday 21 November 2014 22:19:43 Jassi Brar wrote:
>> >
>> > This seems weird: rather than have one clock controller node per
>> > clock source, why not just have one node with #clock-cells = >?
>> >
>> > Your controller seems perfectly capable of this, and you even
>> > put the numbers in the label. It would be much more straightforward
>> > to do
>> >
>> >         clocks = <&clk_alw 0 1>;
>> >
>> > than
>> >
>> >         clocks = <&clk_alw_0_1>;
>> >
>> > here. Possibly even
>> >
>> >         clocks = <&clk MB86S70_CRG11_ALW 0 1>;
>> >
>> > with #clock-cells = >
>> >
>> Is there a way to compact the dtsi and yet populate only clocks that
>> are actually ever used (instead of 6x16x9)?
>
> I believe the clock driver just wouldn't create the clocks until
> a device driver requests them.
>
Seems like the chicken-egg problem. Let me check.

Thanks
Jassi
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
