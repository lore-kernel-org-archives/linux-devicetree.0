From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/3] arm64: mediatek: Add Pinctrl/GPIO/EINT driver for mt8173.
Date: Tue, 10 Feb 2015 16:20:38 +0800
Message-ID: <CACRpkda4TQDGDcGS7GZY97sTDHyt_yDdsBHhPru4Rqz815BsCQ@mail.gmail.com>
References: <1422342836-27689-1-git-send-email-hongzhou.yang@mediatek.com>
	<1422342836-27689-3-git-send-email-hongzhou.yang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1422342836-27689-3-git-send-email-hongzhou.yang@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Hongzhou Yang <hongzhou.yang@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Sascha Hauer <kernel@pengutronix.de>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Grant Likely <grant.likely@linaro.org>, "Joe.C" <yingjoe.chen@mediatek.com>, Catalin Marinas <catalin.marinas@arm.com>, Vladimir Murzin <vladimir.murzin@arm.com>, Ashwin Chaugule <ashwin.chaugule@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, dandan.he@mediatek.com, alan.cheng@mediatek.com, toby.liu@mediatek.com, maoguang.meng@mediatek.com, huang eddie <eddie.huang@mediatek.com>
List-Id: devicetree@vger.kernel.org

On Tue, Jan 27, 2015 at 3:13 PM, Hongzhou Yang
<hongzhou.yang@mediatek.com> wrote:

> From: Hongzhou Yang <hongzhou.yang@mediatek.com>
>
> Add mt8173 support using mediatek common pinctrl driver.
> MT8173 have a different ies_smt setting register than mt8135,
> so adding this support to common code.
>
> Signed-off-by: Hongzhou Yang <hongzhou.yang@mediatek.com>

Patch applied on top of the base 8135 series.

Yours,
Linus Walleij
