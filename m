From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH v8 08/10] PM / Domains: Add a
 simple_opp_to_performance_state() helper
Date: Wed, 2 Jan 2019 14:30:59 +0530
Message-ID: <20190102090059.lk4ejzjtk3bil66m@vireshk-i7>
References: <20181221085622.25573-1-rnayak@codeaurora.org>
 <20181221085622.25573-9-rnayak@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181221085622.25573-9-rnayak@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rajendra Nayak <rnayak@codeaurora.org>
Cc: andy.gross@linaro.org, robh@kernel.org, sboyd@kernel.org, ulf.hansson@linaro.org, collinsd@codeaurora.org, mka@chromium.org, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 21-12-18, 14:26, Rajendra Nayak wrote:
> +unsigned int simple_opp_to_performance_state(struct generic_pm_domain *genpd,
> +					     struct dev_pm_opp *opp,

Maybe name it as:

dev_pm_opp_read_u32_prop().

-- 
viresh
