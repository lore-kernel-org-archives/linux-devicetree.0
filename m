From: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 5/9] mtd: nand: add sunxi NAND flash
 controller support
Date: Tue, 20 May 2014 12:21:34 -0700
Message-ID: <20140520192134.GU28907@ld-irv-0074>
References: <1394647664-8258-1-git-send-email-b.brezillon.dev@gmail.com>
 <1394647664-8258-6-git-send-email-b.brezillon.dev@gmail.com>
 <20140509160341.GA6984@arch.cereza>
 <536D069A.40401@gmail.com>
 <20140520184942.GT28907@ld-irv-0074>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-sunxi+bncBCZ6PSPVXMNBBSOW52NQKGQE25TP65Y-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <20140520184942.GT28907@ld-irv-0074>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
To: Boris BREZILLON <b.brezillon.dev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Emilio =?iso-8859-1?Q?L=F3pez?= <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dev-3kdeTeqwOZ9EV1b7eY7vFQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, May 20, 2014 at 11:49:42AM -0700, Brian Norris wrote:
> On Fri, May 09, 2014 at 06:47:22PM +0200, Boris BREZILLON wrote:
> > On 09/05/2014 18:03, Ezequiel Garcia wrote:
> > > On 12 Mar 07:07 PM, Boris BREZILLON wrote:
> > >> --- /dev/null
> > >> +++ b/drivers/mtd/nand/sunxi_nand.c
> > >> @@ -0,0 +1,1276 @@
> ...
> > >> +static int sunxi_nand_ecc_init(struct mtd_info *mtd, struct nand_ecc_ctrl *ecc,
> > >> +			       struct device_node *np)
> > >> +{
> > >> +	struct nand_chip *nand = mtd->priv;
> > >> +	int ecc_step_size, ecc_strength;
> > >> +	int ret;
> > >> +
> > >> +	ecc_step_size = of_get_nand_ecc_step_size(np);
> > >> +	ecc_strength = of_get_nand_ecc_strength(np);
> > >> +	if (ecc_step_size > 0 && ecc_strength > 0) {
> > >> +		ecc->size = ecc_step_size;
> > >> +		ecc->strength = ecc_strength;
> > >> +	} else {
> > >> +		ecc->size = nand->ecc_step_ds;
> > >> +		ecc->strength = nand->ecc_strength_ds;
> > >> +	}
> > >> +
> > > Shouldn't you check the devicetree value is not weaker than the ONFI-obtained?
> > 
> > I can definitely do that.
> 
> You can do that here, but take a look at the discussion Ezequiel and I
> had about this:
> 
>   http://thread.gmane.org/gmane.linux.drivers.devicetree/67462
> 
> We probably don't want to be doing anything drastic like overriding the
> device tree configuration. Instead, we might want to stick a warning
> into the core nand_base code that does the proper comparison of the
> '*_ds' values with the actual values chosen in
> chip->ecc->{size,strength}. The comparison is kind of subtle, actually,
> so it'd be good to do it exactly once for everyone.

I forgot, Ezequiel already submitted this. I'll look at it soon:

  http://patchwork.ozlabs.org/patch/348901/

Brian
