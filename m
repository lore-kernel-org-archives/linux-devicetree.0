From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v5 3/4] dt-bindings: arm: coresight: Unify funnel DT
 binding
Date: Fri, 26 Apr 2019 09:26:37 -0500
Message-ID: <20190426142637.GA17613@bogus>
References: <20190412102738.12679-1-leo.yan@linaro.org>
 <20190412102738.12679-4-leo.yan@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190412102738.12679-4-leo.yan@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>, Suzuki K Poulose <suzuki.poulose@arm.com>, Mark Rutland <mark.rutland@arm.com>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Leo Yan <leo.yan@linaro.org>, Wanglai Shi <shiwanglai@hisilicon.com>
List-Id: devicetree@vger.kernel.org

On Fri, 12 Apr 2019 18:27:37 +0800, Leo Yan wrote:
> Following the same fashion with replicator DT binding, this patch is to
> unify the DT binding for funnel to support static and dynamic modes;
> finally we get the funnel DT binding as below:
> 
> Before patch:
> 
>   Static funnel, aka. non-configurable funnel:
>     Not supported;
> 
>   Dynamic funnel, aka. configurable funnel:
>     "arm,coresight-funnel", "arm,primecell";
> 
> After patch:
> 
>   Static funnel:
>     "arm,coresight-static-funnel";
> 
>   Dynamic funnel:
>     "arm,coresight-dynamic-funnel", "arm,primecell";
>     "arm,coresight-funnel", "arm,primecell"; (obsolete)
> 
> At the end of this patch, it gives an example for static funnel DT
> binding, and updates the dynamic funnel example.
> 
> Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
> Cc: Suzuki K Poulose <suzuki.poulose@arm.com>
> Cc: Wanglai Shi <shiwanglai@hisilicon.com>
> Signed-off-by: Leo Yan <leo.yan@linaro.org>
> ---
>  .../devicetree/bindings/arm/coresight.txt     | 53 +++++++++++++++++--
>  1 file changed, 48 insertions(+), 5 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
