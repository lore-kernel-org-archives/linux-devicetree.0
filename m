From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH V7 2/2] dt-bindings: Add qcom spmi_pmic clock divider
 bindings
Date: Wed, 6 Dec 2017 22:28:24 -0800
Message-ID: <20171207062824.GJ4283@codeaurora.org>
References: <1511255465-3984-1-git-send-email-tirupath@codeaurora.org>
 <1511255465-3984-3-git-send-email-tirupath@codeaurora.org>
 <20171204202959.6gxmy7jdt7gwspuh@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20171204202959.6gxmy7jdt7gwspuh@rob-hp-laptop>
Sender: linux-clk-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Tirupathi Reddy <tirupath@codeaurora.org>, mturquette@baylibre.com, mark.rutland@arm.com, andy.gross@linaro.org, david.brown@linaro.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 12/04, Rob Herring wrote:
> On Tue, Nov 21, 2017 at 02:41:05PM +0530, Tirupathi Reddy wrote:
> > This patch adds device tree bindings for Qualcomm SPMI PMIC
> > clock divider module.
> > 
> > Signed-off-by: Tirupathi Reddy <tirupath@codeaurora.org>
> > ---
> >  .../bindings/clock/qcom,spmi-pmic-div.txt          | 59 ++++++++++++++++++++++
> 
> Didn't Stephen say to move this somewhere else?

yeah I'll move it to qcom,spmi-clkdiv.txt

> > +
> > +- clock-cells:
> 
> #clock-cells
> 

And fix this. Thanks.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
