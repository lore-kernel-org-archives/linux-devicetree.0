From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/5] dt-bindings: pinctrl: Modify pinctrl memory map
Date: Fri, 24 May 2019 13:51:10 +0200
Message-ID: <CACRpkdZTE-FZAht+txxVXYwe42uN_f1uPthLiKG54-=_YueUnw@mail.gmail.com>
References: <20190520083101.10229-1-manivannan.sadhasivam@linaro.org> <20190520083101.10229-2-manivannan.sadhasivam@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190520083101.10229-2-manivannan.sadhasivam@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, haitao.suo@bitmain.com, darren.tsao@bitmain.com, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, alec.lin@bitmain.com
List-Id: devicetree@vger.kernel.org

On Mon, May 20, 2019 at 10:31 AM Manivannan Sadhasivam
<manivannan.sadhasivam@linaro.org> wrote:

> Earlier, the PWM registers were included as part of the pinctrl memory
> map, but this turned to be useless as the muxing is being handled by the
> SoC pin controller itself. So, lets modify the pinctrl memory map to
> reflect the same.
>
> Fixes: 07b734fbdea2 ("dt-bindings: pinctrl: Add BM1880 pinctrl binding")
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Patch applied.

Yours,
Linus Walleij
