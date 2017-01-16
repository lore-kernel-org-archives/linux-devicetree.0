From: Alexandre Torgue <alexandre.torgue@st.com>
Subject: Re: [PATCHv3 RESEND 5/8] ARM: dts: stm32: enable RTC on
 stm32f429-disco
Date: Mon, 16 Jan 2017 15:39:43 +0100
Message-ID: <000f554f-7904-abd4-b7fb-c7983ef5c176@st.com>
References: <1484573388-590-1-git-send-email-amelie.delaunay@st.com>
 <1484573388-590-3-git-send-email-amelie.delaunay@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1484573388-590-3-git-send-email-amelie.delaunay@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Amelie Delaunay <amelie.delaunay@st.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org



On 01/16/2017 02:29 PM, Amelie Delaunay wrote:
> This patch enables RTC on stm32f429-disco with LSI as clock source because
> X2 crystal for LSE is not fitted by default.
>
> Signed-off-by: Amelie Delaunay <amelie.delaunay@st.com>
> ---
>  arch/arm/boot/dts/stm32f429-disco.dts | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/arch/arm/boot/dts/stm32f429-disco.dts b/arch/arm/boot/dts/stm32f429-disco.dts
> index 7d0415e..9222b9f 100644
> --- a/arch/arm/boot/dts/stm32f429-disco.dts
> +++ b/arch/arm/boot/dts/stm32f429-disco.dts
> @@ -94,6 +94,12 @@
>  	clock-frequency = <8000000>;
>  };
>
> +&rtc {
> +	assigned-clocks = <&rcc 1 CLK_RTC>;
> +	assigned-clock-parents = <&rcc 1 CLK_LSI>;
> +	status = "okay";
> +};
> +
>  &usart1 {
>  	pinctrl-0 = <&usart1_pins_a>;
>  	pinctrl-names = "default";
>
Applied on stm32-dt-for-v4.11

Thanks
Alex
