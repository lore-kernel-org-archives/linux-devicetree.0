From: Boris BREZILLON <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH] mtd: nand: stm_nand_bch: add new driver
Date: Thu, 3 Jul 2014 10:05:22 +0200
Message-ID: <20140703100522.756f9715@bbrezillon>
References: <1401268805-26043-1-git-send-email-lee.jones@linaro.org>
	<20140703002237.GM3599@ld-irv-0074>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140703002237.GM3599@ld-irv-0074>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Boris BREZILLON <b.brezillon.dev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, "Gupta, Pekon\"" <pekon-l0cyMroinI0@public.gmane.org>, Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Brian,

On Wed, 2 Jul 2014 17:22:37 -0700
Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> Hi Lee,
> 
> On Wed, May 28, 2014 at 10:20:05AM +0100, Lee Jones wrote:
> > This is a squashed version of the submission to avoid re-sending the
> > entire set over and over, essentially clogging up the MLs.
> 
> Thanks. I think I'd prefer to accept your driver in a form like this
> too. A few comments below.
> 
> And I'll get one big comment out of the way here: can you abstract your
> ST BBT code into its own self-contained portion, preferably in a
> separate source file, a la nand_bbt.c? Then, provide a way to optionally
> use either your ST BBT or the existing BBT -- perhaps a NAND_BBT_ST flag
> for chip->bbt_options, and a matching device tree property. That way,
> even though you require a legacy format for bootloader interoperability,
> someone can theoretically utilize more mainstream (albeit, not
> necessarily better...) BBT support from nand_bbt.c. I think this will
> provide the best balance between your existing product support and
> upstream-friendly modularity/flexibility. I'm open to other suggestions,
> of course.
> 
> > Cc: computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
> > Cc: Gupta, Pekon" <pekon-l0cyMroinI0@public.gmane.org>
> > Cc: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> > Cc: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> > Signed-off-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> > ---
> 
> Please add versioning to your next patch(es), and describe changes here.
> 
> >  Documentation/devicetree/bindings/mtd/stm-nand.txt |   87 +
> 
> See:
> 
>   Documentation/devicetree/bindings/submitting-patches.txt
> 

[...]

> > +
> > +	nand_timing0: nand-timing {
> > +		sig-setup	= <10>;
> > +		sig-hold	= <10>;
> > +		CE-deassert	= <0>;
> > +		WE-to-RBn	= <100>;
> > +		wr-on		= <10>;
> > +		wr-off		= <30>;
> > +		rd-on		= <10>;
> > +		rd-off		= <30>;
> > +		chip-delay	= <30>;		/* delay in us */
> > +	};
> 
> You didn't document any of this node. And I don't think we want to
> specify every single timing parameter in DT; it may make sense to use
> Boris Brezillon's approach (I note this further down, in the driver
> code) for mapping non-ONFI NAND timings into a compatible ONFI timing
> mode. This will greatly simplify the bindings needed, since it's
> standardized and auto-detectable in many cases.


AFAIR, the NAND timing representation for non-ONFI chips question was
left unanswered:

https://lkml.org/lkml/2014/5/20/581

I can definitely respin my NAND timings series, but I'd like to be sure
this is how you want it done before doing so.

Just as a reminder, you and Jason thought NAND timings for non-ONFI
chips could be auto detected thanks to READID informations (by storing
some sort of "NANDID <-> timings" association table).

Best Regards,

Boris


-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
