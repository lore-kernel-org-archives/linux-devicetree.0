From: James Liao <jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 5/5] ARM64: MediaTek MT8173: Add SCPSYS device node
Date: Fri, 22 May 2015 13:40:10 +0800
Message-ID: <1432273210.14396.29.camel@mtksdaap41>
References: <1432131540-2523-1-git-send-email-s.hauer@pengutronix.de>
	 <1432131540-2523-6-git-send-email-s.hauer@pengutronix.de>
	 <CAGS+omDHEY54TzhNTJcFOeHkGbXAQwiTh9gxc=PsbzjwmpHEDA@mail.gmail.com>
	 <20150521174916.GQ6325@pengutronix.de>
	 <1432262503.14396.14.camel@mtksdaap41>
	 <CAGS+omB4j0YyTP5e4q_jXY2TOA1MTD-dPvsKJMAmj5NooWHxeQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAGS+omB4j0YyTP5e4q_jXY2TOA1MTD-dPvsKJMAmj5NooWHxeQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "open list:OPEN FIRMWARE AND..." <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Kevin Hilman <khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Sasha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Daniel,

On Fri, 2015-05-22 at 12:19 +0800, Daniel Kurtz wrote:
> On Fri, May 22, 2015 at 10:41 AM, James Liao <jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org> wrote:
> >
> > Sascha is right. I had confirmed with our designer that MFG on MT8173
> > uses clk26m to check state. I also tested MFG domain power on/off with
> > CLK_TOP_MFG_SEL off and it worked correctly.
> 
> Wait - the designer said to use clk26m, but you tested with CLK_TOP_MFG_SEL.
> Now I am even more confused.
> Which is the correct clock to use for the mfg power domains?

I tested MFG domain power on/off with MFG_SEL "OFF". If MFG domain use
MFG_SEL as its bus clock, it will be timeout while waiting SRAM ACK. But
in my test, MFG power domain can power on/off without MFG_SEL. That
means it doesn't need MFG_SEL while power on/off MFG domains.

> >
> > My patch set yesterday add subsystem clocks, which are not needed by
> > power domain on/off. So I think these 2 patch set are independent.
> 
> In other versions of the SCPSYS patch set, the scpsys node has
> additional "subsystem bus clocks".

That's my fault because I provided wrong information to Sascha. So in
his early version of mtk-scpsys driver, the clocks setting of power
domains are incorrect. The correct clock setting for each power domain
should be:

POWER_DOMAIN_MFG:     clk26m (no need to enable topckgen clocks)
POWER_DOMAIN_DISP:    mm_sel
POWER_DOMAIN_VDEC:    mm_sel
POWER_DOMAIN_VENC:    mm_sel
POWER_DOMAIN_VENC_LT: mm_sel
POWER_DOMAIN_ISP:     mm_sel

> So will we need additional patches later to add back these additional
> clocks which have been removed from the current version of this pach?

No. Clocks provided by topckgen are enough for scpsys driver. Please see
my comments below.

> In other words, will there be a follow up patch like below, plus
> another patch to add these clocks to "enum clk_id":
> 
> @@ -163,9 +163,12 @@
>   compatible = "mediatek,mt8173-scpsys";
>   #power-domain-cells = <1>;
>   reg = <0 0x10006000 0 0x1000>;
> - clocks = <&clk26m>,
> - <&topckgen CLK_TOP_MM_SEL>;
> - clock-names = "mfg", "mm";
> + clocks = <&topckgen CLK_TOP_MFG_SEL>,
> + <&topckgen CLK_TOP_MM_SEL>,
> + <&topckgen CLK_TOP_VDEC_SEL>,
> + <&topckgen CLK_TOP_VENC_SEL>,
> + <&topckgen CLK_TOP_VENC_LT_SEL>;
> + clock-names = "mfg", "mm", "vdec", "venc", "venc_lt";
>   infracfg = <&infracfg>;
>   };

These clocks come from topckgen. In our term, they are "top clocks".
Subsystem clocks which mentioned in my patch set are provided by
subsystems such as mmsys, vdecsys, vencsys and so on.


Best regards,

James

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
