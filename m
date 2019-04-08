From: Suzuki K Poulose <suzuki.poulose@arm.com>
Subject: Re: [PATCH v4 2/4] coresight: replicator: Add new device id for
 static replicator
Date: Mon, 8 Apr 2019 11:46:52 +0100
Message-ID: <6b862aa8-1b50-61bf-6894-978ecd1a964b@arm.com>
References: <20190406112145.15184-1-leo.yan@linaro.org>
 <20190406112145.15184-3-leo.yan@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190406112145.15184-3-leo.yan@linaro.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: leo.yan@linaro.org, mathieu.poirier@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, alexander.shishkin@linux.intel.com, shiwanglai@hisilicon.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 04/06/2019 12:21 PM, Leo Yan wrote:
> This patch adds a device id for the new static replicator compatible
> string; it changes the driver name from "coresight-replicator" to
> "coresight-static-replicator" as well.
> 
> Signed-off-by: Leo Yan <leo.yan@linaro.org>
> ---
>   drivers/hwtracing/coresight/coresight-replicator.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-replicator.c b/drivers/hwtracing/coresight/coresight-replicator.c
> index 4e0da85efd2d..e6a03642bbdb 100644
> --- a/drivers/hwtracing/coresight/coresight-replicator.c
> +++ b/drivers/hwtracing/coresight/coresight-replicator.c
> @@ -285,13 +285,14 @@ static const struct dev_pm_ops replicator_dev_pm_ops = {
>   
>   static const struct of_device_id static_replicator_match[] = {
>   	{.compatible = "arm,coresight-replicator"},
> +	{.compatible = "arm,coresight-static-replicator"},
>   	{}

As mentioned in the previous patch, please could you add a warning if
you encounter the old binding, mentioning that it is OBSOLETE.
pr_warn_once() is sufficient.

Otherwise, looks good.

Suzuki
