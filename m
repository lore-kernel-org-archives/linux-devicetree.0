From: Jason Gunthorpe <jgunthorpe@obsidianresearch.com>
Subject: Re: [RFC PATCH 3/9] of: mtd: add NAND timings retrieval support
Date: Wed, 8 Jan 2014 11:34:18 -0700
Message-ID: <20140108183418.GA12358@obsidianresearch.com>
References: <1389190924-26226-1-git-send-email-b.brezillon@overkiz.com>
 <1389190924-26226-4-git-send-email-b.brezillon@overkiz.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1389190924-26226-4-git-send-email-b.brezillon@overkiz.com>
Sender: linux-doc-owner@vger.kernel.org
To: Boris BREZILLON <b.brezillon@overkiz.com>
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>, Rob Landley <rob@landley.net>, Russell King <linux@arm.linux.org.uk>, David Woodhouse <dwmw2@infradead.org>, Grant Likely <grant.likely@linaro.org>, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, dev@linux-sunxi.org, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Wed, Jan 08, 2014 at 03:21:58PM +0100, Boris BREZILLON wrote:

> +int of_get_nand_timings(struct device_node *np, struct nand_timings *timings)
> +{
> +	memset(timings, 0, sizeof(*timings));
> +	of_property_read_u32(np, "tCLS-min", &timings->tCLS_min);
> +	of_property_read_u32(np, "tCLH-min", &timings->tCLH_min);
> +	of_property_read_u32(np, "tCS-min", &timings->tCS_min);
[..]

A while ago when discussing another controller it was pointed out
these values are all auto-probable directly from the NAND via a ONFI
defined GET FEATURE @0x01 query, and adding these timings to the DT
was NAK'd..

Basically you set the interface to the slowest ONFI timing mode, do
the GET FEATURE to the NAND chip and then increase the interface speed
to the highest mutually supported ONFI mode.

Is there some reason you need to encode this in the DT?

Jason
