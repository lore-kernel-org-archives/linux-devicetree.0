From: Alexandre Torgue <alexandre.torgue@st.com>
Subject: Re: [PATCH] ARM: dts: stm32: enable RTC on stm32f769-disco
Date: Tue, 27 Feb 2018 17:00:53 +0100
Message-ID: <b4e88f63-f48b-8333-ca79-0d6f1617a449@st.com>
References: <1518788832-21714-1-git-send-email-amelie.delaunay@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1518788832-21714-1-git-send-email-amelie.delaunay@st.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Amelie Delaunay <amelie.delaunay@st.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Amélie

On 02/16/2018 02:47 PM, Amelie Delaunay wrote:
> This patch enables RTC on stm32f769-disco.
> 
> Signed-off-by: Amelie Delaunay <amelie.delaunay@st.com>
> ---
>   arch/arm/boot/dts/stm32f769-disco.dts | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/stm32f769-disco.dts b/arch/arm/boot/dts/stm32f769-disco.dts
> index 4463ca1..48cb47f 100644
> --- a/arch/arm/boot/dts/stm32f769-disco.dts
> +++ b/arch/arm/boot/dts/stm32f769-disco.dts
> @@ -73,6 +73,10 @@
>   	clock-frequency = <25000000>;
>   };
>   
> +&rtc {
> +	status = "okay";
> +};
> +
>   &usart1 {
>   	pinctrl-0 = <&usart1_pins_a>;
>   	pinctrl-names = "default";
> 

Applied on stm32-next.

Thanks.
Alex
