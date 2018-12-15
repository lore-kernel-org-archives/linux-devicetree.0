From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH 0/9] RZ/G2E basic device tree
Date: Sat, 15 Dec 2018 16:10:22 +0100
Message-ID: <20181215151017.2wqpiwvd7texfk7e@verge.net.au>
References: <1544778613-24279-1-git-send-email-fabrizio.castro@bp.renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1544778613-24279-1-git-send-email-fabrizio.castro@bp.renesas.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Mark Rutland <mark.rutland@arm.com>, Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>
List-Id: devicetree@vger.kernel.org

On Fri, Dec 14, 2018 at 09:10:04AM +0000, Fabrizio Castro wrote:
> Dear All,
> 
> this series adds a basic dtsi for the RZ/G2E (a.k.a. r8a774c0).

Thanks Fabrizio,

This series looks fine to me but I will wait to see if there are other
reviews before applying.

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

> Fabrizio Castro (9):
>   arm64: dts: renesas: Initial device tree for r8a774c0
>   arm64: dts: renesas: r8a774c0: Add SYS-DMAC controller nodes
>   arm64: dts: renesas: r8a774c0: Add SCIF and HSCIF nodes
>   arm64: dts: renesas: r8a774c0: Add INTC-EX device node
>   arm64: dts: renesas: r8a774c0: Add PFC support
>   arm64: dts: renesas: r8a774c0: Add GPIO device nodes
>   arm64: dts: renesas: r8a774c0: Add Ethernet AVB node
>   arm64: dts: renesas: r8a774c0: Add watchdog support
>   arm64: dts: renesas: r8a774c0: Add secondary CA53 CPU core

My usual question regarding SMP enablement: to what extent has this
been verified with respect to CPU hotplug and Suspend-2-RAM ?

>  arch/arm64/boot/dts/renesas/r8a774c0.dtsi | 649 ++++++++++++++++++++++++++++++
>  1 file changed, 649 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/renesas/r8a774c0.dtsi
> 
> -- 
> 2.7.4
> 
