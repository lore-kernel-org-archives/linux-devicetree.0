From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/2] pinctrl: Add drive strength support for BM1880 SoC
Date: Fri, 7 Jun 2019 23:18:59 +0200
Message-ID: <CACRpkdY9j+4PGGyMC-bCKuhP3Cg6xj4mFBt1VuSOi_14JcphPw@mail.gmail.com>
References: <20190603073421.10314-1-manivannan.sadhasivam@linaro.org> <20190603073421.10314-2-manivannan.sadhasivam@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190603073421.10314-2-manivannan.sadhasivam@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, haitao.suo@bitmain.com, darren.tsao@bitmain.com, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, alec.lin@bitmain.com
List-Id: devicetree@vger.kernel.org

On Mon, Jun 3, 2019 at 9:35 AM Manivannan Sadhasivam
<manivannan.sadhasivam@linaro.org> wrote:

> Add drive strength support for Bitmain BM1880 SoC.
>
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Patch applied, no point in holding this back about nitpicking.

Follow up if you want to change the below:

> +static int bm1880_pinconf_drv_set(unsigned int mA, u32 width,
> +                                 u32 *regval, u32 bit_offset)
> +{
> +       u32 _regval;
> +
> +       _regval = *regval;

(... lots of fun with _reqval ...)

> +       *regval = _regval;
> +
> +       return 0;

I would avoid using any _names and __names because of ambiguity
(no clear semantic meaning) I would just call the variable in the
function *regp and the _regval just "reg" but it's just me.

Yours,
Linus Walleij
