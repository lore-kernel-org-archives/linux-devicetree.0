From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 0/4] Qualcomm QCS404 TLMM pinctrl driver
Date: Fri, 21 Sep 2018 08:17:13 -0700
Message-ID: <CACRpkdYxh+cSKPO4JUF2uJZ=xVuNsNHe5eSWjy2N+qibGaDfSA@mail.gmail.com>
References: <20180920013712.2361-1-bjorn.andersson@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180920013712.2361-1-bjorn.andersson@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Sep 19, 2018 at 6:34 PM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:

> This series introduces register accessor functions and a level of indirection
> for these, in order to handle dispersed tiles. It then adds the TLMM binder and
> driver for the QCS404 platform.
>
> Avaneesh Kumar Dwivedi (1):
>   pinctrl: qcom: Add qcs404 pinctrl driver
>
> Bjorn Andersson (3):
>   pinctrl: qcom: Introduce readl/writel accessors
>   pinctrl: qcom: Support dispersed tiles
>   dt-bindings: pinctrl: qcom: Add QCS404 pinctrl binding

I tested to apply the patches but they don't apply cleanly on my
pin control devel branch, proably because some other qcom
pinctrl fuzz.

When resending, it'd be great if you could just rebase it on top
of whatever is in the pinctrl "devel" branch and it'll likely apply
cleanly.

Yours,
Linus Walleij
