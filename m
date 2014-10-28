From: Scott Wood <scottwood@freescale.com>
Subject: Re: [PATCH 2/4] dt/bindings: Introduce the FSL QorIQ DPAA BMan
 portal(s)
Date: Tue, 28 Oct 2014 13:09:48 -0500
Message-ID: <1414519788.23458.85.camel@snotra.buserror.net>
References: <1413986972-621-1-git-send-email-Emilian.Medve@Freescale.com>
	 <1413986972-621-2-git-send-email-Emilian.Medve@Freescale.com>
	 <20141022142931.GA4010@leverpostej> <54480DE6.4090604@Freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <54480DE6.4090604@Freescale.com>
Sender: linux-doc-owner@vger.kernel.org
To: Emil Medve <Emilian.Medve@Freescale.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "galak@kernel.crashing.org" <galak@kernel.crashing.org>, "corbet@lwn.net" <corbet@lwn.net>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, "galak@codeaurora.org" <galak@codeaurora.org>, Pawel Moll <Pawel.Moll@arm.com>, "Geoff.Thorpe@freescale.com" <Geoff.Thorpe@Freescale.com>, "linuxppc-dev@ozlabs.org" <linuxppc-dev@ozlabs.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, 2014-10-22 at 15:04 -0500, Emil Medve wrote:
> Hello Mark,
> 
> 
> Thanks for having a look at this
> 
> On 10/22/2014 09:29 AM, Mark Rutland wrote:
> > I'd feel rather uncomfortable accepting a
> > binding that we already believe to be insufficient to describe the
> > hardware.
> > 
> > What do you expect to change?
> 
> Related bindings seem incomplete. As such, the PAMU binding (pamu.txt)
> covers incompletely a dynamic LIODN assignment/programming model. The
> current driver uses a static assignment scheme that the binding needs to
> include. I also suspect that once the driver starts supporting the
> dynamic LIODN assignment/programming we might find some wrinkles

How is this different from any of the other QorIQ bindings that have
been merged without such a disclaimer?  The static LIODN model is
already there, even if documentation is missing, and should continue to
be supported even if we eventually implement a dynamic LIODN model.

> >> +
> >> +	bman-portals@ff4000000 {
> >> +		#address-cells = <1>;
> >> +		#size-cells = <1>;
> >> +		compatible = "simple-bus";
> >> +		ranges = <0 0xf 0xf4000000 0x200000>;
> >> +
> >> +		bman-portal@0 {
> >> +			compatible = "fsl,bman-portal-1.0.0", "fsl,bman-portal";
> >> +			reg = <0x0 0x4000 0x100000 0x1000>;
> > 
> > It would be easier to read is each entry had its own set of brackets.
> > Initially this looked to me like a single 64-bit address/size pair.
> 
> Something like <>, <>? It doesn't seem widely used but I agree is more
> readable. I can include it in the the next spin

The older PPC device trees haven't used it much but I think it's pretty
common in the newer ARM trees.

-Scott


