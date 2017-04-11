From: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v3 14/37] mtd: nand: denali: support "nand-ecc-strength"
 DT property
Date: Tue, 11 Apr 2017 09:56:37 +0200
Message-ID: <20170411095637.5aa87cf6@bbrezillon>
References: <1490856383-31560-1-git-send-email-yamada.masahiro@socionext.com>
        <1490856383-31560-15-git-send-email-yamada.masahiro@socionext.com>
        <20170330160238.59e5a2c1@bbrezillon>
        <CAK7LNARUKwMHd79ALDx_SDY9XKcHPY96xTAOMQx6XarFgwb-AA@mail.gmail.com>
        <20170331114659.4964be35@bbrezillon>
        <CAK7LNAToTmirpkhNmPCLhcTXG_SFqS762mEGK3mjyqLKXuWa1Q@mail.gmail.com>
        <20170409183301.037d3f95@bbrezillon>
        <CAK7LNARxR722uRE9SnJPuOqictrpnbFmcKBsW_g=f1OnNgvpRA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAK7LNARxR722uRE9SnJPuOqictrpnbFmcKBsW_g=f1OnNgvpRA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Cc: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Enrico Jorns <ejo-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Artem Bityutskiy <artem.bityutskiy-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Dinh Nguyen <dinguyen-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Graham Moore <grmoore-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Masami Hiramatsu <mhiramat-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Chuanxiao Dong <chuanxiao.dong-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Jassi Brar <jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>, Cyrille Pitchen <cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Masahiro,

On Tue, 11 Apr 2017 15:19:21 +0900
Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org> wrote:

> Hi Boris,
> 
> 
> 
> 2017-04-10 1:33 GMT+09:00 Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>:
> > On Mon, 3 Apr 2017 12:16:34 +0900
> > Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org> wrote:
> >  
> >> Hi Boris,
> >>
> >>
> >>
> >> 2017-03-31 18:46 GMT+09:00 Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>:
> >>  
> >> > You can try something like that when no explicit ecc.strength and
> >> > ecc.size has been set in the DT and when ECC_MAXIMIZE was not passed.
> >> >
> >> > static int
> >> > denali_get_closest_ecc_strength(struct denali_nand_info *denali,
> >> >                                 int strength)
> >> > {
> >> >         /*
> >> >          * Whatever you need to select a strength that is greater than
> >> >          * or equal to strength.
> >> >          */
> >> >
> >> >         return X;
> >> > }  
> >>
> >>
> >> Is here anything specific to Denali?  
> >
> > Well, only the denali driver knows what the hardware supports, though
> > having a generic function that takes a table of supported strengths
> > would work.
> >  
> >>
> >>  
> >> > static int denali_try_to_match_ecc_req(struct denali_nand_info *denali)
> >> > {
> >> >         struct nand_chip *chip = &denali->nand;
> >> >         struct mtd_info *mtd = nand_to_mtd(chip);
> >> >         int max_ecc_bytes = mtd->oobsize - denali->bbtskipbytes;
> >> >         int ecc_steps, ecc_strength, ecc_bytes;
> >> >         int ecc_size = chip->ecc_step_ds;
> >> >         int ecc_strength = chip->ecc_strength_ds;
> >> >
> >> >         /*
> >> >          * No information provided by the NAND chip, let the core
> >> >          * maximize the strength.
> >> >          */
> >> >         if (!ecc_size || !ecc_strength)
> >> >                 return -ENOTSUPP;
> >> >
> >> >         if (ecc_size > 512)
> >> >                 ecc_size = 1024;
> >> >         else
> >> >                 ecc_size = 512;
> >> >
> >> >         /* Adjust ECC step size based on hardware support. */
> >> >         if (ecc_size == 1024 &&
> >> >             !(denali->caps & DENALI_CAP_ECC_SIZE_1024))
> >> >                 ecc_size = 512;
> >> >         else if(ecc_size == 512 &&
> >> >                 !(denali->caps & DENALI_CAP_ECC_SIZE_512))
> >> >                 ecc_size = 1024;
> >> >
> >> >         if (ecc_size < chip->ecc_size_ds) {
> >> >                 /*
> >> >                  * When the selected size if smaller than the expected
> >> >                  * one we try to use the same strength but on 512 blocks
> >> >                  * so that we can still fix the same number of errors
> >> >                  * even if they are concentrated in the first 512bytes
> >> >                  * of a 1024bytes portion.
> >> >                  */
> >> >                 ecc_strength = chip->ecc_strength_ds;
> >> >                 ecc_strength = denali_get_closest_ecc_strength(denali,
> >> >                                                                ecc_strength);
> >> >         } else {
> >> >                 /* Always prefer 1024bytes ECC blocks when possible. */
> >> >                 if (ecc_size != 1024 &&
> >> >                     (denali->caps & DENALI_CAP_ECC_SIZE_1024) &&
> >> >                     mtd->writesize > 1024)
> >> >                         ecc_size = 1024;
> >> >
> >> >                 /*
> >> >                  * Adjust the strength based on the selected ECC step
> >> >                  * size.
> >> >                  */
> >> >                 ecc_strength = DIV_ROUND_UP(ecc_size,
> >> >                                             chip->ecc_step_ds) *
> >> >                                chip->ecc_strength_ds;
> >> >         }
> >> >
> >> >         ecc_bytes = denali_calc_ecc_bytes(ecc_size,
> >> >                                           ecc_strength);
> >> >         ecc_bytes *= mtd->writesize / ecc_size;
> >> >
> >> >         /*
> >> >          * If we don't have enough space, let the core maximize
> >> >          * the strength.
> >> >          */
> >> >         if (ecc_bytes > max_ecc_bytes)
> >> >                 return -ENOTSUPP;
> >> >
> >> >         chip->ecc.strength = ecc_strength;
> >> >         chip->ecc.size = ecc_size;
> >> >
> >> >         return 0;
> >> > }  
> >>
> >>
> >> As a whole, this does not seem to driver-specific.  
> >
> > It's almost controller-agnostic, except for the denali_calc_ecc_bytes()
> > function, but I guess we could ask drivers to implement a hook that is
> > passed the ECC step size and strength and returns the associated
> > number of ECC bytes.
> >  
> >>
> >>
> >> [1] A driver provides some pairs of (ecc_strength, ecc_size)
> >>     it can support.
> >>
> >> [2] The core framework knows the chip's requirement
> >>     (ecc_strength_ds, ecc_size_ds).
> >>
> >>
> >> Then, the core framework provides a function
> >> to return a most recommended (ecc_strength, ecc_size).
> >>
> >>
> >>
> >> struct nand_ecc_spec {
> >>        int ecc_strength;
> >>        int ecc_size;
> >> };
> >>
> >> /*
> >>  * This function choose the most recommented (ecc_str, ecc_size)
> >>  * "recommended" means: minimum ecc stregth that meets
> >>  * the chip's requirment.
> >>  *
> >>  *
> >>  * @chip   - nand_chip
> >>  * @controller_ecc_spec - Array of (ecc_str, ecc_size) supported by the
> >>                           controller. (terminated by NULL as sentinel)
> >>  */
> >> struct nand_ecc_spec * nand_try_to_match_ecc_req(struct nand_chip *chip,
> >>                                                  struct nand_ecc_spec
> >> *controller_ecc_spec)
> >> {
> >>       /*
> >>        * Return the pointer to the most recommended
> >>        * struct nand_ecc_spec.
> >>        * If nothing suitable found, return NULL.
> >>        */
> >> }
> >>  
> >
> > I like the idea, except I would do this slightly differently to avoid
> > declaring all combinations of stepsize and strengths
> >
> > struct nand_ecc_stepsize_info {
> >         int stepsize;
> >         int nstrengths;
> >         int *strengths;
> > };
> >
> > struct nand_ecc_engine_caps {
> >         int nstepsizes;
> >         struct nand_ecc_stepsize_info *stepsizes;
> >         int (*calc_ecc_bytes)(int stepsize, int strength);
> > };
> >
> > int nand_try_to_match_ecc_req(struct nand_chip *chip,
> >                               const struct nand_ecc_engine_caps *caps,
> >                               struct nand_ecc_spec *spec)
> > {
> >         /*
> >          * Find the most appropriate setting based on the ECC engine
> >          * caps and fill the spec object accordingly.
> >          * Returns 0 in case of success and a negative error code
> >          * otherwise.
> >          */
> > }
> >
> > Note that nand_try_to_match_ecc_req() has to be more generic than
> > denali_try_to_match_ecc_req() WRT step sizes, which will probably
> > complexify the logic.  
> 
> 
> After I fiddle with this generic approach for a while,
> I started to feel like giving up.

