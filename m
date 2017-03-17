From: Leo Yan <leo.yan@linaro.org>
Subject: Re: [PATCH v4 2/7] coresight: of_get_coresight_platform_data: Add
 missing of_node_put
Date: Fri, 17 Mar 2017 23:25:23 +0800
Message-ID: <20170317152523.GC2020@leoy-linaro>
References: <1489762943-25849-1-git-send-email-leo.yan@linaro.org>
 <1489762943-25849-3-git-send-email-leo.yan@linaro.org>
 <574d8e6b-cd2d-c1be-6c14-09e8be147e93@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <574d8e6b-cd2d-c1be-6c14-09e8be147e93@arm.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Suzuki K Poulose <Suzuki.Poulose@arm.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Wei Xu <xuwei5@hisilicon.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, Guodong Xu <guodong.xu@linaro.org>, John Stultz <john.stultz@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-clk@vger.kernel.org, mike.leach@linaro.org, sudeep.holla@arm.com
List-Id: devicetree@vger.kernel.org

On Fri, Mar 17, 2017 at 03:09:23PM +0000, Suzuki K Poulose wrote:
> On 17/03/17 15:02, Leo Yan wrote:
> >From: Suzuki K Poulose <suzuki.poulose@arm.com>
> >
> >The of_get_coresight_platform_data iterates over the possible CPU nodes
> >to find a given cpu phandle. However it does not drop the reference
> >to the node pointer returned by the of_get_coresight_platform_data.
> >
> >[Leo: minor tweaks for of_get_coresight_platform_data]
> >
> >Cc: Leo Yan <leo.yan@linaro.org>
> >Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
> >Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> 
> You should add your Signed-off-by here when you send somebody's patch, irrespective
> of whether you have modified it or not.
> e.g:
> 
> Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> [Leo: minor tweaks for of_get_coresight_platform_data]
> Signed-off-by: Leo Yan <leo.yan@linaro.org>

Thanks for pointing out this. Will follow up later.

[...]

Thanks,
Leo Yan
