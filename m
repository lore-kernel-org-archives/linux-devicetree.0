From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 06/11] pinctrl: mediatek: Add Pinctrl/GPIO driver for mt6397.
Date: Tue, 19 May 2015 11:17:10 +0200
Message-ID: <CACRpkdYZ74avT1kKoKUc-kF9BBRrA4X_sj8CCk=K=vOjzhAYTg@mail.gmail.com>
References: <1432015882-8646-1-git-send-email-hongzhou.yang@mediatek.com>
	<1432015882-8646-7-git-send-email-hongzhou.yang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1432015882-8646-7-git-send-email-hongzhou.yang@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Hongzhou Yang <hongzhou.yang@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, Sascha Hauer <s.hauer@pengutronix.de>, Yingjoe Chen <yingjoe.chen@mediatek.com>, Chaotian Jing <chaotian.jing@mediatek.com>, Fabian Frederick <fabf@skynet.be>, Maoguang Meng <maoguang.meng@mediatek.com>, Axel Lin <axel.lin@ingics.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-mediatek@lists.infradead.org, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, srv
List-Id: devicetree@vger.kernel.org

On Tue, May 19, 2015 at 8:11 AM, Hongzhou Yang
<hongzhou.yang@mediatek.com> wrote:

> Add mt6397 support using mediatek common pinctrl driver.
>
> mt6397 is a PMIC, and pinctrl/GPIO is part of 6397 chip.
> Pinctrl/GPIO driver should obtain regmap from PMIC,
> so adding this support to common code.
>
> Also, mt6397 is no need to support interrupt controller,
> so changing common code to skip it.
>
> Signed-off-by: Hongzhou Yang <hongzhou.yang@mediatek.com>

APplied this version instead.

Yours,
Linus Walleij
