From: Michal Simek <michal.simek@xilinx.com>
Subject: Re: [PATCH v5 2/3] firmware: xilinx: Implement ZynqMP power
 management APIs
Date: Tue, 29 Jan 2019 14:11:09 +0100
Message-ID: <e4b34ee3-49ba-8b6e-76ad-69bf078a8256@xilinx.com>
References: <1547493778-22720-1-git-send-email-jollys@xilinx.com>
 <1547493778-22720-3-git-send-email-jollys@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1547493778-22720-3-git-send-email-jollys@xilinx.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jolly Shah <jolly.shah@xilinx.com>, matthias.bgg@gmail.com, andy.gross@linaro.org, shawnguo@kernel.org, geert+renesas@glider.be, bjorn.andersson@linaro.org, sean.wang@mediatek.com, m.szyprowski@samsung.com, michal.simek@xilinx.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: rajanv@xilinx.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Rajan Vaja <rajan.vaja@xilinx.com>, Jolly Shah <jollys@xilinx.com>
List-Id: devicetree@vger.kernel.org

On 14. 01. 19 20:22, Jolly Shah wrote:
> From: Rajan Vaja <rajan.vaja@xilinx.com>
> 
> Add Xilinx ZynqMP firmware APIs to set suspend mode
> and inform firmware that master has initialized its
> own power management.
> 
> Signed-off-by: Rajan Vaja <rajan.vaja@xilinx.com>
> Signed-off-by: Jolly Shah <jollys@xilinx.com>
> ---
>  drivers/firmware/xilinx/zynqmp.c     | 29 +++++++++++++++++++++++++++++
>  include/linux/firmware/xlnx-zynqmp.h | 20 ++++++++++++++++++++
>  2 files changed, 49 insertions(+)
> 
> diff --git a/drivers/firmware/xilinx/zynqmp.c b/drivers/firmware/xilinx/zynqmp.c
> index 84b3fd2..c7a3b6c 100644
> --- a/drivers/firmware/xilinx/zynqmp.c
> +++ b/drivers/firmware/xilinx/zynqmp.c
> @@ -428,6 +428,33 @@ static int zynqmp_pm_clock_getparent(u32 clock_id, u32 *parent_id)
>  	return ret;
>  }
>  
> +/**
> + * zynqmp_pm_init_finalize() - PM call to inform firmware that the caller
> + *			       master has initialized its own power management
> + *
> + * This API function is to be used for notify the power management controller
> + * about the completed power management initialization.
> + *
> + * Return: Returns status, either success or error+reason
> + */
> +static int zynqmp_pm_init_finalize(void)
> +{
> +	return zynqmp_pm_invoke_fn(PM_PM_INIT_FINALIZE, 0, 0, 0, 0, NULL);
> +}
> +
> +/**
> + * zynqmp_pm_set_suspend_mode()	- Set system suspend mode
> + * @mode:	Mode to set for system suspend
> + *
> + * This API function is used to set mode of system suspend.
> + *
> + * Return: Returns status, either success or error+reason
> + */
> +static int zynqmp_pm_set_suspend_mode(u32 mode)
> +{
> +	return zynqmp_pm_invoke_fn(PM_SET_SUSPEND_MODE, mode, 0, 0, 0, NULL);
> +}
> +
>  static const struct zynqmp_eemi_ops eemi_ops = {
>  	.get_api_version = zynqmp_pm_get_api_version,
>  	.query_data = zynqmp_pm_query_data,
> @@ -440,6 +467,8 @@ static const struct zynqmp_eemi_ops eemi_ops = {
>  	.clock_getrate = zynqmp_pm_clock_getrate,
>  	.clock_setparent = zynqmp_pm_clock_setparent,
>  	.clock_getparent = zynqmp_pm_clock_getparent,
> +	.init_finalize = zynqmp_pm_init_finalize,
> +	.set_suspend_mode = zynqmp_pm_set_suspend_mode,

This has been created long time ago and there was one more patch in the
middle of this.
I have applied reset driver just now which didn't have any issue that's
why please rebase your patches on the top of this branch
https://github.com/Xilinx/linux-xlnx/commits/zynqmp/soc and resend.

Thanks,
Michal
