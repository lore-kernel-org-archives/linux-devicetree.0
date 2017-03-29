From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/3] clk: qcom: Update DT bindings for the
 MSM8660/APQ8060 RPMCC
Date: Tue, 28 Mar 2017 19:55:37 -0500
Message-ID: <20170329005537.kcuziz2szwtrz4o2@rob-hp-laptop>
References: <20170322081823.20446-1-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170322081823.20446-1-linus.walleij@linaro.org>
Sender: linux-clk-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Mar 22, 2017 at 09:18:23AM +0100, Linus Walleij wrote:
> These compatible strings need to be added to extend support
> for the RPM CC to cover MSM8660/APQ8060. We also need to add
> enumberators to the include file for a few clocks that were
> missing.
> 
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  Documentation/devicetree/bindings/clock/qcom,rpmcc.txt | 2 ++
>  include/dt-bindings/clock/qcom,rpmcc.h                 | 4 ++++
>  2 files changed, 6 insertions(+)

Acked-by: Rob Herring <robh@kernel.org>
