From: Suzuki K Poulose <suzuki.poulose@arm.com>
Subject: Re: [PATCH v5 2/4] coresight: replicator: Add new device id for
 static replicator
Date: Fri, 12 Apr 2019 11:41:11 +0100
Message-ID: <489e8aff-b279-b984-1cd2-f528a46eb2fe@arm.com>
References: <20190412102738.12679-1-leo.yan@linaro.org>
 <20190412102738.12679-3-leo.yan@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190412102738.12679-3-leo.yan@linaro.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: leo.yan@linaro.org, mathieu.poirier@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, alexander.shishkin@linux.intel.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 04/12/2019 11:27 AM, Leo Yan wrote:
> This patch adds a device id for the new static replicator compatible
> string; it changes the driver name from "coresight-replicator" to
> "coresight-static-replicator" as well.
> 
> This patch also gives warning when use the replicator obsolete DT
> binding.
> 
> Signed-off-by: Leo Yan <leo.yan@linaro.org>
> ---
>   drivers/hwtracing/coresight/coresight-replicator.c | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-replicator.c b/drivers/hwtracing/coresight/coresight-replicator.c
> index 4e0da85efd2d..8c9ce74498e1 100644
> --- a/drivers/hwtracing/coresight/coresight-replicator.c
> +++ b/drivers/hwtracing/coresight/coresight-replicator.c
> @@ -189,6 +189,9 @@ static int replicator_probe(struct device *dev, struct resource *res)
>   		dev->platform_data = pdata;
>   	}
>   
> +	if (of_device_is_compatible(np, "arm,coresight-replicator"))
> +		pr_warn_once("Uses OBSOLETE CoreSight replicator binding\n");
> +
>   	drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
>   	if (!drvdata)
>   		return -ENOMEM;
> @@ -285,13 +288,14 @@ static const struct dev_pm_ops replicator_dev_pm_ops = {
>   
>   static const struct of_device_id static_replicator_match[] = {
>   	{.compatible = "arm,coresight-replicator"},
> +	{.compatible = "arm,coresight-static-replicator"},
>   	{}
>   };
>   
>   static struct platform_driver static_replicator_driver = {
>   	.probe          = static_replicator_probe,
>   	.driver         = {
> -		.name   = "coresight-replicator",
> +		.name   = "coresight-static-replicator",
>   		.of_match_table = static_replicator_match,
>   		.pm	= &replicator_dev_pm_ops,
>   		.suppress_bind_attrs = true,
> 

Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
