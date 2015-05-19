From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 05/11] pinctrl: mediatek: add ies/smt control to common code.
Date: Tue, 19 May 2015 11:15:46 +0200
Message-ID: <CACRpkdb_+tvCETd1V=hS-FfF6ZM0B63S2uzGSmbihiy=S9QDJg@mail.gmail.com>
References: <1432015882-8646-1-git-send-email-hongzhou.yang@mediatek.com>
	<1432015882-8646-6-git-send-email-hongzhou.yang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1432015882-8646-6-git-send-email-hongzhou.yang@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Hongzhou Yang <hongzhou.yang@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, Sascha Hauer <s.hauer@pengutronix.de>, Yingjoe Chen <yingjoe.chen@mediatek.com>, Chaotian Jing <chaotian.jing@mediatek.com>, Fabian Frederick <fabf@skynet.be>, Maoguang Meng <maoguang.meng@mediatek.com>, Axel Lin <axel.lin@ingics.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-mediatek@lists.infradead.org, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, srv
List-Id: devicetree@vger.kernel.org

On Tue, May 19, 2015 at 8:11 AM, Hongzhou Yang
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

Applied this version instead.

Yours,
Linus Walleij
