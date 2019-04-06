From: Leo Yan <leo.yan@linaro.org>
Subject: Re: [PATCH v4 3/4] dt-bindings: arm: coresight: Unify funnel DT
 binding
Date: Sat, 6 Apr 2019 19:29:57 +0800
Message-ID: <20190406112957.GA18883@leoy-ThinkPad-X240s>
References: <20190406112145.15184-1-leo.yan@linaro.org>
 <20190406112145.15184-4-leo.yan@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190406112145.15184-4-leo.yan@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mathieu Poirier <mathieu.poirier@linaro.org>, Suzuki K Poulose <suzuki.poulose@arm.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Wanglai Shi <shiwanglai@hisilicon.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Rob, Suzuki,

On Sat, Apr 06, 2019 at 07:21:44PM +0800, Leo Yan wrote:
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
>     "arm,coresight-funnel", "arm,primecell"; (obsolete)
>     "arm,coresight-dynamic-funnel", "arm,primecell";
> 
> At the end of this patch, it gives an example for static funnel DT
> binding, and updates the dynamic funnel example.
> 
> Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
> Cc: Suzuki K Poulose <suzuki.poulose@arm.com>
> Cc: Wanglai Shi <shiwanglai@hisilicon.com>
> Signed-off-by: Leo Yan <leo.yan@linaro.org>

Though you gave the reviewing tag for patch v3, but in v4 I added a new
compatible string "arm,coresight-dynamic-funnel" and mark
"arm,coresight-funnel" as obsolete; and also changed the commit log.

For this reason I didn't add your tags in this patch, so please review
again.  Thanks!
