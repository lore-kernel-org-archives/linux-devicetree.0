From: Jan =?ISO-8859-1?Q?L=FCbbe?= <jlu@pengutronix.de>
Subject: Re: [RESEND PATCH 2/4] dt-bindings: add "reduced-width" property
 for Armada XP SDRAM controller
Date: Fri, 11 Aug 2017 11:34:27 +0200
Message-ID: <1502444067.1333.7.camel@pengutronix.de>
References: <20170807014641.4003-1-chris.packham@alliedtelesis.co.nz>
         <20170807014641.4003-3-chris.packham@alliedtelesis.co.nz>
         <20170810203801.jz5hl5onqci275ef@rob-hp-laptop>
         <4935472b6a44447fa764fa811a645b9f@svr-chch-ex1.atlnz.lc>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <4935472b6a44447fa764fa811a645b9f@svr-chch-ex1.atlnz.lc>
Sender: linux-kernel-owner@vger.kernel.org
To: Chris Packham <Chris.Packham@alliedtelesis.co.nz>, Rob Herring <robh@kernel.org>
Cc: "gregory.clement@free-electrons.com" <gregory.clement@free-electrons.com>, "bp@alien8.de" <bp@alien8.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, 2017-08-10 at 21:17 +0000, Chris Packham wrote:
> On 11/08/17 08:38, Rob Herring wrote:
> > On Mon, Aug 07, 2017 at 01:46:39PM +1200, Chris Packham wrote:
[...]  
> > > +Optional properties:
> > > + - marvell,reduced-width: some SoCs that use this SDRAM controller have
> > > +   a reduced pin count. On such systems "full" width is 32-bits and
> > > +   "half" width is 16-bits. Set this property to indicate that the SoC
> > > +   used is such a system.
> > 
> > Maybe you should just state what the width is.
> 
> Specifying a number like 64/32/16 is done in for some other properties I 
> dismissed that because what this is about how we interpret a 
> pin-strapping option. I guess "max-width = <64>;" and "max-width = 
> <32>"; would achieve the same.
> 
> > Or your compatible string should just be specific enough to know the
> > width.
> 
> I decided against a new compatible sting that because the IP block 
> really is the Armada-XP one and the existing compatible string is used 
> in other places (using multiple compatible strings would solve that).
> 
> I'm not too fussed which of the 3 options are used. Is there any 
> particular preference?

I'd prefer a specific compatible string, as it would avoid adding even
more properties if further difference turn up.

Rob, I seem to remember that some drivers match the top-level
compatible against a list of SoC variants to detect SoC-dependent
features in a generic IP block. Is that something you'd prefer instead?

Regards,
Jan
