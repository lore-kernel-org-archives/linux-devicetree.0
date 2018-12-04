From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH v5 8/8] soc: qcom: rpmhpd: Mark mx as a parent for cx
Date: Tue, 4 Dec 2018 10:56:40 +0530
Message-ID: <20181204052640.ix2tschgffhy3tp7@vireshk-i7>
References: <20181204052119.806-1-rnayak@codeaurora.org>
 <20181204052119.806-9-rnayak@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181204052119.806-9-rnayak@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rajendra Nayak <rnayak@codeaurora.org>
Cc: robh@kernel.org, sboyd@kernel.org, andy.gross@linaro.org, ulf.hansson@linaro.org, collinsd@codeaurora.org, mka@chromium.org, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 04-12-18, 10:51, Rajendra Nayak wrote:
> Specify the active + sleep and active-only MX power domains as
> the parents of the corresponding CX power domains. This will ensure that
> performance state requests on CX automatically generate equivalent requests
> on MX power domains.
> 
> This is used to enforce a requirement that exists for various
> hardware blocks on SDM845 that MX performance state >= CX performance
> state for a given operating frequency.
> 
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> ---
> This patch is dependent on the series from
> Viresh [1] which adds support to propogate performance states across the
> power domain hierarchy which is still being reviewed.
> 
> [1] https://lkml.org/lkml/2018/11/26/333
> 
>  drivers/soc/qcom/rpmhpd.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
