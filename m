From: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH v4 0/7] clk: Add common clock support for Mediatek MT8135
 and MT8173.
Date: Fri, 6 Feb 2015 11:30:33 +0100
Message-ID: <20150206103033.GS18908@pengutronix.de>
References: <1422594798-13375-1-git-send-email-henryc.chen@mediatek.com>
 <CABuKBeJSH3WzG3QC=9OoPzXE6fd9W2U67V4c19NzWcPxWR7VDg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CABuKBeJSH3WzG3QC=9OoPzXE6fd9W2U67V4c19NzWcPxWR7VDg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Henry Chen <henryc.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, srv_heupstream <srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, James Liao <jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, huang eddie <eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Vladimir Murzin <vladimir.murzin-5wv7dgnIgG8@public.gmane.org>, Ashwin Chaugule <ashwin.chaugule-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "Joe.C" <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Feb 05, 2015 at 06:24:54PM +0100, Matthias Brugger wrote:
> Hi Henry,
> 
> 2015-01-30 6:13 GMT+01:00 Henry Chen <henryc.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>:
> > This patchset contains the initial common clock support for Mediatek SoCs.
> > Mediatek SoC's clock architecture comprises of various PLLs, dividers, muxes and clock gates.
> >
> > This patchset also contains a basic clock support for Mediatek MT8135 and MT8173.
> >
> > This driver is based on 3.19-rc1 + MT8135 and MT8173 basic support.
> >
> > Changes in v2:
> > - Re-ordered patchset. Fold include/dt-bindings and DT document in 1st patch.
> >
> > Changes in v3:
> > - Rebase to 3.19-rc1.
> > - Refine code. Remove unneed functions, debug logs and comments, and fine tune error logs.
> >
> > Changes in v4:
> > - Support MT8173 platform.
> > - Re-ordered patchset. driver/clk/Makefile in 2nd patch.
> > - Extract the common part definition(mtk_gate/mtk_pll/mtk_mux) from clk-mt8135.c/clk-mt8173.c to clk-mtk.c.
> > - Refine code. Rmove unnessacary debug information and unsed defines, add prefix "mtk_" for static functions.
> > - Remove flag CLK_IGNORE_UNUSED and set flag CLK_SET_RATE_PARENT on gate/mux/fixed-factor.
> > - Use spin_lock_irqsave(&clk_ops_lock, flags) instead of mtk_clk_lock.
> > - Example above include a node for the clock controller itself, followed by the i2c controller example above.
> 
> You use pericfg and infracfg which will be used by other drivers as
> well. So please use syscon for this driver. As it is no longer a
> platform device it is present early in boot.
> The changes should look something like the patch beneath. Please
> beware that it does only show the general concept and may not even
> compile. I asked Sascha to implement the reset controller as part of
> the clk driver, as the registers addresses are mixed between both,
> clock and reset controller. Please coordinate with him to get them
> integrated (even as one series or as incremental series).

I don't really understand the "as part of the clk driver part". I now
have replaced the devm_regmap_init_mmio with syscon_node_to_regmap
in the pericfg / infracfg drivers. Is that all that you want or do you
want me to move the source code to drivers/clk/mediatek?

Sascha

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
