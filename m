From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 4/5] pinctrl: mediatek: Add Pinctrl/GPIO/EINT driver for mt2701
Date: Wed, 9 Dec 2015 23:52:01 +0100
Message-ID: <CACRpkda2vgrVEisH=akc5aj6h4LW+mBTqgbAiF3E=3zcu6A28A@mail.gmail.com>
References: <1448527472-20651-1-git-send-email-biao.huang@mediatek.com>
	<1448527472-20651-5-git-send-email-biao.huang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1448527472-20651-5-git-send-email-biao.huang@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Biao Huang <biao.huang@mediatek.com>, Hongzhou Yang <hongzhou.yang@mediatek.com>, Yingjoe Chen <yingjoe.chen@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Matthias Brugger <matthias.bgg@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-mediatek@lists.infradead.org, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, srv_heupstream@mediatek.com
List-Id: devicetree@vger.kernel.org

On Thu, Nov 26, 2015 at 9:44 AM, Biao Huang <biao.huang@mediatek.com> wrote:

> Add mt2701 support using mediatek common pinctrl driver.
> MT2701 have some special pins need an extra setting register
> than other ICs, so adding this support to common code.
>
> Signed-off-by: Biao Huang <biao.huang@mediatek.com>

This looks uncontroversial, but I would like to have some of the
other Mediatek driver authors send their Ack/Review tags,
so Hongzhou & Yingjoe: can you review this and the other
patch to the pin control driver?

Yours,
Linus Walleij
