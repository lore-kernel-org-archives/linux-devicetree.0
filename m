From: Alexey Brodkin <Alexey.Brodkin-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v2] axs_nand - add driver for NAND controller used on
 Synopsys AXS dev boards
Date: Mon, 7 Apr 2014 06:14:00 +0000
Message-ID: <1396851239.4081.10.camel@abrodkin-8560l.internal.synopsys.com>
References: <1396597089-1081-1-git-send-email-abrodkin@synopsys.com>
	 <20140404140933.GA25772@arch.cereza>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140404140933.GA25772-nAQHv47ARr+vIlHkl8J1cg@public.gmane.org>
Content-Language: en-US
Content-ID: <BD837C3053AFA04AA1669049D3ECDBB9-z7JfP6tgrtVBCHUSTMH8dZqQE7yCjDx5@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org" <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "Vineet.Gupta1-HKixBCOQz3hWk0Htik3J/w@public.gmane.org" <Vineet.Gupta1-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, "Francois.Bedard-HKixBCOQz3hWk0Htik3J/w@public.gmane.org" <Francois.Bedard-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, "grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org" <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, "computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Ezequiel,

On Fri, 2014-04-04 at 11:09 -0300, Ezequiel Garcia wrote:
> On Apr 04, Alexey Brodkin wrote:
> > Signed-off-by: Alexey Brodkin <abrodkin-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
> > 
> 
> Maybe it would be nice adding some driver description here, so the commit
> log actually says something useful about the commit.

Well, I thought about it but frankly I'm not sure if there's anything
else to add to commit title "driver for NAND controller used on Synopsys
AXS dev boards".

Do you think more info may make sense?

> > +/**
> > + * axs_flag_wait_and_reset - Waits until requested flag in INT_STATUS register
> > + *              is set by HW and resets it by writing "1" in INT_CLR_STATUS.
> > + * @host:	Pointer to private data structure.
> > + * @flag:	Bit/flag offset in INT_STATUS register
> > + */
> > +static void axs_flag_wait_and_reset(struct axs_nand_host *host, int flag)
> > +{
> > +	unsigned int i;
> > +
> > +	for (i = 0; i < AXS_FLAG_WAIT_DELAY * 100; i++) {
> > +		unsigned int status = reg_get(host, INT_STATUS);
> > +
> > +		if (status & (1 << flag)) {
> > +			reg_set(host, INT_CLR_STATUS, 1 << flag);
> > +			return;
> > +		}
> > +
> > +		udelay(10);
> > +	}
> > +
> > +	/*
> > +	 * Since we cannot report this problem any further than
> > +	 * axs_nand_{write|read}_buf() letting user know there's a problem.
> > +	 */
> > +	dev_err(host->dev, "Waited too long (%d s.) for flag/bit %d\n",
> > +		AXS_FLAG_WAIT_DELAY, flag);
> > +}
> 
> Hm... I'm not sure the above is really true.
> 
> The NAND core uses the replaceable chip->waitfunc callback to check the
> status of issued commands. See for instance:
> 
> static int nand_write_oob_std(struct mtd_info *mtd, struct nand_chip *chip,
>                               int page)
> {
>         int status = 0;
>         const uint8_t *buf = chip->oob_poi;
>         int length = mtd->oobsize;
> 
>         chip->cmdfunc(mtd, NAND_CMD_SEQIN, mtd->writesize, page);
>         chip->write_buf(mtd, buf, length);
>         /* Send command to program the OOB data */
>         chip->cmdfunc(mtd, NAND_CMD_PAGEPROG, -1, -1);
> 
>         status = chip->waitfunc(mtd, chip);
> 
>         return status & NAND_STATUS_FAIL ? -EIO : 0;
> }
> 
> On the other side, if you are clearing the flags in axs_flag_wait_and_reset()
> it might be a bit hard for you to get this right.
> 
> IOW, I'm not saying you *must* do this, but instead suggesting that you take
> a look at waitfunc() and see if it helps report a proper error in the
> read/write path.

As I may understand from generic implementation of "waitfunc" in
"nand_base.c" it checks status of NAND chip itself - which IMHO makes
sense. And this is done via NAND_CMD_STATUS command sent to chip through
NAND controller.

In AXS NAND driver you may see 2 types of wait checks:
1. NAND_ISR_CMDDONE - this flag means that NAND controller has just
executed provided command (i.e. set proper signal on control lines of
NAND chip etc), but it doesn't mean NAND chip itself has completed
command execution. That's why "waitfunc" is not direct replacement here.

2. NAND_ISR_{RX|TX}DMACOMPLETE - this flag indicates completion of DMA
transfer to/from NAND chip to RAM. "waitfunc" won't work here as well.

I hope this explanation makes sense.

Regards,
Alexey
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
