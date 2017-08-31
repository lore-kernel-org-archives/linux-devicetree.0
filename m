From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] pinctrl: qcom: General Purpose clocks for apq8064
Date: Thu, 31 Aug 2017 11:33:35 +0200
Message-ID: <CACRpkdbsa37eT27rJSCNoDAjyiXQYJKYh9LoMQwvv6jGFN8pOA@mail.gmail.com>
References: <1502863338-6946-1-git-send-email-simhavcs@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1502863338-6946-1-git-send-email-simhavcs@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Vinay Simha BN <simhavcs@gmail.com>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "open list:PIN CONTROLLER - QUALCOMM" <linux-arm-msm@vger.kernel.org>, "open list:PIN CONTROL SUBSYSTEM" <linux-gpio@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Aug 16, 2017 at 8:02 AM, Vinay Simha BN <simhavcs@gmail.com> wrote:

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

I applied this v2 instead of v1 which has the right ACKs and also
added Rob's ACK.

Yours,
Linus Walleij
