From: Alexandre Torgue <alexandre.torgue@st.com>
Subject: Re: [PATCH] ARM: dts: stm32: add power supply of otm8009a on
 stm32mp157c-dk2
Date: Wed, 10 Apr 2019 15:54:18 +0200
Message-ID: <757bcb50-0a4e-68e3-521f-997185196ac3@st.com>
References: <1553854406-28992-1-git-send-email-yannick.fertre@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1553854406-28992-1-git-send-email-yannick.fertre@st.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?Q?Yannick_Fertr=c3=a9?= <yannick.fertre@st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Benjamin Gaignard <benjamin.gaignard@st.com>, Philippe Cornu <philippe.cornu@st.com>
List-Id: devicetree@vger.kernel.org

Hi Yannick

On 3/29/19 11:13 AM, Yannick Fertré wrote:
> This patch adds a new property (power-supply) to panel otm8009a (orisetech)
> on stm32mp157c-dk2  & regulator v3v3 which is always set on until the
> implementation of regulator driver.
> 
> Signed-off-by: Yannick Fertré <yannick.fertre@st.com>
> ---
>   arch/arm/boot/dts/stm32mp157c-dk2.dts | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm/boot/dts/stm32mp157c-dk2.dts b/arch/arm/boot/dts/stm32mp157c-dk2.dts
> index 363aeb9..20ea601 100644
> --- a/arch/arm/boot/dts/stm32mp157c-dk2.dts
> +++ b/arch/arm/boot/dts/stm32mp157c-dk2.dts
> @@ -50,6 +50,7 @@
>   		compatible = "orisetech,otm8009a";
>   		reg = <0>;
>   		reset-gpios = <&gpioe 4 GPIO_ACTIVE_LOW>;
> +		power-supply = <&v3v3>;
>   		status = "okay";
>   
>   		port {
> 

Applied on stm32-next. I just updated the commit message as regulator 
fixed hook is no more used due to stpmic1 merge.

Thanks.
Alex
