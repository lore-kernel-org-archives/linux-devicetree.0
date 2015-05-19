From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 03/10] pinctrl: mediatek: add ies/smt control to common code.
Date: Tue, 19 May 2015 10:51:42 +0200
Message-ID: <CACRpkdY9k7DoKne+qHji48yeq8Pb9Ah58z7Q7d4A67WZuMWypA@mail.gmail.com>
References: <1431567346-33780-1-git-send-email-hongzhou.yang@mediatek.com>
	<1431567346-33780-4-git-send-email-hongzhou.yang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1431567346-33780-4-git-send-email-hongzhou.yang@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Hongzhou Yang <hongzhou.yang@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, Sascha Hauer <s.hauer@pengutronix.de>, Eddie Huang <eddie.huang@mediatek.com>, Howard Chen <ibanezchen@gmail.com>, Ashwin Chaugule <ashwin.chaugule@linaro.org>, "Joe.C" <yingjoe.chen@mediatek.com>, Chaotian Jing <chaotian.jing@mediatek.com>, Fabian Frederick <fabf@skynet.be>, Maoguang Meng <maoguang.meng@mediatek.com>, Axel Lin <axel.lin@ingics.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@v>
List-Id: devicetree@vger.kernel.org

On Thu, May 14, 2015 at 3:35 AM, Hongzhou Yang
<hongzhou.yang@mediatek.com> wrote:

> Input enable and smt setting have different register,
> modify code to fix it.
>
> Several mediatek soc use similar input enable/smt setting
> procedure as mt8173, some soc use generic input enable/smt
> setting, some soc has no input enable/smt setting. Adding
> common code to handle all those cases, so future soc driver
> can use it.
>
> Signed-off-by: Hongzhou Yang <hongzhou.yang@mediatek.com>

Patch applied.

Yours,
Linus Walleij
