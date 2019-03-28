From: Suzuki K Poulose <suzuki.poulose@arm.com>
Subject: Re: [PATCH v3 2/2] coresight: funnel: Support static funnel
Date: Thu, 28 Mar 2019 19:26:16 +0000
Message-ID: <799f3f27-6a20-836e-b699-252ebb8e2fdf@arm.com>
References: <20190328023509.22242-1-leo.yan@linaro.org>
 <20190328023509.22242-3-leo.yan@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190328023509.22242-3-leo.yan@linaro.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: leo.yan@linaro.org, mathieu.poirier@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, alexander.shishkin@linux.intel.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, coresight@lists.linaro.org, shiwanglai@hisilicon.com
List-Id: devicetree@vger.kernel.org

On 03/28/2019 02:35 AM, Leo Yan wrote:
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

Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
