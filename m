From: Lucas Stach <l.stach@pengutronix.de>
Subject: Re: [PATCH v1 1/3] ARM: dts: stm32: Add Vivante GPU support on
 STM32MP157c
Date: Fri, 15 Feb 2019 17:11:58 +0100
Message-ID: <1550247118.2546.56.camel@pengutronix.de>
References: <1550246316-9747-1-git-send-email-pierre-yves.mordret@st.com>
         <1550246316-9747-2-git-send-email-pierre-yves.mordret@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1550246316-9747-2-git-send-email-pierre-yves.mordret@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Pierre-Yves MORDRET <pierre-yves.mordret@st.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>
Cc: devicetree@vger.kernel.org, Philippe Cornu <philippe.cornu@st.com>, linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Pierre-Yves,

Am Freitag, den 15.02.2019, 16:58 +0100 schrieb Pierre-Yves MORDRET:
> Append Vivante GPU DT configuration.
> 
> Signed-off-by: Pierre-Yves MORDRET <pierre-yves.mordret@st.com>
> ---
>  arch/arm/boot/dts/stm32mp157c.dtsi | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/stm32mp157c.dtsi b/arch/arm/boot/dts/stm32mp157c.dtsi
> index f8bbfff..29540bc 100644
> --- a/arch/arm/boot/dts/stm32mp157c.dtsi
> +++ b/arch/arm/boot/dts/stm32mp157c.dtsi
> @@ -1106,6 +1106,16 @@
> >  			status = "disabled";
> >  		};
>  
> +		gpu: gpu@59000000 {
> +			compatible = "vivante,gc";
> +			reg = <0x59000000 0x800>;
> +			interrupts = <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&rcc GPU>, <&rcc GPU_K>;
> +			clock-names = "bus" ,"core";

Is this a 2D only core? If it is also 3D capable the binding says you
need to specify the shader clock (may be the same clock feeding the
core).

Regards,
Lucas

> +			resets = <&rcc GPU_R>;
> +			status = "disabled";
> +		};
> +
>  		dsi: dsi@5a000000 {
>  			compatible = "st,stm32-dsi";
>  			reg = <0x5a000000 0x800>;
