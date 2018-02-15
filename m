From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH v2 2/2] arm64: dts: renesas: eagle: specify EtherAVB PHY
 IRQ
Date: Thu, 15 Feb 2018 16:16:44 +0100
Message-ID: <20180215151644.szxwehuu6b7w5uuv@verge.net.au>
References: <038a791d-aa57-9c3d-eaea-09c5704ecb54@cogentembedded.com>
 <0ccd631e-691a-2b15-7680-6e0c847a6ca2@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <0ccd631e-691a-2b15-7680-6e0c847a6ca2@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Rob Herring <robh+dt@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Tue, Feb 13, 2018 at 02:24:14PM +0300, Sergei Shtylyov wrote:
> Specify  EtherAVB PHY IRQ  in the Eagle board's device tree, now that we
> have the GPIO support (previously phylib had to resort to polling).
> 
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Thanks, applied with Geert's tag.

> ---
>  arch/arm64/boot/dts/renesas/r8a77970-eagle.dts |    2 ++
>  1 file changed, 2 insertions(+)
> 
> Index: renesas/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
> ===================================================================
> --- renesas.orig/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
> +++ renesas/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
> @@ -44,6 +44,8 @@
>  	phy0: ethernet-phy@0 {
>  		rxc-skew-ps = <1500>;
>  		reg = <0>;
> +		interrupt-parent = <&gpio1>;
> +		interrupts = <17 IRQ_TYPE_LEVEL_LOW>;

Could you consider following-up with a patch to add:

		reset-gpios = <&gpio1 16 GPIO_ACTIVE_LOW>;

>  	};
>  };
>  
> 
