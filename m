From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v4 4/5] pintcrl: support bias-disable of generic and
 special pins simultaneously
Date: Mon, 26 Mar 2018 10:57:51 +0200
Message-ID: <CACRpkdZoZD-1D_o2wJd-JpmTpm-EBTQu5=ndrN1KeTvPwHGPdw@mail.gmail.com>
References: <1521687523-1604-1-git-send-email-zhiyong.tao@mediatek.com> <1521687523-1604-5-git-send-email-zhiyong.tao@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1521687523-1604-5-git-send-email-zhiyong.tao@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Zhiyong Tao <zhiyong.tao@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, srv_heupstream@mediatek.com, Liguo Zhang <liguo.zhang@mediatek.com>, "Joe.C" <yingjoe.chen@mediatek.com>, hongkun.cao@mediatek.com, Biao Huang <biao.huang@mediatek.com>, YT Shen <yt.shen@mediatek.com>, Hongzhou Yang <hongzhou.yang@mediatek.com>, Erin Lo <erin.lo@mediatek.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Mar 22, 2018 at 3:58 AM, Zhiyong Tao <zhiyong.tao@mediatek.com> wrote:

> For generic pins, parameter "arg" is 0 or 1.
> For special pins, bias-disable is set by R0R1,
> so we need transmited "00" to set bias-disable
> When we set "bias-disable" as high-z property,
> the parameter should be "MTK_PUPD_SET_R1R0_00".
>
> Signed-off-by: Zhiyong Tao <zhiyong.tao@mediatek.com>

Patch applied for v4.17 with Sean's Review tag.

Yours,
Linus Walleij
