From: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH V5 1/3] dt-bindings: mtd: document linux,part-probe
 property
Date: Wed, 19 Apr 2017 22:55:30 +0200
Message-ID: <20170419225530.1ca228f7@bbrezillon>
References: <20170417182853.24281-1-zajec5@gmail.com>
        <20170417194746.10697-1-zajec5@gmail.com>
        <20170419203705.GF20555@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170419203705.GF20555-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>, Cyrille Pitchen <cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, 19 Apr 2017 13:37:05 -0700
Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> Hi,
> 
> On Mon, Apr 17, 2017 at 09:47:44PM +0200, Rafał Miłecki wrote:
> > From: Rafał Miłecki <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
> > 
> > Support for this property has been introduced in 2010 with commit
> > 9d5da3a9b849 ("mtd: extend physmap_of to let the device tree specify the
> > parition probe") but it was never documented. Fix this by adding a
> > proper description and example.
> > 
> > Signed-off-by: Rafał Miłecki <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
> > Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> > Acked-by: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> > ---
> >  Documentation/devicetree/bindings/mtd/common.txt | 7 +++++++
> >  1 file changed, 7 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/mtd/common.txt b/Documentation/devicetree/bindings/mtd/common.txt
> > index fc068b923d7a..1ada70e718b2 100644
> > --- a/Documentation/devicetree/bindings/mtd/common.txt
> > +++ b/Documentation/devicetree/bindings/mtd/common.txt
> > @@ -6,10 +6,17 @@ Optional properties:
> >    controller based name) in order to ease flash device identification
> >    and/or describe what they are used for.
> >  
> > +- linux,part-probe: if present, this property should contain a list of strings
> > +  with partition probes to be used for the flash device. A role of partition
> > +  probe (parser) is to read/construct partition table and register found
> > +  partitions. Getting partition table may be platform or device specific so
> > +  various devices may use various Linux drivers for this purpose.  
> 
> Have you reviewed the old threads about this? I thought I already
> discouraged extending this binding to be generic. Particularly, we do
> *not* want to codify things like 'linux,part-probe = "bcm47xxpart"',
> which doesn't follow any accepted practice about naming. And you've also
> failed to document any actual strings to put here, which hides the fact
> that you're opening a can of worms.
> 
> Piece of a previous thread:
> http://lists.infradead.org/pipermail/linux-mtd/2015-October/062613.html
> [PATCH] mtd: document linux-specific partition parser DT binding
> 
> I attempted to resolve that here, but never made time to address the few
> not-so-constructive comments I received:
> 
> https://mail-archive.com/linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org/msg1035539.html
> [RFC PATCH 0/7] mtd: partitions: add of_match_table support

Oops, completely forgot you had proposed an alternative solution. Sorry
about that.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
