From: Anup Patel <anup.patel-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: RE: [PATCH 3/5] mtd: brcmnand: Optional DT flag to reset IPROC NAND
 controller
Date: Mon, 5 Oct 2015 06:27:16 +0000
Message-ID: <39063E8F96E11742B35A201CC5D095B7AD54C1@SJEXCHMB10.corp.ad.broadcom.com>
References: <1443808606-21203-1-git-send-email-anup.patel@broadcom.com>
 <1443808606-21203-4-git-send-email-anup.patel@broadcom.com>
 <20151004214943.GA28904@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20151004214943.GA28904@localhost>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Pramod Kumar <pramodku-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Vikram Prakash <vikramp-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Sandeep Tripathy <tripathy-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, bcm-kernel-feedback-list <bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Rafal
List-Id: devicetree@vger.kernel.org



> -----Original Message-----
> From: Brian Norris [mailto:computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org]
> Sent: 05 October 2015 03:20
> To: Anup Patel
> Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org; Rob Herring; Pawel Moll; Mark
> Rutland; Ian Campbell; Kumar Gala; Catalin Marinas; Will Deacon; David
> Woodhouse; Ray Jui; Scott Branden; Florian Fainelli; Pramod Kumar; Vikram
> Prakash; Sandeep Tripathy; devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; linux-
> kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org; bcm-kernel-feedback-
> list; Rafal Milecki
> Subject: Re: [PATCH 3/5] mtd: brcmnand: Optional DT flag to reset IPROC NAND
> controller
> 
> + Rafal (to extend this mighty CC list)
> 
> On Fri, Oct 02, 2015 at 11:26:44PM +0530, Anup Patel wrote:
> > The BRCM NAND controller on NS2 SoC requires a reset to cleanup
> > previously configured NAND controller state.
> >
> > This patch adds optional boolean device tree flag named
> > "brcm,nand-iproc-reset". If this flag is present in NAND controller DT
> > node then BRCM IPROC NAND driver will reset the NAND controller before
> > any commands are issued.
> 
> Is there a reason not to do this reset unconditionally? I recall this came up in
> discussion previously, when the OpenWRT folks were trying to integrate with
> BCMA, where this reset was one of the few differences between the platform-
> device-based driver (i.e., this one) and the BCMA based driver. Might it help
> simplify things a bit if we just did the same thing everywhere?

This driver is currently shared by Cygnus and NS2.

We had similar suggestion when this patch was reviewed
internally in Broadcom.

The rationale for adding optional DT flag is as follows:
1. The NAND controller reset is currently required for NS2 only so
that it is in sane state before any NAND commands are issued. We
are not sure if Cygnus and all future iProc SoCs will require NAND
controller reset.
2. The NAND controller reset in probe would certainly increase
Linux boot time so for certain iProc SoCs we might choose avoid
NAND controller reset to reduce boot time if possible.

Regards
Anup

> 
> Brian
> 
> > Signed-off-by: Anup Patel <anup.patel-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
> > Reviewed-by: Pramod KUMAR <pramodku-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
> > Reviewed-by: Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
> > Reviewed-by: Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
> > ---
> >  drivers/mtd/nand/brcmnand/iproc_nand.c | 19 +++++++++++++++++++
> >  1 file changed, 19 insertions(+)
> >
> > diff --git a/drivers/mtd/nand/brcmnand/iproc_nand.c
> > b/drivers/mtd/nand/brcmnand/iproc_nand.c
> > index 683495c..d837207 100644
> > --- a/drivers/mtd/nand/brcmnand/iproc_nand.c
> > +++ b/drivers/mtd/nand/brcmnand/iproc_nand.c
> > @@ -11,6 +11,7 @@
> >   * GNU General Public License for more details.
> >   */
> >
> > +#include <linux/delay.h>
> >  #include <linux/device.h>
> >  #include <linux/io.h>
> >  #include <linux/ioport.h>
> > @@ -35,6 +36,10 @@ struct iproc_nand_soc_priv {
> >  #define IPROC_NAND_APB_LE_MODE             BIT(24)
> >  #define IPROC_NAND_INT_CTRL_READ_ENABLE    BIT(6)
> >
> > +#define IPROC_NAND_RESET_OFFSET            0x3f8
> > +#define IPROC_NAND_RESET_BIT_SHIFT         0
> > +#define IPROC_NAND_RESET_BIT
> BIT(IPROC_NAND_RESET_BIT_SHIFT)
> > +
> >  static bool iproc_nand_intc_ack(struct brcmnand_soc *soc)  {
> >  	struct iproc_nand_soc_priv *priv = soc->priv; @@ -93,6 +98,7 @@
> > static void iproc_nand_apb_access(struct brcmnand_soc *soc, bool
> > prepare)
> >
> >  static int iproc_nand_probe(struct platform_device *pdev)  {
> > +	u32 reset;
> >  	struct device *dev = &pdev->dev;
> >  	struct iproc_nand_soc_priv *priv;
> >  	struct brcmnand_soc *soc;
> > @@ -124,6 +130,19 @@ static int iproc_nand_probe(struct platform_device
> *pdev)
> >  	soc->ctlrdy_set_enabled = iproc_nand_intc_set;
> >  	soc->prepare_data_bus = iproc_nand_apb_access;
> >
> > +	if (of_property_read_bool(dev->of_node, "brcm,nand-iproc-reset")) {
> > +		/* Put controller in reset and wait 10 usecs */
> > +		reset = readl(priv->idm_base + IPROC_NAND_RESET_OFFSET);
> > +		reset |= IPROC_NAND_RESET_BIT;
> > +		writel(reset, priv->idm_base + IPROC_NAND_RESET_OFFSET);
> > +		udelay(10);
> > +		/* Bring controller out of reset and wait 10 usecs */
> > +		reset = readl(priv->idm_base + IPROC_NAND_RESET_OFFSET);
> > +		reset &= ~IPROC_NAND_RESET_BIT;
> > +		writel(reset, priv->idm_base + IPROC_NAND_RESET_OFFSET);
> > +		udelay(10);
> > +	}
> > +
> >  	return brcmnand_probe(pdev, soc);
> >  }
> >
> > --
> > 1.9.1
> >
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
