From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v4 0/5] PINCTRL: Mediatek pinctrl driver for mt2712
Date: Fri, 23 Mar 2018 03:58:00 +0100
Message-ID: <CACRpkdZHuNytoq_PnLJa5SWJzPruMC29XE7GH_JxsH0uZmBabQ@mail.gmail.com>
References: <1521687523-1604-1-git-send-email-zhiyong.tao@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1521687523-1604-1-git-send-email-zhiyong.tao@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Zhiyong Tao <zhiyong.tao@mediatek.com>, sean.wang@mediatek.com
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, srv_heupstream@mediatek.com, Liguo Zhang <liguo.zhang@mediatek.com>, "Joe.C" <yingjoe.chen@mediatek.com>, hongkun.cao@mediatek.com, Biao Huang <biao.huang@mediatek.com>, YT Shen <yt.shen@mediatek.com>, Hongzhou Yang <hongzhou.yang@mediatek.com>, Erin Lo <erin.lo@mediatek.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Mar 22, 2018 at 3:58 AM, Zhiyong Tao <zhiyong.tao@mediatek.com> wrote:

> This series includes five patches:
> 1.Add mt2712 pintcrl head file.
> 2.Add mt2712 pinctrl device node.
> 3.Add mt2712 pinctrl driver.
> 4.Support bias-disable of generic and special pins simultaneously.
> 5.fix check warnings.
>
> Changes in patch v4:
> 1)fix check warnings for mt2712.
> 2)add fix check warnings patch for other ICs.

This looks good to me.

Can I get some ACK/Reviewed-by's from Sean so I can
merge the driver for v4.17?

Yours,
Linus Walleij
