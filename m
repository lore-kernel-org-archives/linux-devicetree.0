From: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH] mtd: nand: denali: allow to override max_banks from DT
 property
Date: Tue, 29 Mar 2016 09:53:05 +0200
Message-ID: <20160329095305.46229ad5@bbrezillon>
References: <1458822277-31428-1-git-send-email-yamada.masahiro@socionext.com>
	<20160325154520.199b0863@bbrezillon>
	<CAK7LNATqVEMRwa+Ss4V9sBXYZwqKX=CpB_3Oox8bM6Yow0mkXA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAK7LNATqVEMRwa+Ss4V9sBXYZwqKX=CpB_3Oox8bM6Yow0mkXA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Cc: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Graham Moore <grmoore-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, Dinh Nguyen <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

I'm answering to this one, but I already saw your v2.

On Sat, 26 Mar 2016 13:27:50 +0900
Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org> wrote:

> 2016-03-25 23:45 GMT+09:00 Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>:
> > On Thu, 24 Mar 2016 21:24:37 +0900
> > Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org> wrote:
> >
> >> Commit 271707b1d817 ("mtd: nand: denali: max_banks calculation
> >> changed in revision 5.1") supported the new encoding of the "n_banks"
> >> bits of the "features" register, but there is an unfortunate case
> >> that is not covered by that commit.
> >>
> >> Panasonic (its System LSI division is now Socionext) bought several
> >> versions of this IP.  The IP released for Panasonic around Feb. 2012
> >> is revision 5 and uses the old encoding for n_banks (2 << n_banks).
> >> While the one released around Nov. 2012 is also revision 5, but it
> >> uses the new encoding (1 << n_banks).
> >>
> >> The revision register cannot distinguish these two incompatible
> >> hardware.  I guess this IP series is not well-organized.  I could not
> >> find any alternative but giving max_banks from DT property.
> >
> > Hm, shouldn't that be addressed with a new compatible instead of adding
> > a extra property?

You didn't answer to this suggestion. I see several advantages in this
approach:

1/ You'll only break the DT once (to add your new compatible) even if
you got your logic wrong. All you'll have to do in this case is patch
your driver to change the compatible <-> capabilities association

2/ This may not be the only difference between the 2 revisions, and
in this case, putting the compatible <-> capabilities association
directly in your driver will allow you to easily tweak capabilities
per-revision

> >
> >>
> >> This commit works around the problem by allowing DT to set the
> >> max_banks forcibly.  Of course, this DT property can be optional if
> >> the auto detection based on the hardware registers works well.
> >>
> >> Signed-off-by: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
> >> ---
> >>
> >>  Documentation/devicetree/bindings/mtd/denali-nand.txt | 4 ++++
> >>  drivers/mtd/nand/denali.c                             | 3 ++-
> >>  drivers/mtd/nand/denali_dt.c                          | 3 +++
> >>  3 files changed, 9 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/Documentation/devicetree/bindings/mtd/denali-nand.txt b/Documentation/devicetree/bindings/mtd/denali-nand.txt
> >> index 785b825..78c250d 100644
> >> --- a/Documentation/devicetree/bindings/mtd/denali-nand.txt
> >> +++ b/Documentation/devicetree/bindings/mtd/denali-nand.txt
> >> @@ -7,6 +7,10 @@ Required properties:
> >>    - interrupts : The interrupt number.
> >>    - dma-mask : DMA bit mask
> >>
> >> +Optional properties:
> >> +  - max-banks : Maximum number of banks supported by hardware.  If not
> >> +    specified, it is determined based on the "features" register of hardware.
> >> +
> >
> > You might want to prefix that with "denali,".
> >
> >>  The device tree may optionally contain sub-nodes describing partitions of the
> >>  address space. See partition.txt for more detail.
> 
> 
> In which case, do we have to add a vendor prefix to DT properties?
> 
> I do not know a clear rule about this.

Usually you add a vendor prefix when the property only applies to a
specific controller/IP. In the NAND specific case, most NAND
controllers have a fixed number of banks which can be deduced from the
IP revision/version. I'd like to keep it like that and avoid seeing
other drivers use this max-banks property to deduce the number of
available banks, hence my suggestion to, at least, prefix your property
with "denali,". But I'd still prefer to see the max-banks value be
associated to a new compatible.

Thanks,

Boris

-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
