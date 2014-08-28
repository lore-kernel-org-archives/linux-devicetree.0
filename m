From: Maxime Coquelin <maxime.coquelin-qxv4g6HH51o@public.gmane.org>
Subject: Re: [STLinux Kernel] [PATCH 1/1] i2c: i2c-st: Rename clock reference
 to something that exists
Date: Thu, 28 Aug 2014 16:31:49 +0200
Message-ID: <53FF3D55.40006@st.com>
References: <1409234523-20240-1-git-send-email-lee.jones@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1409234523-20240-1-git-send-email-lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org, wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Lee,

On 08/28/2014 04:02 PM, Lee Jones wrote:
> CLK_S_ICN_REG_0 hasn't existed for a while now.  This was renamed
> over a few commits, then finally removed in commit 5aa02b9 (ARM:
> STi: DT: STiH415: Remove unused CLK_S_ICN_REG_0 fixed clock).
>
> Signed-off-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

Maybe it will be part of my next pull-requests, but in case it is not, 
you can add my:
Acked-by: Maxime Coquelin <maxime.coquelin-qxv4g6HH51o@public.gmane.org>

Thanks,
Maxime
> ---
>   Documentation/devicetree/bindings/i2c/i2c-st.txt | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/i2c/i2c-st.txt b/Documentation/devicetree/bindings/i2c/i2c-st.txt
> index 437e0db..4c26fda 100644
> --- a/Documentation/devicetree/bindings/i2c/i2c-st.txt
> +++ b/Documentation/devicetree/bindings/i2c/i2c-st.txt
> @@ -31,7 +31,7 @@ i2c0: i2c@fed40000 {
>   	compatible	= "st,comms-ssc4-i2c";
>   	reg		= <0xfed40000 0x110>;
>   	interrupts	=  <GIC_SPI 187 IRQ_TYPE_LEVEL_HIGH>;
> -	clocks		= <&CLK_S_ICN_REG_0>;
> +	clocks		= <&clk_s_a0_ls CLK_ICN_REG>;
>   	clock-names	= "ssc";
>   	clock-frequency = <400000>;
>   	pinctrl-names	= "default";
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
