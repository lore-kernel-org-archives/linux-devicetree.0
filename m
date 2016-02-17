From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH v3 0/7] ARM/arm64: dts: renesas: Add/complete L2
 cache-controller nodes
Date: Wed, 17 Feb 2016 14:53:41 +0900
Message-ID: <20160217055340.GD11534@verge.net.au>
References: <1455568715-20880-1-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1455568715-20880-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>, Dirk Behme <dirk.behme@de.bosch.com>, Sudeep Holla <sudeep.holla@arm.com>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Mon, Feb 15, 2016 at 09:38:28PM +0100, Geert Uytterhoeven wrote:
> 	Hi Simon, Magnus,
> 
> This patch series adds the missing L2 cache-controller nodes to the
> DTSes for various Renesas ARM-based SoCs, or completes the existing
> nodes, and links the CPU nodes to them.
> 
> For R-Mobile APE6 (r8a73a4), the L2 cache-controllers are also linked to
> the respective (already existing) SYSC Power Domains. Fortunately these
> Power Domains were never powered down, as they are parents of the Power
> Domains containing CPU cores. This may change in the future.
> 
> For R-Car Gen2 and Gen3 (r8a779x), this serves as a preparatory step for
> adding SYSC Power Domain support later.
> 
> Changes compared to v2:
>   - Dropped "arm,data-latency" and "arm,tag-latency" properties, as they
>     may not be valid when using virtualization,
>   - Dropped already applied parts of "[PATCH v2 6/6] arm64: renesas:
>     r8a7795: Add L2 cache-controller nodes",
>   - Changed one-line summary prefix to match current arm-soc practices.
> 
> This series is against renesas-devel-20160215-v4.5-rc4.
> It has been tested on r8a73a4/ape6evm, r8a7791/koelsch, r8a7794/alt, and
> r8a7795/salvator-x.
> 
> For your convenience, I've also pushed this series to
> git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git#topic/l2-cache-v3
> 
> Thanks for applying!
> 
> Geert Uytterhoeven (7):
>   ARM: dts: r8a73a4: Add L2 cache-controller nodes
>   ARM: dts: r8a7790: Add L2 cache-controller nodes
>   ARM: dts: r8a7791: Add L2 cache-controller node
>   ARM: dts: r8a7793: Add L2 cache-controller node
>   ARM: dts: r8a7794: Add L2 cache-controller node
>   arm64: dts: r8a7795: Add missing properties to CA57 L2 cache node
>   arm64: dts: r8a7795: Add CA53 L2 cache-controller node

Thanks, I have queued these up for v4.6.
