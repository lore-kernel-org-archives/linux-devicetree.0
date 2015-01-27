From: Bjorn <bjorn@sonymobile.com>
Subject: Re: [PATCH 3/3] pinctrl: qcom: Add msm8916 pinctrl driver
Date: Tue, 27 Jan 2015 09:31:08 -0800
Message-ID: <20150127173107.GE11960@sonymobile.com>
References: <1421745476-6276-1-git-send-email-svarbanov@mm-sol.com>
 <1421745476-6276-4-git-send-email-svarbanov@mm-sol.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1421745476-6276-4-git-send-email-svarbanov@mm-sol.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Stanimir Varbanov <svarbanov@mm-sol.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Kumar Gala <galak@codeaurora.org>, Grant Likely <grant.likely@linaro.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Joonwoo Park <joonwoop@codeaurora.org>
List-Id: devicetree@vger.kernel.org

On Tue 20 Jan 01:17 PST 2015, Stanimir Varbanov wrote:

> From: Joonwoo Park <joonwoop@codeaurora.org>
> 
> Add initial pinctrl driver to support pin configuration with
> pinctrl framework for msm8916.
> 
> Signed-off-by: Joonwoo Park <joonwoop@codeaurora.org>
> Signed-off-by: Stanimir Varbanov <svarbanov@mm-sol.com>
> ---
[..]
> +
> +static const struct msm_pingroup msm8916_groups[] = {
> +       PINGROUP(0, blsp_spi1, blsp_uart1, blsp_uim1, dmic0_clk, NA, NA, NA, NA,
> +                NA),

It's totally okay not to line break these things...

> +       PINGROUP(1, blsp_spi1, blsp_uart1, blsp_uim1, dmic0_data, NA, NA, NA,
> +                NA, NA),
> +       PINGROUP(2, blsp_spi1, blsp_uart1, blsp_i2c1, NA, NA, NA, NA, NA, NA),
[..]
> +};
> +
[..]

My documentation is lacking the pingroup table, the rest is:
Reviewed-by: Bjorn Andersson <bjorn.andersson@sonymobile.com>

Regards,
Bjorn
