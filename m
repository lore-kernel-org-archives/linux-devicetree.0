From: Jordan Crouse <jcrouse@codeaurora.org>
Subject: Re: [PATCH 1/7] PM / OPP: Add dev_pm_opp_get_of_node()
Date: Mon, 9 Apr 2018 09:17:14 -0600
Message-ID: <20180409151714.GB5491@jcrouse-lnx.qualcomm.com>
References: <20180316040824.21472-1-rnayak@codeaurora.org>
 <20180316040824.21472-2-rnayak@codeaurora.org>
 <152310602935.180276.13934458024242240384@swboyd.mtv.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <152310602935.180276.13934458024242240384@swboyd.mtv.corp.google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <swboyd@chromium.org>
Cc: Rajendra Nayak <rnayak@codeaurora.org>, andy.gross@linaro.org, ulf.hansson@linaro.org, viresh.kumar@linaro.org, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Sat, Apr 07, 2018 at 06:00:29AM -0700, Stephen Boyd wrote:
> Quoting Rajendra Nayak (2018-03-15 21:08:18)
> > From: Viresh Kumar <viresh.kumar@linaro.org>
> > 
> > This adds a new helper to let the power domain drivers to access
> > opp->np, so that they can read platform specific properties from the
> > node.
> > 
> > Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> > Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> > ---
> 
> Are there two versions of this patch floating around?

The other one was mine, but it is identical to this.

Jordan
-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
