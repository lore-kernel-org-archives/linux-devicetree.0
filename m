From: Alexandre Torgue <alexandre.torgue@st.com>
Subject: Re: [PATCH] ARM: dts: stm32: add focaltech touchscreen on
 stm32mp157c-dk2 board
Date: Fri, 4 Oct 2019 16:05:13 +0200
Message-ID: <c834748b-17f3-39ca-041b-1be86ad61d76@st.com>
References: <1570195022-23327-1-git-send-email-yannick.fertre@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1570195022-23327-1-git-send-email-yannick.fertre@st.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?Q?Yannick_Fertr=c3=a9?= <yannick.fertre@st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Benjamin Gaignard <benjamin.gaignard@st.com>, Philippe Cornu <philippe.cornu@st.com>, Fabrice Gasnier <fabrice.gasnier@st.com>
List-Id: devicetree@vger.kernel.org

Hi yannick

On 10/4/19 3:17 PM, Yannick Fertré wrote:
> Enable focaltech ft6236 touchscreen on STM32MP157C-DK2 board.
> 
> Signed-off-by: Yannick Fertré <yannick.fertre@st.com>
> ---
>   arch/arm/boot/dts/stm32mp157c-dk2.dts | 13 +++++++++++++
>   1 file changed, 13 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/stm32mp157c-dk2.dts b/arch/arm/boot/dts/stm32mp157c-dk2.dts
> index 20ea601..d44a7c6 100644
> --- a/arch/arm/boot/dts/stm32mp157c-dk2.dts
> +++ b/arch/arm/boot/dts/stm32mp157c-dk2.dts
> @@ -61,6 +61,19 @@
>   	};
>   };
>   
> +&i2c1 {
> +	touchscreen@38 {
> +		compatible = "focaltech,ft6236";
> +		reg = <0x38>;
> +		interrupts = <2 2>;
> +		interrupt-parent = <&gpiof>;
> +		interrupt-controller;
> +		touchscreen-size-x = <480>;
> +		touchscreen-size-y = <800>;
> +		status = "okay";
> +	};
> +};
> +
>   &ltdc {
>   	status = "okay";
>   
> 

For the next time, please don't forget to add "PATCH-v2" as it is a 
second version of this patch.

Applied on stm32-next.

Thanks.
Alex
