From: Alexandre Torgue <alexandre.torgue@st.com>
Subject: Re: [PATCH] ARM: dts: stm32: add focaltech touchscreen on
 stm32mp157c-dk2 board
Date: Thu, 3 Oct 2019 12:34:17 +0200
Message-ID: <09ad1310-ebc5-7a41-7af6-cdef79f20802@st.com>
References: <1569854751-22337-1-git-send-email-yannick.fertre@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1569854751-22337-1-git-send-email-yannick.fertre@st.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?Q?Yannick_Fertr=c3=a9?= <yannick.fertre@st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Benjamin Gaignard <benjamin.gaignard@st.com>, Philippe Cornu <philippe.cornu@st.com>, Fabrice Gasnier <fabrice.gasnier@st.com>
List-Id: devicetree@vger.kernel.org

Hi Yannick

On 9/30/19 4:45 PM, Yannick Fertré wrote:
> Enable focaltech ft6236 touchscreen on STM32MP157C-DK2 board.
> This device supports 2 different addresses (0x2a and 0x38)
> depending on the display  board version (MB1407).
> 
> Signed-off-by: Yannick Fertré <yannick.fertre@st.com>
> ---
>   arch/arm/boot/dts/stm32mp157c-dk2.dts | 23 +++++++++++++++++++++++
>   1 file changed, 23 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/stm32mp157c-dk2.dts b/arch/arm/boot/dts/stm32mp157c-dk2.dts
> index 20ea601..527bb75 100644
> --- a/arch/arm/boot/dts/stm32mp157c-dk2.dts
> +++ b/arch/arm/boot/dts/stm32mp157c-dk2.dts
> @@ -61,6 +61,29 @@
>   	};
>   };
>   
> +&i2c1 {
> +	touchscreen@2a {
> +		compatible = "focaltech,ft6236";
> +		reg = <0x2a>;
> +		interrupts = <2 2>;
> +		interrupt-parent = <&gpiof>;
> +		interrupt-controller;
> +		touchscreen-size-x = <480>;
> +		touchscreen-size-y = <800>;
> +		status = "okay";
> +	};
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

I'm not confident by this duplication. We should only support the latest 
revision of the MB1407. I understand the need but my fear is to 
duplicate this node each time we have a new revision (and imagine if we 
do that for all i2c devices).

regards
alex


>   &ltdc {
>   	status = "okay";
>   
> 
