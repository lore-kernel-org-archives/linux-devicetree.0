From: Alexandre Torgue <alexandre.torgue@st.com>
Subject: Re: [PATCH] ARM: dts: stm32: Enable thermal sensor support on
 STM32MP157c-ed1
Date: Mon, 4 Feb 2019 09:23:53 +0100
Message-ID: <c9a95fd1-3875-117c-d1b4-d9567da6e561@st.com>
References: <1544178482-30494-1-git-send-email-david.hernandezsanchez@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1544178482-30494-1-git-send-email-david.hernandezsanchez@st.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: David HERNANDEZ SANCHEZ <david.hernandezsanchez@st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: "linux-stm32@st-md-mailman.stormreply.com" <linux-stm32@st-md-mailman.stormreply.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi David

On 12/7/18 11:28 AM, David HERNANDEZ SANCHEZ wrote:
> Enable STM32 Digital Thermal Sensor (dts) driver for
> STM32MP157c-ed1 board.
> 
> Signed-off-by: David Hernandez Sanchez <david.hernandezsanchez@st.com>
> 
> diff --git a/arch/arm/boot/dts/stm32mp157c-ed1.dts 
> b/arch/arm/boot/dts/stm32mp157c-ed1.dts
> index c3ecb1e..98ef7a0 100644
> --- a/arch/arm/boot/dts/stm32mp157c-ed1.dts
> +++ b/arch/arm/boot/dts/stm32mp157c-ed1.dts
> @@ -49,6 +49,10 @@
>           };
>   };
> 
> +&dts {
> +       status = "okay";
> +};
> +
>   &i2c4 {
>           pinctrl-names = "default";
>           pinctrl-0 = <&i2c4_pins_a>;
> -- 
> 2.7.4

Applied on stm32-next.

Thanks.
Alex
