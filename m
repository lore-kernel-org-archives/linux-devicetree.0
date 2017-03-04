From: Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/2] ARM: qcom_defconfig: Enable Qualcomm remoteproc and
 SMP2P drivers
Date: Fri, 3 Mar 2017 17:20:32 -0800
Message-ID: <20170304012032.GA1694@minitux>
References: <20170215045157.11659-1-j.neuschaefer@gmx.net>
 <20170215045157.11659-2-j.neuschaefer@gmx.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170215045157.11659-2-j.neuschaefer-hi6Y0CQ0nG0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonathan Neusch?fer <j.neuschaefer-hi6Y0CQ0nG0@public.gmane.org>
Cc: linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andy Gross <andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue 14 Feb 20:51 PST 2017, Jonathan Neusch?fer wrote:

> Signed-off-by: Jonathan Neuschäfer <j.neuschaefer-hi6Y0CQ0nG0@public.gmane.org>
> ---
>  arch/arm/configs/qcom_defconfig | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/arch/arm/configs/qcom_defconfig b/arch/arm/configs/qcom_defconfig
> index 4ffdd607205d..97b9e9cd2292 100644
> --- a/arch/arm/configs/qcom_defconfig
> +++ b/arch/arm/configs/qcom_defconfig
> @@ -190,11 +190,16 @@ CONFIG_MDM_LCC_9615=y
>  CONFIG_MSM_MMCC_8960=y
>  CONFIG_MSM_MMCC_8974=y
>  CONFIG_HWSPINLOCK_QCOM=y
> +CONFIG_REMOTEPROC=y
> +CONFIG_QCOM_ADSP_PIL=y
> +CONFIG_QCOM_Q6V5_PIL=y
> +CONFIG_QCOM_WCNSS_PIL=y
>  CONFIG_QCOM_GSBI=y
>  CONFIG_QCOM_PM=y
>  CONFIG_QCOM_SMEM=y
>  CONFIG_QCOM_SMD=y
>  CONFIG_QCOM_SMD_RPM=y
> +CONFIG_QCOM_SMP2P=y

We also need CONFIG_QCOM_SMSM=y here, its currently used to signal state
of the ring buffers for WiFi.

With the addition of that you have my:

Acked-by: Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

Regards,
Bjorn
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
