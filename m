From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH V4] pinctrl: qcom: Add msm8994 pinctrl driver
Date: Wed, 2 Nov 2016 11:36:07 -0700
Message-ID: <20161102183607.GJ16026@codeaurora.org>
References: <20161031160009.20472-1-michael.scott@linaro.org>
 <20161101235344.GX16026@codeaurora.org>
 <e0bdce76-dcab-36c9-bf39-6c79b1cb2820@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <e0bdce76-dcab-36c9-bf39-6c79b1cb2820@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Michael Scott <michael.scott@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Joonwoo Park <joonwoop@codeaurora.org>, Jeremy McNicoll <jeremymc@redhat.com>
List-Id: devicetree@vger.kernel.org

On 11/01, Michael Scott wrote:
> 
> On 11/01/2016 04:53 PM, Stephen Boyd wrote:
> >On 10/31, Michael Scott wrote:
> >>+
> >>+static const struct msm_pingroup msm8994_groups[] = {
> >>+	PINGROUP(0,   blsp_spi1, blsp_uart1, blsp_uim1, NA, NA, NA, NA, NA, NA,
> >>+		 NA, NA),
> >I see an hdmi_rcv group here after blsp_uim1. Please add it for
> >this gpio.
> 
> Hi Stephen,
> 
> Thank you for reviewing the data-- this is really tedious stuff.
> 
> I'd like to make sure that we're both using tech data for msm8994.
> I don't see the hdmi_rcv function at all in my docs.
> 
> >
> >>+	PINGROUP(1,   blsp_spi1, blsp_uart1, blsp_uim1, NA, NA, NA, NA, NA, NA,
> >>+		 NA, NA),
> >>+	PINGROUP(2,   blsp_spi1, blsp_uart1, blsp_i2c1, NA, NA, NA, NA, NA, NA,
> >>+		 NA, NA),
> >>+	PINGROUP(3,   blsp_spi1, blsp_uart1, blsp_i2c1, NA, NA, NA, NA, NA, NA,
> >>+		 NA, NA),
> >>+	PINGROUP(4,   blsp_spi2, blsp_uart2, blsp_uim2, qdss_cti_trig_out_b,
> >>+		 NA, NA, NA, NA, NA, NA, NA),
> >>+	PINGROUP(5,   blsp_spi2, blsp_uart2, blsp_uim2, qdss_cti_trig_in_b, NA,
> >The qdss_cti_* is in function 5 for both of these, not function
> >4.
> These are indeed wrong, but my docs both show as function 7.

Ok. I think your document is for 8994v1, which never got
commercialized. I certainly see that this function assignment
changed between v1 and v2 from 7 to 5.

Now that my eyes are bleeding I'm going to do something else.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
