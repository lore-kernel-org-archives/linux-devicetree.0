From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 3/4] clk: qcom: Add MSM8998 Multimedia Clock
 Controller (MMCC) driver
Date: Mon, 18 Feb 2019 14:15:32 -0600
Message-ID: <20190218201532.GA19638@bogus>
References: <1550377885-10618-1-git-send-email-jhugo@codeaurora.org>
 <1550377947-11414-1-git-send-email-jhugo@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1550377947-11414-1-git-send-email-jhugo@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jeffrey Hugo <jhugo@codeaurora.org>
Cc: bjorn.andersson@linaro.org, mturquette@baylibre.com, sboyd@kernel.org, marc.w.gonzalez@free.fr, andy.gross@linaro.org, david.brown@linaro.org, mark.rutland@arm.com, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Sat, Feb 16, 2019 at 09:32:27PM -0700, Jeffrey Hugo wrote:
> Add a driver for the multimedia clock controller found on MSM8998
> based devices. This should allow most multimedia device drivers
> to probe and control their clocks.
> 
> Signed-off-by: Jeffrey Hugo <jhugo@codeaurora.org>
> ---
>  drivers/clk/qcom/Kconfig                      |    9 +
>  drivers/clk/qcom/Makefile                     |    1 +
>  drivers/clk/qcom/mmcc-msm8998.c               | 2915 +++++++++++++++++
>  include/dt-bindings/clock/qcom,mmcc-msm8998.h |  210 ++

If you need to respin, this file goes in the binding patch.

>  4 files changed, 3135 insertions(+)
>  create mode 100644 drivers/clk/qcom/mmcc-msm8998.c
>  create mode 100644 include/dt-bindings/clock/qcom,mmcc-msm8998.h
