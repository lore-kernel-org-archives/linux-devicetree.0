From: Alexandre Torgue <alexandre.torgue@st.com>
Subject: Re: [PATCH] ARM: dts: stm32: add phy-dsi-supply property on
 stm32mp157c-ev1
Date: Fri, 2 Aug 2019 09:36:17 +0200
Message-ID: <346d04ad-17ed-40c8-f10a-b13a2ea79d92@st.com>
References: <1564410548-20436-1-git-send-email-yannick.fertre@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1564410548-20436-1-git-send-email-yannick.fertre@st.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?Q?Yannick_Fertr=c3=a9?= <yannick.fertre@st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Benjamin Gaignard <benjamin.gaignard@st.com>, Philippe Cornu <philippe.cornu@st.com>, Fabrice Gasnier <fabrice.gasnier@st.com>
List-Id: devicetree@vger.kernel.org

Hi Yannick

On 7/29/19 4:29 PM, Yannick Fertré wrote:
> The dsi physical layer is powered by the 1v8 power controller supply.
> 
> Signed-off-by: Yannick Fertré <yannick.fertre@st.com>
> ---
>   arch/arm/boot/dts/stm32mp157c-ev1.dts | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm/boot/dts/stm32mp157c-ev1.dts b/arch/arm/boot/dts/stm32mp157c-ev1.dts
> index feb8f77..19d69d0 100644
> --- a/arch/arm/boot/dts/stm32mp157c-ev1.dts
> +++ b/arch/arm/boot/dts/stm32mp157c-ev1.dts
> @@ -101,6 +101,7 @@
>   &dsi {
>   	#address-cells = <1>;
>   	#size-cells = <0>;
> +	phy-dsi-supply = <&reg18>;
>   	status = "okay";
>   
>   	ports {
> 

Applied on stm32-next.

Thanks.
Alex
