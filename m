From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/5] arm64: dts: bitmain: Modify pin controller memory map
Date: Fri, 24 May 2019 13:51:49 +0200
Message-ID: <CACRpkdbWCbhCdrbUueC9Jv1tJQcKiu5OaFfAqyMhKmEK+nH+xA@mail.gmail.com>
References: <20190520083101.10229-1-manivannan.sadhasivam@linaro.org> <20190520083101.10229-3-manivannan.sadhasivam@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190520083101.10229-3-manivannan.sadhasivam@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, haitao.suo@bitmain.com, darren.tsao@bitmain.com, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, alec.lin@bitmain.com
List-Id: devicetree@vger.kernel.org

On Mon, May 20, 2019 at 10:31 AM Manivannan Sadhasivam
<manivannan.sadhasivam@linaro.org> wrote:

> Earlier, the PWM registers were included as part of the pinctrl memory
> map, but this turned to be useless as the muxing is being handled by the
> SoC pin controller itself. Hence, this commit removes the pwm register
> mapping from the pinctrl node to make it more clean.
>
> Fixes: af2ff87de413 ("arm64: dts: bitmain: Add pinctrl support for BM1880 SoC")
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Please funnel this through ARM SoC.

Yours,
Linus Walleij
