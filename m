From: Alexander Stein <alexander.stein-93q1YBGzJSMe9JSWTWOYM3xStJ4P+DSV@public.gmane.org>
Subject: Re: [RFC] irqchip: add support for LS1021A external interrupt lines
Date: Mon, 11 Dec 2017 15:38:13 +0100
Message-ID: <2302267.dSSx8ic0iv@ws-stein>
References: <48d2d08c-c57a-ce49-5958-0fd5ad4a2dc7@arm.com> <42019fb5-393a-08b0-924d-bf1a97e078fe@prevas.dk> <7badefae-a952-7839-0bfe-dcd09ea1204f@prevas.dk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <7badefae-a952-7839-0bfe-dcd09ea1204f-rjjw5hvvQKZaa/9Udqfwiw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rasmus Villemoes <rasmus.villemoes-rjjw5hvvQKZaa/9Udqfwiw@public.gmane.org>
Cc: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Monday, December 11, 2017, 3:06:52 PM CET Rasmus Villemoes wrote:
> On 2017-12-11 14:45, Rasmus Villemoes wrote:
> > On 2017-12-11 11:02, Alexander Stein wrote:
> > 
> >> Oh, and what is the content of register SCFG_SCFGREVCR?
> > 
> > Good point. On my board it's 0xffffffff, set even before U-boot starts,
> > and lots board support code in U-boot expects this. I can't immediately
> > find examples in the linux source code that actually writes to the scfg,
> 
> Not a write, but we do already implicitly assume SCFG_SCFGREVCR is set
> to all-ones: In drivers/pci/dwc/pci-layerscape.c, bits which are
> numbered 6-11 in the reference manual are extracted with a regmap_read()
> followed by a left-shift by 20 and mask with 0x3f. That's consistent
> with me setting bit 0 (reference manual enumeration) using 1U<<31.

We set SCFG_SCFGREVCR to all-ones too, even before u-boot in rcw. Problem
is, this bit-reversal is only valid for SCFG. It's a shame, but at least add
a comment in the code you expect SCFG_SCFGREVCR as 0xffffffff.

Best regards,
Alexander

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
