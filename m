From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2] clk: qcom: smd-rpmcc: Add msm8974 clocks
Date: Mon, 21 Nov 2016 10:18:08 -0600
Message-ID: <20161121161808.5kebw6r5lxnepqau@rob-hp-laptop>
References: <1479486805-21853-1-git-send-email-bjorn.andersson@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1479486805-21853-1-git-send-email-bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Georgi Djakov <georgi.djakov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Nov 18, 2016 at 08:33:25AM -0800, Bjorn Andersson wrote:
> This adds all RPM based clocks for msm8974, except cxo and
> gfx3d_clk_src.
> 
> Tested-by: Georgi Djakov <georgi.djakov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Signed-off-by: Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
> 
> Changes since v1:
> - Fixed the screwed up indentation
> 
>  .../devicetree/bindings/clock/qcom,rpmcc.txt       |  1 +

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

>  drivers/clk/qcom/clk-smd-rpm.c                     | 71 ++++++++++++++++++++++
>  include/dt-bindings/clock/qcom,rpmcc.h             | 40 +++++++++++-
>  3 files changed, 110 insertions(+), 2 deletions(-)
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
