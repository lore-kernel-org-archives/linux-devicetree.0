From: Wei Xu <xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
Subject: Re: [PATCH] arm64: dts: hi6220: add sd-uhs- properties into dwmmc_1
Date: Fri, 2 Sep 2016 11:21:43 +0100
Message-ID: <57C952B7.3010207@hisilicon.com>
References: <1472649058-22364-1-git-send-email-guodong.xu@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1472649058-22364-1-git-send-email-guodong.xu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Guodong Xu <guodong.xu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ulf Hansson <ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jaehoon Chung <jh80.chung-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Jinguojun <kid.jin-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Guodong,

On 31/08/2016 14:10, Guodong Xu wrote:
> With these properties added, sd cards inserted into hikey can work at UHS
> mode if they have such capability.
> 
> Note, this depends on HiKey UHS-SD support patch [1] to work properly.
> If you didn't add this patch, but added sd-uhs- properties into dwmmc_1,
> then sd cards cannot work. As of this post, patch [1] has been integrated
> into maintainer's next branch [2].
> 
> [1]: [V4] mmc: dw_mmc-k3: UHS-SD card for Hisilicon Hikey,
>  https://patchwork.kernel.org/patch/9262515/
> [2]: https://git.linaro.org/people/ulf.hansson/mmc.git next
>  commit a8a5b2909cfc ("mmc: dw_mmc: k3: UHS-SD card for Hisilicon Hikey")
> 
> cc: Ulf Hansson <ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> cc: Jaehoon Chung <jh80.chung-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> cc: Jinguojun <kid.jin-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
> Signed-off-by: Guodong Xu <guodong.xu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

Applied to the hisi-dt-4.9 branch.
Thanks!

Best Regards,
Wei

> ---
>  arch/arm64/boot/dts/hisilicon/hi6220.dtsi | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/hisilicon/hi6220.dtsi b/arch/arm64/boot/dts/hisilicon/hi6220.dtsi
> index 63608e9..17839db 100644
> --- a/arch/arm64/boot/dts/hisilicon/hi6220.dtsi
> +++ b/arch/arm64/boot/dts/hisilicon/hi6220.dtsi
> @@ -785,6 +785,9 @@
>  			card-detect-delay = <200>;
>  			hisilicon,peripheral-syscon = <&ao_ctrl>;
>  			cap-sd-highspeed;
> +			sd-uhs-sdr12;
> +			sd-uhs-sdr25;
> +			sd-uhs-sdr50;
>  			reg = <0x0 0xf723e000 0x0 0x1000>;
>  			interrupts = <0x0 0x49 0x4>;
>  			#address-cells = <0x1>;
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
