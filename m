Return-Path: <SRS0=Njyo=TH=jinso.co.jp=cv-dong@kernel.org>
Subject: Re: [PATCH v2 2/5] arm64: dts: renesas: r8a7795: Add TPU support
References: <1556155517-5054-1-git-send-email-cv-dong@jinso.co.jp>
 <1556155517-5054-3-git-send-email-cv-dong@jinso.co.jp>
From: Cao Van Dong <cv-dong@jinso.co.jp>
Message-ID: <e4a80088-90c7-4da1-8453-558692085b90@jinso.co.jp>
Date: Tue, 7 May 2019 14:44:51 +0900
MIME-Version: 1.0
In-Reply-To: <1556155517-5054-3-git-send-email-cv-dong@jinso.co.jp>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
To: linux-renesas-soc@vger.kernel.org, horms+renesas@verge.net.au, geert+renesas@glider.be, broonie@kernel.org, devicetree@vger.kernel.org, mark.rutland@arm.com, daniel.lezcano@linaro.org, tglx@linutronix.de, robh@kernel.org
Cc: yoshihiro.shimoda.uh@renesas.com, kuninori.morimoto.gx@renesas.com, h-inayoshi@jinso.co.jp, na-hoan@jinso.co.jp
List-ID: <devicetree@vger.kernel.org>

On 2019/04/25 10:25, Cao Van Dong wrote:
> Add tpu device node to dtsi for TPU support on r8a7795 SoC.
>
> Signed-off-by: Cao Van Dong <cv-dong@jinso.co.jp>
> ---
>   arch/arm64/boot/dts/renesas/r8a7795.dtsi | 11 +++++++++++
>   1 file changed, 11 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/renesas/r8a7795.dtsi b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
> index 55472b2..612761e 100644
> --- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
> @@ -1380,6 +1380,17 @@
>   			status = "disabled";
>   		};
>   
> +		tpu: pwm@e6e80000 {
> +			compatible = "renesas,tpu-r8a7795", "renesas,tpu";
> +			reg = <0 0xe6e80000 0 0x148>;
> +			interrupts = <GIC_SPI 135 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cpg CPG_MOD 304>;
> +			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
> +			resets = <&cpg 304>;
> +			#pwm-cells = <3>;
> +			status = "disabled";
> +		};
> +
>   		msiof0: spi@e6e90000 {
>   			compatible = "renesas,msiof-r8a7795",
>   				     "renesas,rcar-gen3-msiof";
Tested-by: Cao Van Dong <cv-dong@jinso.co.jp>

Thank you,
Dong
