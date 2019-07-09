From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 3/6] clk: qcom: Add DT bindings for ipq6018 gcc clock
 controller
Date: Mon, 8 Jul 2019 19:45:30 -0600
Message-ID: <20190709014530.GA12304@bogus>
References: <1559755738-28643-1-git-send-email-sricharan@codeaurora.org>
 <1559755738-28643-4-git-send-email-sricharan@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1559755738-28643-4-git-send-email-sricharan@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Sricharan R <sricharan@codeaurora.org>
Cc: robh+dt@kernel.org, sboyd@kernel.org, linus.walleij@linaro.org, agross@kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Wed,  5 Jun 2019 22:58:55 +0530, Sricharan R wrote:
> Add the compatible strings and the include file for ipq6018
> gcc clock controller.
> 
> Signed-off-by: Sricharan R <sricharan@codeaurora.org>
> Signed-off-by: anusha <anusharao@codeaurora.org>
> Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
> ---
>  .../devicetree/bindings/clock/qcom,gcc.txt         |   1 +
>  include/dt-bindings/clock/qcom,gcc-ipq6018.h       | 405 +++++++++++++++++++++
>  2 files changed, 406 insertions(+)
>  create mode 100644 include/dt-bindings/clock/qcom,gcc-ipq6018.h
> 

Reviewed-by: Rob Herring <robh@kernel.org>
