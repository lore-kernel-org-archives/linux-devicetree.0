Return-Path: <SRS0=yMxL=F5=arm.com=kim.phillips@kernel.org>
Date: Wed, 7 Mar 2018 10:13:32 -0600
From: Kim Phillips <kim.phillips@arm.com>
Subject: Re: [PATCH v2 2/2] hwrng: mxc-rnga - add driver support on boards
 with device tree
Message-Id: <20180307101332.0fb08a8b830b96f3bb94e5c6@arm.com>
In-Reply-To: <20180305222100.29351-3-vz@mleia.com>
References: <20180305222100.29351-1-vz@mleia.com>
	<20180305222100.29351-3-vz@mleia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
To: Vladimir Zapolskiy <vz@mleia.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>, Matt Mackall <mpm@selenic.com>, Rob Herring <robh+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devicetree@vger.kernel.org, linux-crypto@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Tue, 6 Mar 2018 00:21:00 +0200
Vladimir Zapolskiy <vz@mleia.com> wrote:

> The driver works well on i.MX31 powered boards with device description
> taken from board device tree, the only change to add to the driver is
> the missing OF device id, the affected list of included headers and
> indentation in platform driver struct are beautified a little.
> 
> Signed-off-by: Vladimir Zapolskiy <vz@mleia.com>
> ---
> Changes from v1 to v2:
> * a kernel for iMX boards is always built with multiplatform support,
>   thus CONFIG_OF guards were removed, thanks to Kim Phillips for review,

That's not necessarily the reason, e.g., of_match_table is available to
be assigned even if CONFIG_OF is not set.  Recall, I tested building
without CONFIG_OF by removing the SOC_IMX31 dependency in Kconfig, and
building with netwinder_defconfig as a base.

Nevertheless, this v2 is much easier to review without the ifdef
CONFIG_OF, so:

Reviewed-by: Kim Phillips <kim.phillips@arm.com>

Thanks,

Kim

p.s. my responses typically have lower latencies when I'm added to cc.
