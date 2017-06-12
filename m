From: Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>
Subject: Re: [PATCH 1/1] ARM: dts: stm32: Add missing reset-cells node in
 stm32f476
Date: Mon, 12 Jun 2017 11:49:33 +0200
Message-ID: <9be06459-773b-efd0-4ee3-a191d9613ae3@st.com>
References: <1495034156-19593-1-git-send-email-lionel.debieve@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1495034156-19593-1-git-send-email-lionel.debieve-qxv4g6HH51o@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lionel Debieve <lionel.debieve-qxv4g6HH51o@public.gmane.org>, Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Gabriel FERNANDEZ <gabriel.fernandez-qxv4g6HH51o@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Lionel,

On 05/17/2017 05:15 PM, Lionel Debieve wrote:
> rcc node must include reset-cells node.
> 
> Signed-off-by: Lionel Debieve <lionel.debieve-qxv4g6HH51o@public.gmane.org>
> ---
>   arch/arm/boot/dts/stm32f746.dtsi | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm/boot/dts/stm32f746.dtsi b/arch/arm/boot/dts/stm32f746.dtsi
> index c2765ce..b5a04f1 100644
> --- a/arch/arm/boot/dts/stm32f746.dtsi
> +++ b/arch/arm/boot/dts/stm32f746.dtsi
> @@ -336,6 +336,7 @@
>   		};
>   
>   		rcc: rcc@40023800 {
> +			#reset-cells = <1>;
>   			#clock-cells = <2>;
>   			compatible = "st,stm32f746-rcc", "st,stm32-rcc";
>   			reg = <0x40023800 0x400>;
> 

Applied on stm32-dt-for-v4.13

Thanks
Alex
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
