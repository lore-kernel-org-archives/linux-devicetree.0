From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH 2/2] pinctrl: qcom: Add SC7180 pinctrl driver
Date: Thu, 1 Aug 2019 07:36:37 -0700
Message-ID: <20190801143637.GY7234@tuxbook-pro>
References: <20190801100717.23333-1-rnayak@codeaurora.org>
 <20190801100717.23333-2-rnayak@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190801100717.23333-2-rnayak@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rajendra Nayak <rnayak@codeaurora.org>
Cc: linus.walleij@linaro.org, linux-arm-msm@vger.kernel.org, agross@kernel.org, robh+dt@kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Jitendra Sharma <shajit@codeaurora.org>, Vivek Gautam <vivek.gautam@codeaurora.org>
List-Id: devicetree@vger.kernel.org

On Thu 01 Aug 03:07 PDT 2019, Rajendra Nayak wrote:

[..]
> +static const struct msm_pingroup sc7180_groups[] = {
> +	[0] = PINGROUP(0, SOUTH, qup01, cri_trng, _, phase_flag, _, _, _, _, _),
> +	[1] = PINGROUP(1, SOUTH, qup01, cri_trng, _, phase_flag, _, _, _, _, _),
> +	[2] = PINGROUP(2, SOUTH, qup01, cri_trng, _, phase_flag, _, _, _, _, _),
> +	[3] = PINGROUP(3, SOUTH, qup01, sp_cmu, dbg_out, qdss_cti, _, _, _, _, _),
> +	[4] = PINGROUP(4, NORTH, sdc1_tb, _, qdss_cti, _, _, _, _, _, _), [5] = PINGROUP(5, NORTH, sdc2_tb, _, _, _, _, _, _, _, _),
> +	[6] = PINGROUP(6, NORTH, qup11, qup11, _, _, _, _, _, _, _), [7] = PINGROUP(7, NORTH, qup11, qup11, ddr_bist, _, _, _, _, _, _),

5 and 7 deserve to be on their own line :)

Apart from that:

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn
