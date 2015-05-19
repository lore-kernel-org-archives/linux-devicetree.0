From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 09/10] pinctrl: mediatek: add pinctrl/GPIO/EINT driver for mt8127
Date: Tue, 19 May 2015 11:01:26 +0200
Message-ID: <CACRpkdZL=U2R3q2iC6BOvDw7DTb7-vg6z1Tieyd2aQy5t+vq9A@mail.gmail.com>
References: <1431567346-33780-1-git-send-email-hongzhou.yang@mediatek.com>
	<1431567346-33780-10-git-send-email-hongzhou.yang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1431567346-33780-10-git-send-email-hongzhou.yang@mediatek.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Hongzhou Yang <hongzhou.yang@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, Sascha Hauer <s.hauer@pengutronix.de>, Eddie Huang <eddie.huang@mediatek.com>, Howard Chen <ibanezchen@gmail.com>, Ashwin Chaugule <ashwin.chaugule@linaro.org>, "Joe.C" <yingjoe.chen@mediatek.com>, Chaotian Jing <chaotian.jing@mediatek.com>, Fabian Frederick <fabf@skynet.be>, Maoguang Meng <maoguang.meng@mediatek.com>, Axel Lin <axel.lin@ingics.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@v>
List-Id: devicetree@vger.kernel.org

On Thu, May 14, 2015 at 3:35 AM, Hongzhou Yang
<hongzhou.yang@mediatek.com> wrote:

> From: Yingjoe Chen <yingjoe.chen@mediatek.com>
>
> MT8127 pinctrl/eint are similar to mt8135 and mt8173, add
> support for mt8127 using mediatek common pinctrl driver.
>
> Signed-off-by: Yingjoe Chen <yingjoe.chen@mediatek.com>
> Signed-off-by: Hongzhou Yang <hongzhou.yang@mediatek.com>

Patch applied. Needed some fuzzing in the Makefile,
check result in my devel branch or linux-next.

Yours,
Linus Walleikj
