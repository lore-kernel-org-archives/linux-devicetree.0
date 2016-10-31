From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH V2] pinctrl: qcom: Add msm8994 pinctrl driver
Date: Sun, 30 Oct 2016 23:40:48 -0500
Message-ID: <20161031044048.avyndpys2aggrjb4@rob-hp-laptop>
References: <20161026233228.15219-1-michael.scott@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20161026233228.15219-1-michael.scott@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Michael Scott <michael.scott@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Joonwoo Park <joonwoop@codeaurora.org>, Jeremy McNicoll <jeremymc@redhat.com>
List-Id: devicetree@vger.kernel.org

On Wed, Oct 26, 2016 at 04:32:28PM -0700, Michael Scott wrote:
> Initial pinctrl driver for QCOM msm8994 platforms.
> 
> In order to continue the initial board support for QCOM msm8994/msm8992
> presented in patches from Jeremy McNicoll <jeremymc@redhat.com>, let's put
> a proper pinctrl driver in place.
> 
> Currently, the DT for these platforms uses the msm8x74 pinctrl driver to enable
> basic UART.  Beyond the first few pins the rest are different enough to justify
> it's own driver.
> 
> Note: This driver is also be used by QCOM's msm8992 platform as it's TLM block
> is the same.
> 
> - Initial formatting and style was taken from the msm8x74 pinctrl driver added
>   by Björn Andersson <bjorn.andersson@linaro.org>
> - Data was then adjusted per QCOM MSM8994 documentation for Top Level Multiplexing
> - Bindings documentation was based on qcom,msm8996-pinctrl.txt by
>   Joonwoo Park <joonwoop@codeaurora.org> and then modified for msm8994 content
> 
> Signed-off-by: Michael Scott <michael.scott@linaro.org>
> ---
> 
> V1 -> V2: fixed missing FUNCTION(nav_pps) and removed 3 odd newlines between blsp_i2c4_groups and cci_timer0_groups
> 
>  .../bindings/pinctrl/qcom,msm8994-pinctrl.txt      |  175 +++

Acked-by: Rob Herring <robh@kernel.org>

>  drivers/pinctrl/qcom/Kconfig                       |    9 +
>  drivers/pinctrl/qcom/Makefile                      |    1 +
>  drivers/pinctrl/qcom/pinctrl-msm8994.c             | 1400 ++++++++++++++++++++
>  4 files changed, 1585 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,msm8994-pinctrl.txt
>  create mode 100644 drivers/pinctrl/qcom/pinctrl-msm8994.c
