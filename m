From: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 1/2] mtd: move code reading DT specified part probes to
 the common place
Date: Fri, 31 Mar 2017 09:55:32 +0200
Message-ID: <20170331095532.720e9348@bbrezillon>
References: <20170330215332.32699-1-zajec5@gmail.com>
        <20170331094213.055149e1@bbrezillon>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170331094213.055149e1@bbrezillon>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>, Cyrille Pitchen <cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, 31 Mar 2017 09:42:13 +0200
Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:

> Hi Rafal,
> 
> On Thu, 30 Mar 2017 23:53:31 +0200
> Rafał Miłecki <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> 
> > From: Rafał Miłecki <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
> > 
> > Handling (creating) partitions for flash devices requires using a proper
> > driver that will read partition table (out of somewhere). We can't
> > simply try all existing drivers one by one, so MTD subsystem allows
> > drivers to specify a list of applicable part probes.
> > 
> > So far physmap_of was the only driver with support for linux,part-probe
> > DT property. Other ones had list or probes hardcoded which wasn't making
> > them really flexible. It prevented using common flash drivers on
> > platforms that required some specific partition table access.  
> 
> I agree that having each flash device driver specify the set of
> partition parsers it supports is a bad idea (most of the time,
> partition table format are devicetype agnostic). On the other hand, I'm
> not a big fan of this property, and I would prefer a solution where all
> parsers are tested on each MTD device.
> But testing all parsers sequentially is not a perfect solution either
> because it increases boot-time and you can't really define the order in
> which partition parsers are tested (which means that if you have 2
> different partition table in 2 different format, you can't choose the
> one that has precedence on the other).
> 
> I guess I can live with this "linux,part-probe" property, even if,
> as the names implies, it's not really describing hardware, and as
> such, does not have its place in DT :-P.
> 
> > 
> > This commit moves support for mentioned DT property to the common place
> > so it can be reused by other drivers.  
> 
> This property does not seem to be documented. Can you add a patch
> documenting it in Documentation/devicetree/bindings/mtd/common.txt and
> Cc the DT maintainers.

Please ignore this comment, it's already done in patch 2 :).

> Only then we'll see if this property is
> acceptable for them.
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
