From: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH V2 1/2] mtd: move code reading DT specified part probes
 to the core
Date: Fri, 31 Mar 2017 14:27:28 +0200
Message-ID: <20170331142728.7e9cfbb2@bbrezillon>
References: <20170330215332.32699-1-zajec5@gmail.com>
        <20170331093013.29123-1-zajec5@gmail.com>
        <20170331115654.41592eba@bbrezillon>
        <40a0f980-c849-30de-c906-a708e4d90be5@gmail.com>
        <20170331123153.038e3ada@bbrezillon>
        <99d4944c-3eb9-5bbd-efd0-2ac6862ab1fb@gmail.com>
        <20170331134151.1f08376f@bbrezillon>
        <8d0b5b57-db3e-290e-4fa0-7ff28644ae86@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <8d0b5b57-db3e-290e-4fa0-7ff28644ae86-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>, Cyrille Pitchen <cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, 31 Mar 2017 14:23:11 +0200
Rafał Miłecki <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> On 03/31/2017 01:41 PM, Boris Brezillon wrote:
> > Rafal,
> >
> > On Fri, 31 Mar 2017 12:46:38 +0200
> > Rafał Miłecki <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> >  
> >>>>> BTW, not sure the intermediate "mtd: physmap_of: use OF helpers
> >>>>> for reading strings" patch is really useful, since you move to the
> >>>>> common infrastructure here.
> >>>>> By following my suggestion you get rid of the dependency you have
> >>>>> between this series and patch "mtd: physmap_of: use OF helpers for
> >>>>> reading strings".  
> >>>>
> >>>> I learned (the very hard way) MTD people can be really nitpicking so I'm
> >>>> sending as simple patches as I can. I see it as the only way for someone from
> >>>> OpenWrt/LEDE project to get patch through your review.  
> >>>
> >>> And I learned the hard way that OpenWRT/LEDE developers tend to not
> >>> listen to our advices and keep arguing on things that have been proven
> >>> to be existing because of bad decision they made at some point in the
> >>> project life. So I think we're even :-P.  
> >>
> >> I wish you could sometimes forget what you've learned and review/discuss things
> >> without all that negative approach I keep seeing.  
> >
> > I try to stay objective, and if you look back at my review, you'll see
> > that I actually agree with most of your changes. So if one person is
> > taking it personally it's you, not me.
> >
> > Now, regarding other contributions, like support for the TRX format, I
> > keep thinking that it's badly designed and should not be supported in
> > mainline. I clearly expressed my opinion, and I also said I wouldn't
> > block the patches if other MTD maintainers were okay to take them (which
> > is already a good thing, don't you think?). But don't expect me to say
> > "Youhou, let's merge this awesome feature!".
> >
> > More generally, if you look back at all the contributions OpenWRT/LEDE
> > devs made, all uncontroversial features were merged rather quickly. For
> > the other ones, each time we tried to come up with alternative
> > solutions, but if you don't want to follow these suggestions (or at
> > least try them before saying it's impossible), then I think there's
> > nothing we can do on our side.  
> 
> Sounds fair from you, thanks. Please note I'm actually following your
> suggestions, just recently I sent RFC init for initramfs which should handle
> some of OpenWrt/LEDE hacks in user space as you told us to do this.
> 
> https://patchwork.ozlabs.org/patch/744093/

Yep, I followed the discussion you had with Richard on IRC. That's good
news.


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
