From: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Subject: Re: [PATCH 0/6] Marvell Armada 375 and 38x clocks drivers
Date: Sun, 16 Feb 2014 21:20:22 -0500
Message-ID: <20140217022022.GF7862@titan.lakedaemon.net>
References: <1392053569-28037-1-git-send-email-gregory.clement@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1392053569-28037-1-git-send-email-gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Nadav Haklai <nadavh-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Feb 10, 2014 at 06:32:43PM +0100, Gregory CLEMENT wrote:
> Hi Mike,
> 
> Here are patches that add the clocks drivers for two new Marvell ARM
> SOCs that belong to the mach-mvebu family: the Armada 375 and the
> Armada 380/385. They are based on Cortex-A9 CPU cores, and share a
> number of peripherals with their predecessors in the mach-mvebu
> family.
> 
> The drivers added are similar to the one already used for the other
> SoCs of this family, as usual only the data are different the logic
> remains the same ans allow us to use the common part.
> 
> The core support (arch/arm/mach-mvebu) for these SOCs have just been
> posted, and we're aiming at having this merged for 3.15 if possible.
> 
> Thanks,
> 
> Gregory
> 
> Gregory CLEMENT (4):
>   clk: mvebu: add clock support for Armada 375
>   dt: Update binding information for mvebu core clocks with Armada 375
>   dt: Update binding information for mvebu gating clocks with Armada 375
>   clk: mvebu: add clock support for Armada 380/385
> 
> Thomas Petazzoni (2):
>   dt: Update binding information for mvebu core clocks with Armada
>     380/385
>   dt: Update binding information for mvebu gating clocks with Armada
>     380/385
> 
>  .../devicetree/bindings/clock/mvebu-core-clock.txt |  14 ++
>  .../bindings/clock/mvebu-gated-clock.txt           |  65 +++++++-
>  drivers/clk/mvebu/Kconfig                          |   8 +
>  drivers/clk/mvebu/Makefile                         |   2 +
>  drivers/clk/mvebu/armada-375.c                     | 184 +++++++++++++++++++++
>  drivers/clk/mvebu/armada-38x.c                     | 167 +++++++++++++++++++
>  6 files changed, 436 insertions(+), 4 deletions(-)
>  create mode 100644 drivers/clk/mvebu/armada-375.c
>  create mode 100644 drivers/clk/mvebu/armada-38x.c

Hey guys,

I've tentatively applied this series to mvebu/clk-3xx.  I can't build
test it until I pull in the core support.  So I'll keep it separate from
the regular clock driver changes just in case.

thx,

Jason.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
