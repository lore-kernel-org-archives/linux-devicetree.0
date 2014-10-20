From: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v6 1/2] mtd: nand: add sunxi NAND flash
 controller support
Date: Mon, 20 Oct 2014 14:29:15 +0200
Message-ID: <20141020142915.5bebeb2c@bbrezillon>
References: <1413805520-14947-1-git-send-email-boris.brezillon@free-electrons.com>
	<1413805520-14947-2-git-send-email-boris.brezillon@free-electrons.com>
	<5444F9AF.5000104@gmail.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-sunxi+bncBCIPJ6FA2QLBBH4ASSRAKGQE6JGDKUI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <5444F9AF.5000104-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Varka Bhadram <varkabhadram-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Yassin Jaffer <yassinjaffer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Varka,

On Mon, 20 Oct 2014 17:31:51 +0530
Varka Bhadram <varkabhadram-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> On 10/20/2014 05:15 PM, Boris Brezillon wrote:
> > Add support for the sunxi NAND Flash Controller (NFC).
> >
> (...)
> 
> > +
> > +static int sunxi_nfc_dev_ready(struct mtd_info *mtd)
> > +{
> > +	struct nand_chip *nand = mtd->priv;
> > +	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
> > +	struct sunxi_nfc *nfc = to_sunxi_nfc(sunxi_nand->nand.controller);
> > +	struct sunxi_nand_rb *rb;
> > +	unsigned long timeo = (sunxi_nand->nand.state == FL_ERASING ? 400 : 20);
> > +	int ret;
> > +
> > +	if (sunxi_nand->selected < 0)
> > +		return 0;
> > +
> > +	rb = &sunxi_nand->sels[sunxi_nand->selected].rb;
> > +
> > +	switch (rb->type) {
> > +	case RB_NATIVE:
> > +		ret = !!(readl(nfc->regs + NFC_REG_ST) &
> > +			 (NFC_RB_STATE0 << rb->info.nativeid));
> > +		if (ret)
> > +			break;
> > +
> > +		sunxi_nfc_wait_int(nfc, NFC_RB_B2R, timeo);
> > +		ret = !!(readl(nfc->regs + NFC_REG_ST) &
> > +			 (NFC_RB_STATE0 << rb->info.nativeid));
> > +		break;
> > +	case RB_GPIO:
> > +		ret = gpio_get_value(rb->info.gpio);
> > +		break;
> > +	case RB_NONE:
> > +	default:
> > +		ret = 0;
> > +		pr_err("cannot check R/B NAND status!");
> 
> Missed terminating  new line...  :-)

I'll fix that.

> 
> > +		break;
> > +	}
> > +
> > +	return ret;
> > +}
> > +
> > +
> 
> (...)
> 
> > +static struct platform_driver sunxi_nfc_driver = {
> > +	.driver = {
> > +		.name = "sunxi_nand",
> > +		.owner = THIS_MODULE,
> 
> This field updated by module_platform_driver()..

Yep, I'll remove this line.

Thanks for your review.

Best Regards,

Boris


-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
