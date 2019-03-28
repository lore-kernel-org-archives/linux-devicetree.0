From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: arm: coresight: Support static funnel
Date: Thu, 28 Mar 2019 14:06:48 -0500
Message-ID: <20190328190648.GA24389@bogus>
References: <20190328023509.22242-1-leo.yan@linaro.org>
 <20190328023509.22242-2-leo.yan@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190328023509.22242-2-leo.yan@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>, Suzuki K Poulose <suzuki.poulose@arm.com>, Mark Rutland <mark.rutland@arm.com>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, coresight@lists.linaro.org, Wanglai Shi <shiwanglai@hisilicon.com>, Leo Yan <leo.yan@linaro.org>
List-Id: devicetree@vger.kernel.org

On Thu, 28 Mar 2019 10:35:08 +0800, Leo Yan wrote:
> Document DT binding for static (non-configurable) funnel and give an
> example for it.
> 
> Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
> Cc: Suzuki K Poulose <suzuki.poulose@arm.com>
> Cc: Wanglai Shi <shiwanglai@hisilicon.com>
> Signed-off-by: Leo Yan <leo.yan@linaro.org>
> ---
>  .../devicetree/bindings/arm/coresight.txt     | 45 +++++++++++++++++--
>  1 file changed, 42 insertions(+), 3 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
