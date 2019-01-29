From: Leo Yan <leo.yan@linaro.org>
Subject: Re: [PATCHv5 6/7] coresight: debug: Add Unique Component Identifier
 (UCI) table
Date: Tue, 29 Jan 2019 21:25:28 +0800
Message-ID: <20190129132528.GA16669@leoy-ThinkPad-X240s>
References: <cover.1548419933.git.saiprakash.ranjan@codeaurora.org>
 <1019e6fed1ade6a580f01df9b3f70c2a9df5b3be.1548419933.git.saiprakash.ranjan@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1019e6fed1ade6a580f01df9b3f70c2a9df5b3be.1548419933.git.saiprakash.ranjan@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@linaro.org>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Vivek Gautam <vivek.gautam@codeaurora.org>, Jeffrey Hugo <jhugo@codeaurora.org>, Doug Anderson <dianders@chromium.org>, Stephen Boyd <sboyd@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, devicetree@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Marc Gonzalez <marc.w.gonzalez@free.fr>, Rajendra Nayak <rnayak@codeaurora.org>, Sibi Sankar <sibis@codeaurora.org>, Tingwei Zhang <tingwei@codeaurora.org>, linux-arm-kernel@lists.infradead.org, linux-kerne
List-Id: devicetree@vger.kernel.org

On Tue, Jan 29, 2019 at 12:44:03AM +0530, Sai Prakash Ranjan wrote:
> Add UCI table and a helper macro for coresight CPU debug
> module. This patch adds the UCI entries for Krypo CPUs
> found on MSM8996 which shares the same PIDs as ETMs.
> 
> Without this, below error is observed on MSM8996:
> 
> [    5.429867] OF: graph: no port node found in /soc/debug@3810000
> [    5.429938] coresight-etm4x: probe of 3810000.debug failed with error -22
> [    5.435415] coresight-cpu-debug 3810000.debug: Coresight debug-CPU0 initialized
> [    5.446474] OF: graph: no port node found in /soc/debug@3910000
> [    5.448927] coresight-etm4x: probe of 3910000.debug failed with error -22
> [    5.454681] coresight-cpu-debug 3910000.debug: Coresight debug-CPU1 initialized
> [    5.487765] OF: graph: no port node found in /soc/debug@3a10000
> [    5.488007] coresight-etm4x: probe of 3a10000.debug failed with error -22
> [    5.493024] coresight-cpu-debug 3a10000.debug: Coresight debug-CPU2 initialized
> [    5.501802] OF: graph: no port node found in /soc/debug@3b10000
> [    5.512901] coresight-etm4x: probe of 3b10000.debug failed with error -22
> [    5.513192] coresight-cpu-debug 3b10000.debug: Coresight debug-CPU3 initialized
> 
> Also add a helper macro to make adding CPU PIDs easier
> similar to ETM4X driver.
> 
> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>

Looks good to me and tested on my Hikey board (though I cannot test
for a device with UCI ID):

Reviewed-and-tested-by: Leo Yan <leo.yan@linaro.org>

> ---
> This patch depends on UCI support by Mike Leach in below link:
>  https://lore.kernel.org/lkml/20190121233151.13363-2-mike.leach@linaro.org/
> ---
>  .../hwtracing/coresight/coresight-cpu-debug.c | 41 +++++++++++++------
>  1 file changed, 28 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-cpu-debug.c b/drivers/hwtracing/coresight/coresight-cpu-debug.c
> index 45b2460f3166..a126ed0b9a76 100644
> --- a/drivers/hwtracing/coresight/coresight-cpu-debug.c
> +++ b/drivers/hwtracing/coresight/coresight-cpu-debug.c
> @@ -655,20 +655,35 @@ static int debug_remove(struct amba_device *adev)
>  	return 0;
>  }
>  
> +#define DEBUG_AMBA_ID(pid)			\
> +	{					\
> +		.id	= pid,			\
> +		.mask	= 0x000fffff,		\
> +	}
> +
> +static struct amba_cs_uci_id uci_id_debug[] = {
> +	{
> +		/*  CPU Debug UCI data */
> +		.devarch	= 0x47706a15,
> +		.devarch_mask	= 0xfff0ffff,
> +		.devtype	= 0x00000015,
> +	}
> +};
> +
> +#define DEBUG_AMBA_UCI_ID(pid)			\
> +	{					\
> +		.id	= pid,			\
> +		.mask	= 0x000fffff,		\
> +		.data	= uci_id_debug,		\
> +	}
> +
>  static const struct amba_id debug_ids[] = {
> -	{       /* Debug for Cortex-A53 */
> -		.id	= 0x000bbd03,
> -		.mask	= 0x000fffff,
> -	},
> -	{       /* Debug for Cortex-A57 */
> -		.id	= 0x000bbd07,
> -		.mask	= 0x000fffff,
> -	},
> -	{       /* Debug for Cortex-A72 */
> -		.id	= 0x000bbd08,
> -		.mask	= 0x000fffff,
> -	},
> -	{ 0, 0 },
> +	DEBUG_AMBA_ID(0x000bbd03),		/* Cortex-A53 */
> +	DEBUG_AMBA_ID(0x000bbd07),		/* Cortex-A57 */
> +	DEBUG_AMBA_ID(0x000bbd08),		/* Cortex-A72 */
> +	DEBUG_AMBA_UCI_ID(0x000f0205),		/* Qualcomm Kryo */
> +	DEBUG_AMBA_UCI_ID(0x000f0211),		/* Qualcomm Kryo */
> +	{},
>  };
>  
>  static struct amba_driver debug_driver = {
> -- 
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation
> 
