From: Suzuki K Poulose <suzuki.poulose@arm.com>
Subject: Re: [PATCH v5 4/4] coresight: funnel: Support static funnel
Date: Fri, 3 May 2019 16:11:50 +0100
Message-ID: <16ae9127-b282-e6b8-3a6c-5165c8618bb4@arm.com>
References: <20190412102738.12679-1-leo.yan@linaro.org>
 <20190412102738.12679-5-leo.yan@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190412102738.12679-5-leo.yan@linaro.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: leo.yan@linaro.org, mathieu.poirier@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, alexander.shishkin@linux.intel.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: shiwanglai@hisilicon.com
List-Id: devicetree@vger.kernel.org

Leo,


On 12/04/2019 11:27, Leo Yan wrote:
> Since CoreSight hardware topology can use a 'hidden' funnel in the
> trace data path, this kind funnel doesn't have register for accessing
> and is used by default from hardware design perspective.  Below is an
> example for related hardware topology:
> 
>    +------+  +------+
>    | cpu0 |->| ETM  |-\
>    +------+  +------+  \-> +--------+  +-----+
>     ......                 | Funnel |->| ETF |-\    Hidden funnel
>    +------+  +------+  /-> +--------+  +-----+  \        |
>    | cpu3 |->| ETM  |-/                          \       V
>    +------+  +------+                             \-> +--------+
>                                                       | Funnel |-> ...
>    +------+  +------+                             /-> +--------+
>    | cpu4 |->| ETM  |-\                          /
>    +------+  +------+  \-> +--------+  +-----+  /
>     ......                 | Funnel |->| ETF |-/
>    +------+  +------+  /-> +--------+  +-----+
>    | cpu7 |->| ETM  |-/
>    +------+  +------+
> 
> The CoreSight funnel driver only supports dynamic funnel with
> registration register resource, thus it cannot support for the static
> funnel case and it's impossible to create trace data path for this case.
> 
> This patch is to extend CoreSight funnel driver to support both for
> static funnel and dynamic funnel.  For the dynamic funnel it reuses the
> code existed in the driver, for static funnel the driver will support
> device probe if without providing register resource and the driver skips
> registers accessing when detect the register base is NULL.
> 
> Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
> Cc: Suzuki K Poulose <suzuki.poulose@arm.com>
> Cc: Wanglai Shi <shiwanglai@hisilicon.com>
> Suggested-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> Signed-off-by: Leo Yan <leo.yan@linaro.org>
> Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>

>   
> +	if (of_device_is_compatible(np, "arm,coresight-funnel"))
> +		pr_warn_once("Uses OBSOLETE CoreSight funnel binding\n");
> +

Given that we now warn about OBSOLETE bindings, please could you fix
the existing DTS in the kernel source tree to use the new binding ?
Similarly for the replicator.

Suzuki
