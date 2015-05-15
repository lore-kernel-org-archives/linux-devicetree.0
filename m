From: Yingjoe Chen <yingjoe.chen@mediatek.com>
Subject: Re: Mediatek pinctrl driver optimize and add Mediatek SoC
 Pinctrl/GPIO/EINT driver for mt6397/mt8127.
Date: Fri, 15 May 2015 23:09:13 +0800
Message-ID: <1431702553.21788.9.camel@mtksdaap41>
References: <1431567346-33780-1-git-send-email-hongzhou.yang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1431567346-33780-1-git-send-email-hongzhou.yang@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Hongzhou Yang <hongzhou.yang@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, Sascha Hauer <s.hauer@pengutronix.de>, Eddie Huang <eddie.huang@mediatek.com>, Howard Chen <ibanezchen@gmail.com>, Ashwin Chaugule <ashwin.chaugule@linaro.org>, Chaotian Jing <chaotian.jing@mediatek.com>, Fabian Frederick <fabf@skynet.be>, Maoguang Meng <maoguang.meng@mediatek.com>, Axel Lin <axel.lin@ingics.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infr
List-Id: devicetree@vger.kernel.org

On Wed, 2015-05-13 at 18:35 -0700, Hongzhou Yang wrote:
> This series patches include below changes:
>   - Data struct optimize and remove unused member.
>   - Since several mediatek soc use similiar input enable/smt/pull setting, add those settings into common code.
>   - The first version of adding Mediatek SoC Pinctrl/GPIO driver for mt6397, mt6397 has 41 pins.
>   - The first version of adding Mediatek SoC Pinctrl/GPIO/EINT driver for mt8127, mt8127 has 143 pins.
> 
> 
> Hongzhou Yang (6):
>   pinctrl: mediatek: add ies/smt control to common code.
>   dt-bindings: mediatek: Modify pinctrl bindings for mt6397.
>   pinctrl: mediatek: Add Pinctrl/GPIO driver for mt6397.
>   pinctrl: dt bindings: mt6397: Add pinfunc header file for mt6397.
>   arm64: dts: mt8173-evb: Add pinctrl/GPIO node for mt6397.
>   ARM: dts: mt8135-evbp1: Add pinctrl/GPIO node for mt6397.
> 
> Yingjoe Chen (4):
>   pinctrl: mediatek: data struct optimize and remove unused member
>   pinctrl: mediatek: add mtk_pctrl_spec_pull_set_samereg common code
>   pinctrl: mediatek: add pinctrl/GPIO/EINT driver for mt8127
>   ARM: dts: mt8127: add pinctrl/GPIO/EINT node for mt8127


Hi,

There are several patches in this series, and they should go to
different trees. Will it be easier for maintainers if we rearrange
patches in the following order?

  dt-bindings: mediatek: Modify pinctrl bindings for mt6397.
  pinctrl: dt bindings: mt6397: Add pinfunc header file for mt6397.
  pinctrl: mediatek: data struct optimize and remove unused member
  pinctrl: mediatek: add mtk_pctrl_spec_pull_set_samereg common code
  pinctrl: mediatek: add ies/smt control to common code.
  pinctrl: mediatek: add Pinctrl/GPIO driver for mt6397.
  pinctrl: mediatek: add pinctrl/GPIO/EINT driver for mt8127
  mfd: mediatek: add GPIO sub module support into mfd.
  ARM: dts: mt8127: add pinctrl/GPIO/EINT node for mt8127
  arm64: dts: mt8173-evb: add pinctrl/GPIO node for mt6397.
  ARM: dts: mt8135-evbp1: add pinctrl/GPIO node for mt6397.

To avoid build fail, the last 2 should not be merged until the second
one is merged into mainline.

Joe.C
