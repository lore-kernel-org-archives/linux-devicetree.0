From: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v7 1/2] mtd: nand: add sunxi NAND flash
 controller support
Date: Wed, 29 Oct 2014 14:02:51 +0100
Message-ID: <20141029140251.142fed10@bbrezillon>
References: <1413896922-11680-1-git-send-email-boris.brezillon@free-electrons.com>
	<1413896922-11680-2-git-send-email-boris.brezillon@free-electrons.com>
	<20141028181310.GA23619@ld-irv-0074>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCIPJ6FA2QLBB76KYORAKGQE274YC4I-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <20141028181310.GA23619@ld-irv-0074>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Yassin Jaffer <yassinjaffer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Brian,

On Tue, 28 Oct 2014 11:13:11 -0700
Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> Hi Boris,
> 
> On Tue, Oct 21, 2014 at 03:08:41PM +0200, Boris Brezillon wrote:
> > +static int sunxi_nand_hw_ecc_ctrl_init(struct mtd_info *mtd,
> > +				       struct nand_ecc_ctrl *ecc,
> > +				       struct device_node *np)
> > +{
> > +	struct nand_ecclayout *layout;
> > +	int i, j;
> > +	int ret;
> > +
> > +	ret = sunxi_nand_hw_common_ecc_ctrl_init(mtd, ecc, np);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ecc->read_page = sunxi_nfc_hw_ecc_read_page;
> > +	ecc->write_page = sunxi_nfc_hw_ecc_write_page;
> > +	layout = ecc->layout;
> > +
> > +	for (i = 0; i < ecc->steps; i++) {
> 
> Hmm, did you retest this since changing this to ecc->steps? I think this
> won't work, since ecc->steps is only initialized in nand_scan_tail(),
> which comes after this. I only recommended the change for the
> {read,write}_page() type of functions, not the initialization functions.
> 
> [snip the rest]
> 
> So I'd suggest the following additional patch, and otherwise, the series
> is fine with me. If you give your ack, I can just squash this in and
> apply it to my tree:

It works, you can squash those changes into my first patch.

Thanks,

Boris

-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
