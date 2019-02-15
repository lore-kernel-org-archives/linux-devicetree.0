From: Lucas Stach <l.stach@pengutronix.de>
Subject: Re: [PATCH v1 2/3] ARM: dts: stm32: enable Vivante GPU support on
 stm32mp157c-ed1 board
Date: Fri, 15 Feb 2019 17:14:29 +0100
Message-ID: <1550247269.2546.58.camel@pengutronix.de>
References: <1550246316-9747-1-git-send-email-pierre-yves.mordret@st.com>
         <1550246316-9747-3-git-send-email-pierre-yves.mordret@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1550246316-9747-3-git-send-email-pierre-yves.mordret@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Pierre-Yves MORDRET <pierre-yves.mordret@st.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>
Cc: devicetree@vger.kernel.org, Philippe Cornu <philippe.cornu@st.com>, linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Am Freitag, den 15.02.2019, 16:58 +0100 schrieb Pierre-Yves MORDRET:
> Enable Vivante GPU driver for stm32mp157c-ed1 board.
> 
> Signed-off-by: Pierre-Yves MORDRET <pierre-yves.mordret@st.com>
> ---
>  arch/arm/boot/dts/stm32mp157c-ed1.dts | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/stm32mp157c-ed1.dts
> b/arch/arm/boot/dts/stm32mp157c-ed1.dts
> index 98ef7a0..792f402 100644
> --- a/arch/arm/boot/dts/stm32mp157c-ed1.dts
> +++ b/arch/arm/boot/dts/stm32mp157c-ed1.dts
> @@ -20,6 +20,17 @@
>  		reg = <0xC0000000 0x40000000>;
>  	};
>  
> +	reserved-memory {
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges;
> +
> +		gpu_reserved: gpu@f8000000 {
> +			reg = <0xf8000000 0x8000000>;
> +			no-map;
> +		};
> +	};
> +

I don't think you need this. The GPU driver uses very little contig dma
memory. Most of the GPU memory is ordinary paged memory, so setting
aside a private memory region of this size is a waste of memory. Most
likely you can just allow the GPU driver to use the system global CMA
region.

Regards,
Lucas


>  	aliases {
>  		serial0 = &uart4;
>  	};
> @@ -53,6 +64,11 @@
>  	status = "okay";
>  };
>  
> +&gpu {
> +	contiguous-area = <&gpu_reserved>;
> +	status = "okay";
> +};
> +
>  &i2c4 {
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&i2c4_pins_a>;
