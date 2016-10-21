From: Jeremy McNicoll <jmcnicol@redhat.com>
Subject: Re: [PATCH] pinctrl: qcom: Add msm8994 pinctrl driver
Date: Fri, 21 Oct 2016 16:07:58 -0700
Message-ID: <20161021230757.GA8076@mini-rhel.redhat.com>
References: <20161021224250.32232-1-michael.scott@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20161021224250.32232-1-michael.scott@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Michael Scott <michael.scott@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Stephen Boyd <sboyd@codeaurora.org>, Joonwoo Park <joonwoop@codeaurora.org>, Andy Gross <andy.gross@linaro.org>, Jeremy McNicoll <jeremymc@redhat.com>
List-Id: devicetree@vger.kernel.org

On Fri, Oct 21, 2016 at 03:42:50PM -0700, Michael Scott wrote:
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
>  .../bindings/pinctrl/qcom,msm8994-pinctrl.txt      |  175 +++
>  drivers/pinctrl/qcom/Kconfig                       |    9 +
>  drivers/pinctrl/qcom/Makefile                      |    1 +
>  drivers/pinctrl/qcom/pinctrl-msm8994.c             | 1402 ++++++++++++++++++++
>  4 files changed, 1587 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,msm8994-pinctrl.txt
>  create mode 100644 drivers/pinctrl/qcom/pinctrl-msm8994.c
>

This works fine on my msm8992 which currently only supports basic
serial.

Having already compared it to downstream it looks like things
line up pretty good. (from a msm8992 perspective)

Reviewed-by: Jeremy McNicoll <jeremymc@redhat.com>


-jeremy
