From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 3/5] pinctrl: Rework the pinmux handling for BM1880 SoC
Date: Fri, 24 May 2019 13:52:34 +0200
Message-ID: <CACRpkdZUR-8Q+tD3szv+=QBJ3h-Mdue9ooj_OY-NkL4MGt7YGQ@mail.gmail.com>
References: <20190520083101.10229-1-manivannan.sadhasivam@linaro.org> <20190520083101.10229-4-manivannan.sadhasivam@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190520083101.10229-4-manivannan.sadhasivam@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, haitao.suo@bitmain.com, darren.tsao@bitmain.com, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, alec.lin@bitmain.com
List-Id: devicetree@vger.kernel.org

On Mon, May 20, 2019 at 10:31 AM Manivannan Sadhasivam
<manivannan.sadhasivam@linaro.org> wrote:

> Rework the BM1880 SoC pinmux handling by removing the
> BM1880_PINMUX_FUNCTION_MUX define and merging it with the
> BM1880_PINMUX_FUNCTION definition. Since the PWM muxing is handled by
> generic pin controller in the SoC itself, there is no need to have a
> dedicated code to do the muxing in PWM registers. So, lets club all
> pinmux handling in the same per pin mux handling code.
>
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Patch applied.

Yours,
Linus Walleij
