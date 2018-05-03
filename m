From: Alexandre Torgue <alexandre.torgue@st.com>
Subject: Re: [PATCH v1 2/3] ARM: dts: stm32: add cec pins to stm32mp157c
Date: Thu, 3 May 2018 14:16:26 +0200
Message-ID: <298dd3aa-037c-5f8b-a276-9c9a8bcb67ac@st.com>
References: <1524556449-5262-1-git-send-email-yannick.fertre@st.com>
 <1524556449-5262-3-git-send-email-yannick.fertre@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1524556449-5262-3-git-send-email-yannick.fertre@st.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: yannick fertre <yannick.fertre@st.com>, Philippe Cornu <philippe.cornu@st.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Loic Pallardy <loic.pallardy@st.com>, Gerald Baeza <gerald.baeza@st.com>, Patrice Chotard <patrice.chotard@st.com>, Kamel Kholti <kamel.kholti@st.com>
Cc: Benjamin Gaignard <benjamin.gaignard@st.com>
List-Id: devicetree@vger.kernel.org

Hi Yannick

On 04/24/2018 09:54 AM, yannick fertre wrote:
> This patch adds cec support on stm32mp157c eval board.
> 
> Signed-off-by: Yannick Fertre <yannick.fertre@st.com>
> ---
>   arch/arm/boot/dts/stm32mp157-pinctrl.dtsi | 9 +++++++++
>   1 file changed, 9 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/stm32mp157-pinctrl.dtsi b/arch/arm/boot/dts/stm32mp157-pinctrl.dtsi
> index 6f044100..67b0349 100644
> --- a/arch/arm/boot/dts/stm32mp157-pinctrl.dtsi
> +++ b/arch/arm/boot/dts/stm32mp157-pinctrl.dtsi
> @@ -14,6 +14,15 @@
>   			ranges = <0 0x50002000 0xa400>;
>   			pins-are-numbered;
>   
> +			cec_pins_a: cec@0 {
> +				pins {
> +					pinmux = <STM32_PINMUX('A', 15, AF4)>;
> +					bias-disable;
> +					drive-open-drain;
> +					slew-rate = <0>;
> +				};
> +			};
> +
>   			gpioa: gpio@50002000 {
>   				gpio-controller;
>   				#gpio-cells = <2>;
> 
Next time, please put pins group after gpio controller and don't use 
cec@0 but cec-0 to declare pins group. I'll change it this time during 
merge.

Thanks
Alex
