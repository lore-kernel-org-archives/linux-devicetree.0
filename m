From: Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCH 1/5] soc: mediatek: Add infracfg misc driver support
Date: Tue, 12 May 2015 15:26:34 +0200
Message-ID: <20150512132634.GV6325@pengutronix.de>
References: <1431372206-1237-1-git-send-email-s.hauer@pengutronix.de>
 <1431372206-1237-2-git-send-email-s.hauer@pengutronix.de>
 <1431422671.2398.155.camel@x220>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1431422671.2398.155.camel@x220>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Bolle <pebolle@tiscali.nl>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Kevin Hilman <khilman@kernel.org>, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, kernel@pengutronix.de, Matthias Brugger <matthias.bgg@gmail.com>
List-Id: devicetree@vger.kernel.org

Hi Paul,

On Tue, May 12, 2015 at 11:24:31AM +0200, Paul Bolle wrote:
> On Mon, 2015-05-11 at 21:23 +0200, Sascha Hauer wrote:
> > --- a/drivers/soc/mediatek/Kconfig
> > +++ b/drivers/soc/mediatek/Kconfig
> 
> > +config MTK_INFRACFG
> > +	tristate "MediaTek INFRACFG Support"
> > +	depends on ARCH_MEDIATEK
> > +	select REGMAP
> > +	help
> > +	  Say yes here to add support for the MediaTek INFRACFG controller. The
> > +	  INFRACFG controller contains various infrastructure registers not
> > +	  directly associated to any device.
> 
> > --- a/drivers/soc/mediatek/Makefile
> > +++ b/drivers/soc/mediatek/Makefile
> 
> > +obj-$(CONFIG_MTK_INFRACFG) += mtk-infracfg.o
> 
> > --- /dev/null
> > +++ b/drivers/soc/mediatek/mtk-infracfg.c
> 
> > +EXPORT_SYMBOL_GPL(mtk_infracfg_set_bus_protection);
> 
> > +EXPORT_SYMBOL_GPL(mtk_infracfg_clear_bus_protection);
> 
> As I understand it, if both MTK_INFRACFG and MTK_SCPSYS (see 3/5) are m
> we will get mtk-infracfg.ko and mtk-scpsys.ko (see 3/5). And loading
> mtk-scpsys.ko will trigger loading mtk-infracfg.ko, right?
> 
> But since this file has no MODULE_LICENSE() that should generate a
> warning and taint the kernel. (I haven't tested this. Please correct me
> if I'm overlooking something here.)

No, you're absolutely right here. It turned out though that the power
domain specific functions are not exported to modules and also there is
no unregistration code for power domains, so compiling this code as
modules doesn't work anyway. I'll change the tristate to bool.

Sascha

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
