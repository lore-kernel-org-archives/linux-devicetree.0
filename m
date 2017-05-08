From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 1/5] pinctrl: qcom: Add ipq8074 pinctrl driver
Date: Mon, 8 May 2017 11:38:05 -0500
Message-ID: <20170508163805.wjjvk4nikbfxn4jt@rob-hp-laptop>
References: <1493898841-20583-1-git-send-email-varada@codeaurora.org>
 <1493898841-20583-2-git-send-email-varada@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1493898841-20583-2-git-send-email-varada@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Varadarajan Narayanan <varada@codeaurora.org>
Cc: mark.rutland@arm.com, mturquette@baylibre.com, sboyd@codeaurora.org, linus.walleij@linaro.org, andy.gross@linaro.org, david.brown@linaro.org, catalin.marinas@arm.com, will.deacon@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, absahu@codeaurora.org, sjaganat@codeaurora.org, sricharan@codeaurora.org, Manoharan Vijaya Raghavan <mraghava@codeaurora.org>
List-Id: devicetree@vger.kernel.org

On Thu, May 04, 2017 at 05:23:57PM +0530, Varadarajan Narayanan wrote:
> Add initial pinctrl driver to support pin configuration with
> pinctrl framework for ipq8074.
> 
> Signed-off-by: Manoharan Vijaya Raghavan <mraghava@codeaurora.org>
> Signed-off-by: Varadarajan Narayanan <varada@codeaurora.org>
> ---
>  .../bindings/pinctrl/qcom,ipq8074-pinctrl.txt      |  187 +++

Acked-by: Rob Herring <robh@kernel.org>

>  drivers/pinctrl/qcom/Kconfig                       |   10 +
>  drivers/pinctrl/qcom/Makefile                      |    1 +
>  drivers/pinctrl/qcom/pinctrl-ipq8074.c             | 1217 ++++++++++++++++++++
>  4 files changed, 1415 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,ipq8074-pinctrl.txt
>  create mode 100644 drivers/pinctrl/qcom/pinctrl-ipq8074.c
