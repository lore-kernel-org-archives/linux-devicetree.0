From: Grant Likely <grant.likely@linaro.org>
Subject: Re: [RFC PATCH 3/9] of: mtd: add NAND timings retrieval support
Date: Tue, 04 Feb 2014 17:02:58 +0000
Message-ID: <20140204170258.3D4FCC4045E@trevor.secretlab.ca>
References: <1389190924-26226-1-git-send-email-b.brezillon@overkiz.com> < 1389190924-26226-4-git-send-email-b.brezillon@overkiz.com> <20140108183418. GA12358@obsidianresearch.com> <52CDA032.3010804@overkiz.com> < 20140108191339.GB12358@obsidianresearch.com> <52CE5F82.6070802@overkiz.com> <20140109173505.GB8899@obsidianresearch.com> <52D6A48D.4080302@overkiz.com> <52D6BF45.80407@overkiz.com> <20140121225740.GP18269@obsidianresearch.com>
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <20140121225740.GP18269@obsidianresearch.com>
Sender: linux-doc-owner@vger.kernel.org
To: Jason Gunthorpe <jgunthorpe@obsidianresearch.com>, boris brezillon <b.brezillon@overkiz.com>
Cc: devicetree@vger.kernel.org, Russell King <linux@arm.linux.org.uk>, linux-doc@vger.kernel.org, dev@linux-sunxi.org, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, Rob Landley <rob@landley.net>, Maxime Ripard <maxime.ripard@free-electrons.com>, David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Tue, 21 Jan 2014 15:57:40 -0700, Jason Gunthorpe <jgunthorpe@obsidianresearch.com> wrote:
> On Wed, Jan 15, 2014 at 06:03:01PM +0100, boris brezillon wrote:
> 
> > >>Pick a mode value that fits all the parameters of the connected
> > >>non-ONFI flash.
> > >>
> > >>This would be instead of defining each parameter
> > >>individually.. Provide some helpers to convert from a onfi mode number
> > >>to all the onfi defined timing parameters so that drivers can
> > >>configure the HW..
> > >
> > >Are you suggesting we should provide a function that converts these
> > >modes into a nand_timings struct, or just use the timing modes and
> > >let the NAND controller drivers configure its IP accordingly ?
> 
> Either seems reasonable to me, but passing the ONFI mode directly from
> the NAND core to the driver seems a little safer..

I agree here. There are a lot of parameters being defined. If it can be
boiled down to an ONFI mode that will make for a much more robust
binding. Far fewer things to get wrong.

g.

