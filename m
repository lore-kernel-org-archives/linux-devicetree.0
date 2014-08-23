From: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: Re: [PATCH 6/6] ARM: dts: hummingboard: gpio-ir on gpio 3,5
Date: Sat, 23 Aug 2014 14:36:49 +0100
Message-ID: <20140823133649.GP30401@n2100.arm.linux.org.uk>
References: <20140823091058.GO30401@n2100.arm.linux.org.uk> <E1XL7MR-0002yX-6N@rmk-PC.arm.linux.org.uk> <CAOMZO5C=xyYLLBX1PDsJQ9NwzXZxCWTvPMTUWzYcoohOOvA_qA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAOMZO5C=xyYLLBX1PDsJQ9NwzXZxCWTvPMTUWzYcoohOOvA_qA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Shawn Guo <shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sat, Aug 23, 2014 at 10:32:23AM -0300, Fabio Estevam wrote:
> On Sat, Aug 23, 2014 at 6:11 AM, Russell King
> <rmk+kernel-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org> wrote:
> 
> > -                               MX6QDL_PAD_GPIO_2__GPIO1_IO02 0x80000000
> > +                               MX6QDL_PAD_EIM_DA5__GPIO3_IO05 0x80000000
> 
> It would be better to replace the '0x80000000' with the real iomux
> value (like 0x1b0b0 for example), so that we do not need to rely on
> the bootloader doing the correct configuration for us.

I'd just end up choosing something which appears to work - I've no idea
at present what an appropriate value should be here.

-- 
FTTC broadband for 0.8mile line: currently at 9.5Mbps down 400kbps up
according to speedtest.net.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
