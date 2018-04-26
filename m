From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 14/17] arm64: dts: r8a77965-salvator-x: Add DU external dot clocks
Date: Fri, 27 Apr 2018 00:18:43 +0300
Message-ID: <2252433.qtOjIrpDLV@avalon>
References: <20180426165346.494-1-kieran.bingham+renesas@ideasonboard.com> <20180426165346.494-15-kieran.bingham+renesas@ideasonboard.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180426165346.494-15-kieran.bingham+renesas@ideasonboard.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc: linux-renesas-soc@vger.kernel.org, Takeshi Kihara <takeshi.kihara.df@renesas.com>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "moderated list:ARM64 PORT (AARCH64 ARCHITECTURE)" <linux-arm-kernel@lists.infradead.org>, open list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Kieran,

Thank you for the patch.

On Thursday, 26 April 2018 19:53:43 EEST Kieran Bingham wrote:
> From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> 
> The DU1 external dot clock is provided by the fixed frequency clock
> generator X21, while the DU0 and DU3 clocks are provided by the
> programmable Versaclock5 clock generator.

I think you can squash this with patch 15/17.

> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> ---
>  arch/arm64/boot/dts/renesas/r8a77965-salvator-x.dts | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a77965-salvator-x.dts
> b/arch/arm64/boot/dts/renesas/r8a77965-salvator-x.dts index
> 75d890d91df9..a2b8fb20fef8 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77965-salvator-x.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a77965-salvator-x.dts
> @@ -19,3 +19,15 @@
>  		reg = <0x0 0x48000000 0x0 0x78000000>;
>  	};
>  };
> +
> +&du {
> +	clocks = <&cpg CPG_MOD 724>,
> +		 <&cpg CPG_MOD 723>,
> +		 <&cpg CPG_MOD 721>,
> +		 <&cpg CPG_MOD 727>,
> +		 <&versaclock5 1>,
> +		 <&x21_clk>,
> +		 <&versaclock5 2>;
> +	clock-names = "du.0", "du.1", "du.3", "lvds.0",
> +		      "dclkin.0", "dclkin.1", "dclkin.3";
> +};

-- 
Regards,

Laurent Pinchart
