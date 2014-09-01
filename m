From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: Specifying the console device using an alias
Date: Mon, 1 Sep 2014 13:08:10 -0700
Message-ID: <CAPnjgZ0W3NQFBheb4YhERnhzhtv+NJWKX6w3vkZEMvMnHyb=ow@mail.gmail.com>
References: <CAPnjgZ2A=DkGSnFLy1En8bH0pZAUAEWCWz_jQ941g3QQEUN9NQ@mail.gmail.com>
	<CAPnjgZ1S-HVZJ7kzt=YKT+jjZEtLdmZSnr6kmNVf+paGKdrgoQ@mail.gmail.com>
	<20140818191909.GA5352@pengutronix.de>
	<CAPnjgZ3YU8zy48UrxByZjY5rkK3mK7Quvi6O3kWtBfW6ttG6VA@mail.gmail.com>
	<CAOMZO5BcMjSV+cgLq1+AF8+n+rzTtSm51yu7Guw+z+Bs6s=EGA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAOMZO5BcMjSV+cgLq1+AF8+n+rzTtSm51yu7Guw+z+Bs6s=EGA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Devicetree Discuss <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Fabio,

On 20 August 2014 10:39, Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Wed, Aug 20, 2014 at 2:25 PM, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> wrote:
>
>> Yes, I see that, but linux doesn't use it AFAICT. Are you suggesting
>> that U-Boot should? Or should we use 'u-boot,stdout-path' in /chosen?
>> See my question immediately above about /chosen.
>
> Linux use stdout-path property specified, without linux prefix.
>
> Check for example:
> https://git.kernel.org/cgit/linux/kernel/git/stable/linux-stable.git/tree/arch/arm/boot/dts/imx6qdl-sabresd.dtsi?id=refs/tags/v3.16.1
>
> / {
> chosen {
> stdout-path = &uart1;
> };

OK great. This seems to have happened very recently in Linux. I was
looking at 3.14 but I see that in the current master about half of the
.dts files have droped the 'linux' prefix.

So assuming that the U-Boot console should be the same as Linux, then
it sounds like it is OK to use this feature. That's good enough to get
me going.

Thanks,
Simon
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
