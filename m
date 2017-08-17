From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2] pinctrl: qcom: General Purpose clocks for apq8064
Date: Thu, 17 Aug 2017 17:02:04 -0500
Message-ID: <20170817220204.fh6zttggxfyvzh6m@rob-hp-laptop>
References: <1502863338-6946-1-git-send-email-simhavcs@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1502863338-6946-1-git-send-email-simhavcs@gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Vinay Simha BN <simhavcs@gmail.com>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, Mark Rutland <mark.rutland@arm.com>, "open list:PIN CONTROLLER - QUALCOMM" <linux-arm-msm@vger.kernel.org>, "open list:PIN CONTROL SUBSYSTEM" <linux-gpio@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Aug 16, 2017 at 11:32:17AM +0530, Vinay Simha BN wrote:
> Add support for general purpose (GP) clocks
> for apq8064
> 
> DT binding documentation updated for
> qcom,apq8064-pinctrl general purpose (GP) clocks.
> 
> Acked-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: Vinay Simha BN <simhavcs@gmail.com>
> 
> ---
> v1:
> * only gp_clk_1b tested in nexus7 anx7808 slimport.
> 
> v2:
> * bjorn review comments incorporated
>   added gp clock functions
>   merged documentation and driver to single patch
> ---
> ---
>  .../bindings/pinctrl/qcom,apq8064-pinctrl.txt      |  3 +-
>  drivers/pinctrl/qcom/pinctrl-apq8064.c             | 42 ++++++++++++++++++----
>  2 files changed, 38 insertions(+), 7 deletions(-)

Acked-by: Rob Herring <robh@kernel.org>
