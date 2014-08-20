From: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Specifying the console device using an alias
Date: Wed, 20 Aug 2014 14:39:38 -0300
Message-ID: <CAOMZO5BcMjSV+cgLq1+AF8+n+rzTtSm51yu7Guw+z+Bs6s=EGA@mail.gmail.com>
References: <CAPnjgZ2A=DkGSnFLy1En8bH0pZAUAEWCWz_jQ941g3QQEUN9NQ@mail.gmail.com>
	<CAPnjgZ1S-HVZJ7kzt=YKT+jjZEtLdmZSnr6kmNVf+paGKdrgoQ@mail.gmail.com>
	<20140818191909.GA5352@pengutronix.de>
	<CAPnjgZ3YU8zy48UrxByZjY5rkK3mK7Quvi6O3kWtBfW6ttG6VA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAPnjgZ3YU8zy48UrxByZjY5rkK3mK7Quvi6O3kWtBfW6ttG6VA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Devicetree Discuss <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Aug 20, 2014 at 2:25 PM, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> wrote:

> Yes, I see that, but linux doesn't use it AFAICT. Are you suggesting
> that U-Boot should? Or should we use 'u-boot,stdout-path' in /chosen?
> See my question immediately above about /chosen.

Linux use stdout-path property specified, without linux prefix.

Check for example:
https://git.kernel.org/cgit/linux/kernel/git/stable/linux-stable.git/tree/arch/arm/boot/dts/imx6qdl-sabresd.dtsi?id=refs/tags/v3.16.1

/ {
chosen {
stdout-path = &uart1;
};
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
