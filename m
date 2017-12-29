From: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH v11 3/6] clk: qcom: Add A53 PLL support
Date: Thu, 28 Dec 2017 16:01:24 -0800
Message-ID: <20171229000124.GB7997@codeaurora.org>
References: <20171205154701.27730-1-georgi.djakov@linaro.org>
 <20171205154701.27730-4-georgi.djakov@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20171205154701.27730-4-georgi.djakov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Georgi Djakov <georgi.djakov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 12/05, Georgi Djakov wrote:
> The CPUs on Qualcomm MSM8916-based platforms are clocked by two PLLs,
> a primary (A53) CPU PLL and a secondary fixed-rate GPLL0. These sources
> are connected to a mux and half-integer divider, which is feeding the
> CPU cores.
> 
> This patch adds support for the primary CPU PLL which generates the
> higher range of frequencies above 1GHz.
> 
> Signed-off-by: Georgi Djakov <georgi.djakov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Acked-by: Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
