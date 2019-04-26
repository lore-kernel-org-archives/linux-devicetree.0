From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v5 1/4] dt-bindings: arm: coresight: Add new compatible
 for static replicator
Date: Fri, 26 Apr 2019 09:25:22 -0500
Message-ID: <20190426142522.GA15387@bogus>
References: <20190412102738.12679-1-leo.yan@linaro.org>
 <20190412102738.12679-2-leo.yan@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190412102738.12679-2-leo.yan@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>, Suzuki K Poulose <suzuki.poulose@arm.com>, Mark Rutland <mark.rutland@arm.com>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Leo Yan <leo.yan@linaro.org>
List-Id: devicetree@vger.kernel.org

On Fri, 12 Apr 2019 18:27:35 +0800, Leo Yan wrote:
> CoreSight uses below bindings for replicator:
> 
>   Dynamic replicator, aka. configurable replicator:
>     "arm,coresight-dynamic-replicator", "arm,primecell";
> 
>   Static replicator, aka. non-configurable replicator:
>     "arm,coresight-replicator";
> 
> The compatible string "arm,coresight-replicator" is not an explicit
> naming to express the replicator is 'static'.  To unify the naming
> convention, this patch introduces a new compatible string
> "arm,coresight-static-replicator" for the static replicator; the
> compatible string "arm,coresight-replicator" is kept for backward
> compatibility, but tag it as obsolete and suggest to use the new
> compatible string.
> 
> As result CoreSight replicator have below bindings:
> 
>   Dynamic replicator:
>     "arm,coresight-dynamic-replicator", "arm,primecell";
> 
>   Static replicator:
>     "arm,coresight-static-replicator";
>     "arm,coresight-replicator"; (obsolete)
> 
> Signed-off-by: Leo Yan <leo.yan@linaro.org>
> ---
>  Documentation/devicetree/bindings/arm/coresight.txt | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
