From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 2/6] dt-bindings: interrupt-controller: add DT binding
 for the Marvell ICU
Date: Thu, 8 Jun 2017 16:56:00 -0500
Message-ID: <20170608215600.tfvxnx6nlhnmswof@rob-hp-laptop>
References: <1496398017-6487-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1496398017-6487-3-git-send-email-thomas.petazzoni@free-electrons.com>
 <20170607223317.hkpak5y2oalktjqe@rob-hp-laptop>
 <20170608141202.14e4801e@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170608141202.14e4801e-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Nadav Haklai <nadavh-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Hanna Hawa <hannah-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Yehuda Yitschak <yehuday-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Antoine Tenart <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Jun 08, 2017 at 02:12:02PM +0200, Thomas Petazzoni wrote:
> Hello,
> 
> On Wed, 7 Jun 2017 17:33:17 -0500, Rob Herring wrote:
> 
> > > +Example:
> > > +
> > > +icu: interrupt-controller@1e0000 {
> > > +	compatible = "marvell,cp110-icu";
> > > +	reg = <0x1e0000 0x10>;
> > > +	#interrupt-cells = <3>;
> > > +	interrupt-controller;
> > > +	interrupt-parent = <&gic>;  
> > 
> > If you have a parent, then you should have some interrupts. I guess that 
> > would be your ranges property? I suppose that is fine.
> 
> The ranges of interrupts available is defined by the gicp node. Indeed,
> as explained in the cover letter:
> 
>  - We have one GICP in the SoC, providing a number of GIC SPI interrupts
> 
>  - We have one ICU per CP in the SoC. So for example in the Armada 8K,
>    we have two CPs, and therefore two ICUs.
> 
> So the range of available GIC SPI interrupts it not associated to each
> ICU, it's a global range of GIC SPI interrupts: each can freely be
> allocated by any of the ICUs in the system.

Okay, I guess I have no issues with this one.

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
