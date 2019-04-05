From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v4 4/4] pinctrl: add drive for I2C related pins on MT8183
Date: Fri, 5 Apr 2019 10:45:24 +0700
Message-ID: <CACRpkdb8T71y9TZFXhefArKhbtPPe2b4syGWx6LwFaFkANEk4g@mail.gmail.com>
References: <20190401033535.16910-1-zhiyong.tao@mediatek.com> <20190401033535.16910-5-zhiyong.tao@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190401033535.16910-5-zhiyong.tao@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Zhiyong Tao <zhiyong.tao@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, Sean Wang <sean.wang@kernel.org>, srv_heupstream@mediatek.com, hui.liu@mediatek.com, huang eddie <eddie.huang@mediatek.com>, chuanjia.liu@mediatek.com, Biao Huang <biao.huang@mediatek.com>, Hongzhou Yang <hongzhou.yang@mediatek.com>, Erin Lo <erin.lo@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, Apr 1, 2019 at 10:35 AM Zhiyong Tao <zhiyong.tao@mediatek.com> wrote:

> This patch provides the advanced drive for I2C used pins on MT8183.
> The detail strength specification description of the I2C pin:
> When E1=0/E0=0, the strength is 0.125mA.
> When E1=0/E0=1, the strength is 0.25mA.
> When E1=1/E0=0, the strength is 0.5mA.
> When E1=1/E0=1, the strength is 1mA.
> For I2C pins, there are existing generic driving setup and the above
> specific driving setup. I2C pins can only support 2/4/6/8/10/12/14/16mA
> driving adjustment in generic driving setup. But in specific driving
> setup, they can support 0.125/0.25/0.5/1mA adjustment.
> If we enable specific driving setup for I2C pins,
> the existing generic driving setup will be disabled.
> For some special features, we need the I2C pins specific driving setup.
> The specific driving setup is controlled by E1E0EN.
> So we need add extra vendor driving preperty instead of the generic
> driving property. We can add "mediatek,drive-strength-adv = <XXX>;"
> to describe the specific driving setup property.
> "XXX" means the value of E1E0EN. So the valid arguments of
> "mediatek,drive-strength-adv" are from 0 to 7.
>
> Signed-off-by: Zhiyong Tao <zhiyong.tao@mediatek.com>

Patch applied tentatively to the pin control tree.

If other MTK maintainers have opinions we might need to patch on
top or revert it, but it looks OK to me so I put it in.

Yours,
Linus Walleij
