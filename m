From: =?UTF-8?Q?Andr=c3=a9_Przywara?= <andre.przywara@arm.com>
Subject: Re: [PATCH 2/5] arm64: dts: allwinner: a64: Add watchdog
Date: Tue, 13 Mar 2018 01:39:24 +0000
Message-ID: <29bb31fc-dd3d-e9c5-c78e-f8e80f7a95fa@arm.com>
References: <20180312161050.7647-1-harald@ccbib.org>
 <20180312161050.7647-3-harald@ccbib.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180312161050.7647-3-harald@ccbib.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Harald Geyer <harald@ccbib.org>, Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, info@olimex.com, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, Icenowy Zheng <icenowy@aosc.io>
List-Id: devicetree@vger.kernel.org

On 12/03/18 16:10, Harald Geyer wrote:

Hi,

> Add a watchdog node for the A64, automatically enabled on all boards.
> Tested on Olimex Teres I.
> 
> Signed-off-by: Harald Geyer <harald@ccbib.org>
> ---
>  arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> index 64e452a758fa..ca1b365bc722 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> @@ -665,5 +665,11 @@
>  			#address-cells = <1>;
>  			#size-cells = <0>;
>  		};
> +
> +		wdt0: watchdog@1c20ca0 {
> +			compatible = "allwinner,sun6i-a31-wdt";

Please use the recommended way, adding a specific compatible first:

			compatible = "allwinner,sun50i-a64-wdt",
				     "allwinner,sun6i-a31-wdt";

The rest looks correct.

I am just a bit puzzled what's the use of a watchdog on a laptop? I
would expect it being more used in embedded systems? Or is that patch
here actually independent from the Teres I?

Cheers,
Andre.

> +			reg = <0x01c20ca0 0x20>;
> +			interrupts = <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
> +		};
>  	};
>  };
> 
