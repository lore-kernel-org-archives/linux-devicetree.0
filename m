From: Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH v5 2/2] EDAC: add EDAC driver for DMC520
Date: Mon, 19 Aug 2019 11:31:47 +0200
Message-ID: <20190819093147.GE4841@zn.tnic>
References: <BN6PR04MB1107CE3C2D666A806E62851B86C10@BN6PR04MB1107.namprd04.prod.outlook.com>
 <20190807144016.GA24328@zn.tnic>
 <BY5PR04MB659914AC91EBB3EAF72977BD86D20@BY5PR04MB6599.namprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <BY5PR04MB659914AC91EBB3EAF72977BD86D20@BY5PR04MB6599.namprd04.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Lei Wang <leiwang_git@outlook.com>
Cc: "james.morse@arm.com" <james.morse@arm.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "mchehab@kernel.org" <mchehab@kernel.org>, "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>, "sashal@kernel.org" <sashal@kernel.org>, "hangl@microsoft.com" <hangl@microsoft.com>, "lewan@microsoft.com" <lewan@microsoft.com>, "ruizhao@microsoft.com" <ruizhao@microsoft.com>
List-Id: devicetree@vger.kernel.org

On Tue, Aug 13, 2019 at 01:05:02AM +0000, Lei Wang wrote:
> Added some more comments for the file:
> 
> /*
>   * dmc520_edac.c, EDAC driver for DMC-520 memory controller
      ^^^^^^^^^^^^^

Filename is redundant.

> These comments tell how to potentially expand the driver functions to 
> support more interrupts besides what are already here.

I can read that - the question is why are they there and for whom? For
your future colleagues who'll take over this driver or what is those
comments' purpose?

> As above comments, this comment is to guide potential future adding to 
> this driver to support other interrupts.

See question above.

> After edac_mc_alloc(), if succeeds, the above code updates dmc520_edac 
> struct data. If moving edac_mc_alloc as suggested, I will need to use 
> local variables to store the data,

Yes, do that pls.

> Do you mean having an array to keep all the irq_id, and then only 
> devm_request_irq on them if all of the platform_get_irq are success?

No, move it before edac_mc_alloc().

In general, do *all* initialization of your hardware first and only
then, when it succeeds, allocate the EDAC structures.

Thx.

-- 
Regards/Gruss,
    Boris.

Good mailing practices for 400: avoid top-posting and trim the reply.
