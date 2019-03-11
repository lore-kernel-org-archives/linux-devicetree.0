From: Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH v2 0/9] Add Support for MediaTek PMIC MT6358
Date: Mon, 11 Mar 2019 22:21:23 +0100
Message-ID: <20190311212123.GD1637@piout.net>
References: <1552275991-34648-1-git-send-email-hsin-hsiung.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1552275991-34648-1-git-send-email-hsin-hsiung.wang@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
Cc: Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Mark Brown <broonie@kernel.org>, Eddie Huang <eddie.huang@mediatek.com>, Marc Zyngier <marc.zyngier@arm.com>, srv_heupstream@mediatek.com, linux-mediatek@lists.infradead.org, linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Sean Wang <sean.wang@mediatek.com>, Alessandro Zummo <a.zummo@towertech.it>
List-Id: devicetree@vger.kernel.org

Hello,

On 11/03/2019 11:46:22+0800, Hsin-Hsiung Wang wrote:
> This patchset including refactoring interrupt add support to MT6358 PMIC.
> MT6358 is the primary PMIC for MT8183 platform.
> 
> changes since v1:
> - refine for better code quality.
> - remove of_match_table in the MT6358 regulator driver.
> - some minor bug fix of mfd driver, like getting pmic id flow.
> - add support for the MediaTek MT6358 RTC.
> 
> Hsin-Hsiung Wang (7):
>   mfd: mt6397: clean up code
>   mfd: mt6397: extract irq related code from core driver
>   dt-bindings: mfd: Add compatible for the MediaTek MT6358 PMIC
>   regulator: Add document for MT6358 regulator
>   mfd: Add support for the MediaTek MT6358 PMIC
>   regulator: mt6358: Add support for MT6358 regulator
>   arm64: dts: mt6358: add PMIC MT6358 related nodes
> 
> Ran Bi (2):
>   rtc: mt6397: fix alarm register overwrite
>   rtc: Add support for the MediaTek MT6358 RTC
> 

It seems that those two patches are quite independent from the other
changes. How do you expect those to be merged?


-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