I don't get it. What was the problem with my initial suggestion (the
denali specific one, not the generic approach)? You proposed to make it
generic, which, I agree, is a bit more complicated.

> 
> I wonder if we really want over-implementation
> for covering _theoretically_ possible cases.

Okay, one more theoretical case I'd like to expose: you have board
design with different NAND parts which have different ECC requirements.
If you were about to describe the exact ECC strength you want for each
board you'll have to have different DTs. Maximizing the ECC strength
would still work, but what if the MTD user needs some OOB bytes (like
is the case with JFFS2) and ECC maximization reserved all of the
available bytes?

The other reason I prefer to have the drivers automatically guessing
what's appropriate is because then you don't have to care when writing
your DT.

> 
> In practice, there are not so many ECC settings possible
> on a single controller.
> 
> As for Denali IP, it would be theoretically possible to instantiate
> multiple ECC engines.  However, in practice, there is no sensible
> reason to do so.  At least, I do not know any real chip to support that.
> 
> So, I'd like to simplify the logic for Denali.
> 
>   - Support either 512 or 1024 ECC size.
>     If there is (ever) a controller that supports both,
>     1024 should be chosen.
> 
>   - ECC strength is not specified via DT, it is simply maximized.
> 
> This simplifies the logic much and I believe this is enough.
> 
> One more reason is, as we talked before,
> we need to match ECC setting between Linux and firmware (boot-loader),

If the bootloader implements the same logic it should match.

> so anyway we end up with using a fixed setting specified by DT.
> 

Really, I don't see what's the problem with the function I proposed,
but I'm willing to make a concession.
Make the nand-ecc-strength+nand-ecc-step-size or nand-ecc-maximize
mandatory so that if someone ever needs to support the 'match NAND
requirements' feature we won't have to add a vendor specific property
like this one [1].

Are you fine with that?

[1]http://lxr.free-electrons.com/source/Documentation/devicetree/bindings/mtd/gpmi-nand.txt#L20
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
