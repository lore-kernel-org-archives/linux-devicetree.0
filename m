From: Patrice Chotard <patrice.chotard-qxv4g6HH51o@public.gmane.org>
Subject: Re: [PATCH] ARM: sti: stih410-clocks: Add PROC_STFE as a critical
 clock
Date: Thu, 20 Oct 2016 15:50:10 +0200
Message-ID: <5d44e490-f6c2-79d4-98da-1d3c7543b1a2@st.com>
References: <1476804957-24000-1-git-send-email-peter.griffin@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1476804957-24000-1-git-send-email-peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org
Cc: lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org



On 10/18/2016 05:35 PM, Peter Griffin wrote:
> Once the ST frontend demux HW IP has been enabled, the clock can't
> be disabled otherwise the system will hang and the board will
> be unserviceable.
> 
> To allow balanced clock enable/disable calls in the driver we use
> the critical clock infrastructure to take an extra reference on the
> clock so the clock will never actually be disabled.
> 
> Signed-off-by: Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>  arch/arm/boot/dts/stih410-clock.dtsi | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/stih410-clock.dtsi b/arch/arm/boot/dts/stih410-clock.dtsi
> index 8598eff..07c8ef9 100644
> --- a/arch/arm/boot/dts/stih410-clock.dtsi
> +++ b/arch/arm/boot/dts/stih410-clock.dtsi
> @@ -208,7 +208,8 @@
>  						     "clk-clust-hades",
>  						     "clk-hwpe-hades",
>  						     "clk-fc-hades";
> -				clock-critical = <CLK_ICN_CPU>,
> +				clock-critical = <CLK_PROC_STFE>,
> +						 <CLK_ICN_CPU>,
>  						 <CLK_TX_ICN_DMU>,
>  						 <CLK_EXT2F_A9>,
>  						 <CLK_ICN_LMI>,
> 

Acked-by: Patrice Chotard <patrice.chotard-qxv4g6HH51o@public.gmane.org>

Applied on sti-dt-for-4.10 branch

Thanks
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
