From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v4 4/5] pinctrl: mediatek: Add Pinctrl/GPIO/EINT driver
 for mt2701
Date: Thu, 28 Jan 2016 11:15:35 +0100
Message-ID: <CACRpkdaAP=dK1g-fM+57YZCBCRSryc24UScpRAKVPq8_BwsVsA@mail.gmail.com>
References: <1453857883-28436-1-git-send-email-biao.huang@mediatek.com>
	<1453857883-28436-5-git-send-email-biao.huang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1453857883-28436-5-git-send-email-biao.huang@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Biao Huang <biao.huang@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Matthias Brugger <matthias.bgg@gmail.com>, Erin Lo <erin.lo@mediatek.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, srv_heupstream@mediatek.com, Yingjoe Chen <yingjoe.chen@mediatek.com>, Hongzhou Yang <hongzhou.yang@mediatek.com>
List-Id: devicetree@vger.kernel.org

On Wed, Jan 27, 2016 at 2:24 AM, Biao Huang <biao.huang@mediatek.com> wrote:

> Add mt2701 support using mediatek common pinctrl driver.
> MT2701 have some special pins need an extra setting register
> than other ICs, so adding this support to common code.
>
> Signed-off-by: Biao Huang <biao.huang@mediatek.com>
> Acked-by: Yingjoe Chen <yingjoe.chen@mediatek.com>

Patch merged to my devel-mt2701 branch.

Yours,
Linus Walleij
