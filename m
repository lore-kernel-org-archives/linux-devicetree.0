From: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH 3/3] mtd: nand: add NAND driver for Broadcom STB NAND
 controller
Date: Wed, 18 Mar 2015 18:49:21 -0700
Message-ID: <20150319014921.GQ32500@ld-irv-0074>
References: <1425691129-1150-1-git-send-email-computersforpeace@gmail.com>
 <1425691129-1150-4-git-send-email-computersforpeace@gmail.com>
 <55072714.9080104@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <55072714.9080104@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: linux-mtd@lists.infradead.org, Dmitry Torokhov <dtor@google.com>, Anatol Pomazao <anatol@google.com>, Ray Jui <rjui@broadcom.com>, Corneliu Doban <cdoban@broadcom.com>, Jonathan Richardson <jonathar@broadcom.com>, =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, bcm-kernel-feedback-list@broadcom.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Kevin Cernekee <cernekee@gmail.com>
List-Id: devicetree@vger.kernel.org

On Mon, Mar 16, 2015 at 11:55:16AM -0700, Florian Fainelli wrote:
> On 06/03/15 17:18, Brian Norris wrote:
> > +static int brcmnand_revision_init(struct brcmnand_controller *ctrl)
> > +{
> > +	static const unsigned int block_sizes_v6[] = { 8, 16, 128, 256, 512, 1024, 2048, 0 };
> > +	static const unsigned int block_sizes_v4[] = { 16, 128, 8, 512, 256, 1024, 2048, 0 };
> > +	static const unsigned int page_sizes[] = { 512, 2048, 4096, 8192, 0 };
> > +
> > +	ctrl->nand_version = nand_readreg(ctrl, 0) & 0xffff;
> > +
> > +	/* Only support v4.0+? */
> > +	if (ctrl->nand_version < 0x0400)
> > +		return -ENODEV;
> 
> It could be nice to have an informative error message here that this is
> either:
> 
> - an unknown controller revision (> 7.1)
> - an older controller revision
> - a check against the compatible property, just in case?

I'll add a message that the revision is not supported. The DT binding
should catch this too, so this check is just an extra safeguard.

> [snip]
> 
> > +		ctrl->cs_offsets = brcmnand_cs_offsets_v71;
> > +	} else {
> > +		ctrl->cs_offsets = brcmnand_cs_offsets;
> > +
> > +		/* pre-v5.0 has a different CS0 offset layout */
> > +		if (ctrl->nand_version <= 0x0500)
> > +			ctrl->cs0_offsets = brcmnand_cs_offsets_cs0;
> 
> Based on this check, should the comment should be "pre-v5.0 and v5.0
> have a different CS0 offset layout"?

Yes. Fixed.

Brian
