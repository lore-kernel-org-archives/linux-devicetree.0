From: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Subject: Re: [PATCH v3 0/6] Armada 380 NAND support
Date: Thu, 13 Mar 2014 19:44:48 -0400
Message-ID: <20140313234448.GB15608@titan.lakedaemon.net>
References: <1394742273-5113-1-git-send-email-ezequiel.garcia@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1394742273-5113-1-git-send-email-ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Seif Mazareeb <seif-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Mar 13, 2014 at 05:24:27PM -0300, Ezequiel Garcia wrote:
> This patchset adds support for the NAND on Armada 380/385 SoCs.
> 
> The first patch adds a new "armada-380-corediv-clock" compatible
> string, with its proper SoC-specific structure, adding the register
> layout for this SoC family.
> 
> The second and third patches add the devicetree changes to support
> the Core Divider clock.
> 
> After adding its clock source, the fourth and fifth patches add
> the NAND devicetree changes. The NAND controller is compatible with
> the Armada 370 controller, so we are currently support it using the
> same compatible string.
> 
> The last patch updates the binding documentation for the Core Divider
> clock, which is missing the information about the already supported
> Armada 375 compatible string.
> 
> This series is based on linux-next 20140307. I expect it will apply
> cleanly on v3.15-rc1; if that's not the case, I'll send a rebased patchset.
> 
> The clock and devicetree changes are mostly independent so they
> can be merged through the clock and mvebu tree respectively.
> 
> Changes from v2:
> 
>   * Removed the unneeded 'nand' label from the flash@d0000 node.
> 
>   * Renamed 'coredivclk@e4250' to 'clock@e4250' according to
>     ePAPR recomendation, below.
> 
> Changes from v1:
> 
>   * Changed nand@d0000 with flash@d0000 in the devicetree. The
>     latter is compliant with ePAPR recomendation (see ePAPR v1.1,
>     section 2.2.2, Generic Names Recommendation).
> 
> Ezequiel Garcia (6):
>   clk: mvebu: Support Armada 380 SoC on the core divider clock

Applied to mvebu/clk-3xx

>   ARM: mvebu: Add a 2 GHz fixed-clock on Armada 38x SoCs
>   ARM: mvebu: Add the Core Divider clock to Armada 38x SoCs
>   ARM: mvebu: Add support for NAND controller in Armada 38x SoC
>   ARM: mvebu: Enable NAND controller in Armada 385-DB

Applied to mvebu/dt

>   clk: mvebu: Update binding documentation for the core divider clock

Applied to mvebu/clk-3xx

I'll push for-next with tonight's additions in an hour or so.

thx,

Jason.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
