From: Suzuki K Poulose <suzuki.poulose@arm.com>
Subject: Re: [PATCHv5 5/7] coresight: etm4x: Add ETM PIDs for SDM845 and
 MSM8996
Date: Tue, 29 Jan 2019 09:28:03 +0000
Message-ID: <bf0337b0-2b1c-f296-8a1d-e8a8f993c274@arm.com>
References: <cover.1548419933.git.saiprakash.ranjan@codeaurora.org>
 <cb7d3e715f154942fba1597b91d5b13c25f607e7.1548419933.git.saiprakash.ranjan@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cb7d3e715f154942fba1597b91d5b13c25f607e7.1548419933.git.saiprakash.ranjan@codeaurora.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: saiprakash.ranjan@codeaurora.org, robh+dt@kernel.org, mathieu.poirier@linaro.org, mike.leach@linaro.org, leo.yan@linaro.org, alexander.shishkin@linux.intel.com, andy.gross@linaro.org, david.brown@linaro.org, vivek.gautam@codeaurora.org, jhugo@codeaurora.org, dianders@chromium.org, sboyd@kernel.org, bjorn.andersson@linaro.org, devicetree@vger.kernel.org, mark.rutland@arm.com, marc.w.gonzalez@free.fr
Cc: rnayak@codeaurora.org, sibis@codeaurora.org, tingwei@codeaurora.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org



On 28/01/2019 19:14, Sai Prakash Ranjan wrote:
> Instead of overriding the peripheral id(PID) check in AMBA
> by hardcoding them in DT, add the PIDs to the ETM4x driver.
> Here we use Unique Component Identifier(UCI) for MSM8996
> since the ETM and CPU debug module shares the same PIDs.
> SDM845 does not support CPU debug module.
> 
> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> 
> ---
> This patch depends on UCI support by Mike Leach in below link:
>   https://lore.kernel.org/lkml/20190121233151.13363-2-mike.leach@linaro.org/
> ---
>   drivers/hwtracing/coresight/coresight-etm4x.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x.c b/drivers/hwtracing/coresight/coresight-etm4x.c
> index fe76b176974a..17731a8ae787 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x.c
> +++ b/drivers/hwtracing/coresight/coresight-etm4x.c
> @@ -1080,6 +1080,10 @@ static const struct amba_id etm4_ids[] = {
>   	ETM4x_AMBA_ID(0x000bb95a),		/* Cortex-A72 */
>   	ETM4x_AMBA_ID(0x000bb959),		/* Cortex-A73 */
>   	ETM4x_AMBA_ID(0x000bb9da),		/* Cortex-A35 */
> +	ETM4x_AMBA_UCI_ID(0x000f0205),		/* Qualcomm Kryo */
> +	ETM4x_AMBA_UCI_ID(0x000f0211),		/* Qualcomm Kryo */
> +	ETM4x_AMBA_ID(0x000bb802),		/* Qualcomm Kryo 385 Cortex-A55 */
> +	ETM4x_AMBA_ID(0x000bb803),		/* Qualcomm Kryo 385 Cortex-A75 */
>   	{},
>   };
>   

Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
