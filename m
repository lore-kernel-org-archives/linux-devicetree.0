From: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: sam9x5: MTD numbering changed
Date: Thu, 2 Nov 2017 16:09:09 +0100
Message-ID: <20171102160909.6eee6289@bbrezillon>
References: <1509621436.16695.3.camel@gmail.com>
        <20171102133954.055ce285@bbrezillon>
        <1509632027.16695.5.camel@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1509632027.16695.5.camel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Richard Genoud <richard.genoud-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Peter Rosin <peda-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>, linux-mtd <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, 02 Nov 2017 15:13:47 +0100
Richard Genoud <richard.genoud-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> Le jeudi 02 novembre 2017 à 13:39 +0100, Boris Brezillon a écrit :
> > +Nicolas
> > 
> > Hi Richard,
> > 
> > On Thu, 02 Nov 2017 12:17:16 +0100
> > Richard Genoud <richard.genoud-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> >   
> > > Hi,
> > > 
> > > I've got an at91sam9g35-cm based board, with 4 partition on the
> > > spi-
> > > dataflas and 5 partitions on the NAND flash.
> > > Before commit 1004a2977bdc ("ARM: dts: at91: Switch to the new NAND
> > > bindings"),
> > > the NAND partitions were mtd0-4 and spi-dataflash partitions mtd5-
> > > 8.
> > > 
> > > Since commit 1004a2977bdc ("ARM: dts: at91: Switch to the new NAND
> > > bindings"),
> > > the spi-dataflash partitions are discovered before the NAND
> > > partitions.
> > > So NAND partition became mtd4-8 and spi-dataflash partition mtd0-3.
> > > 
> > > This broke some script that relied on the mtd numbering.
> > > 
> > > Updating those scripts to rely on the mtd device name instead of
> > > number is not really a problem. The real problem is when an older
> > > script using mtd numbering is run on the new system : I expect dead
> > > kittens everywhere !  
> > 
> > Crap! That was one of the thing I was afraid of when changing the
> > binding: probe order has an impact on ids assigned to MTD devs, and
> > since things are not defined at the same place in the DT, it changes
> > the probe order.
> >   
> > > 
> > > So, I'd like to know if there's a way to force the older numbering
> > > ?  
> > 
> > Reverting the patches is probably the easiest way (and it's easily
> > backportable). Now, if we want to switch to the new bindings at some
> > point we'll need to support DT aliases for mtd devs:
> > 
> > aliases {
> > 	mtdX = &flashpartN;
> > 	mtdY = &flashdevM;
> > };
> > 
> > The problem with this solution is that it only works if all
> > partitions
> > are defined in the DT, which is not always the case (they can be
> > defined
> > on the command line with mtdparts=).  
> Yes, and if they are different from the ones declared in
> at91sam9x5cm.dtsi, they are likely defined with mtdparts=, since AFAIK,
> we can't remove a declared partitionning.
> 
> I'll disable the ebi and switch back to the old binding in my dts for
> now.
> >   
> > > (I tried poking around the DTS without succès).
> > > 
> > > any idea ?  
> > 
> > I don't have a perfect solution, but the problem you report clearly
> > shows that relying on MTD numbering is unsafe and should be avoided.  
> Clearly, but who doesn't ? ;)
> 

Just had a lengthy discussion with Alexandre, and he brought a valid
point: there has never been any guarantee on MTD numbering. Not only
the order of DT nodes have an impact on the probe order, but also the
order in which drivers are linked when creating the kernel image. Yes
these things usually don't change, but I'm not sure it's a good idea
to let user-space apps think it will never change in the future.

How about fixing the scripts you were referring to instead of reverting
the change? What's the blocking point?

Regards,

Boris
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
