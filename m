From: Rob Herring <robh@kernel.org>
Subject: Re: [[PATCH v2] 1/2] clk: qcom: clk-rpmh: Add QCOM RPMh clock driver
Date: Fri, 13 Apr 2018 11:37:05 -0500
Message-ID: <20180413163705.io4xbukerjkzjmri@rob-hp-laptop>
References: <1523183533-23171-1-git-send-email-tdas@codeaurora.org>
 <1523183533-23171-2-git-send-email-tdas@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1523183533-23171-2-git-send-email-tdas@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Taniya Das <tdas@codeaurora.org>
Cc: Stephen Boyd <sboyd@codeaurora.org>, Michael Turquette <mturquette@baylibre.com>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rajendra Nayak <rnayak@codeaurora.org>, Odelu Kukatla <okukatla@codeaurora.org>, Amit Nischal <anischal@codeaurora.org>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, David Collins <collinsd@codeaurora.org>
List-Id: devicetree@vger.kernel.org

On Sun, Apr 08, 2018 at 04:02:12PM +0530, Taniya Das wrote:
> From: Amit Nischal <anischal@codeaurora.org>
> 
> Add the RPMh clock driver to control the RPMh managed clock resources on
> some of the Qualcomm Technologies, Inc. SoCs.
> 
> Signed-off-by: David Collins <collinsd@codeaurora.org>
> Signed-off-by: Amit Nischal <anischal@codeaurora.org>
> Signed-off-by: Taniya Das <tdas@codeaurora.org>
> ---
>  drivers/clk/qcom/Kconfig              |   9 +
>  drivers/clk/qcom/Makefile             |   1 +
>  drivers/clk/qcom/clk-rpmh.c           | 394 ++++++++++++++++++++++++++++++++++

>  include/dt-bindings/clock/qcom,rpmh.h |  25 +++

This goes with the binding patch which should come first in the series.

>  4 files changed, 429 insertions(+)
>  create mode 100644 drivers/clk/qcom/clk-rpmh.c
>  create mode 100644 include/dt-bindings/clock/qcom,rpmh.h
