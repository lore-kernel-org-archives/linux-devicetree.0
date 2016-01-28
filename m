From: biao huang <biao.huang@mediatek.com>
Subject: Re: [PATCH v4 0/5] pinctrl: mediatek: add pinctrl/GPIO/EINT driver
 for mt2701
Date: Fri, 29 Jan 2016 06:08:40 +0800
Message-ID: <1454018920.14802.41.camel@mhfsdcap03>
References: <1453857883-28436-1-git-send-email-biao.huang@mediatek.com>
	 <CACRpkdbxpc19bdzGDUDoqseTA-TW3V8dAA4Oe+G860qTsHd-dQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <CACRpkdbxpc19bdzGDUDoqseTA-TW3V8dAA4Oe+G860qTsHd-dQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: John Crispin <blogic@openwrt.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Matthias Brugger <matthias.bgg@gmail.com>, Erin Lo <erin.lo@mediatek.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, srv_heupstream@mediatek.com, Yingjoe Chen <yingjoe.chen@mediatek.com>, Hongzhou Yang <hongzhou.yang@mediatek.com>, "arm@kernel.org" <arm@kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Linus,
	[PATCH v4 1/5] pinctrl: mediatek: fix direction control issue
	this patch is also a pinctrl patch, and it seems not merged in
devel-mt2701 branch.

Best Regards!
Yours,
Biao Huang

On Thu, 2016-01-28 at 11:20 +0100, Linus Walleij wrote:
> On Wed, Jan 27, 2016 at 2:24 AM, Biao Huang <biao.huang@mediatek.com> wrote:
> 
> > Change in v4:
> > 1. create a sperate patch for direction setting of input-enable/disalbe and input-schmitt-enable/disable.
> 
> So I've merged the patches affecting drivers/pinctrl on the special
> devel-mt2701 branch, so the ARM SoC people can pull this into
> their tree to resolve dependencies on the pinctrl include
> in include/dt-bindings.
> https://git.kernel.org/cgit/linux/kernel/git/linusw/linux-pinctrl.git/log/?h=devel-mt2701
> 
> The rest of the patches should go into ARM SoC, so they can
> just pull this branch in and apply that stuff on top.
> 
> Allow this a few days, I am also waiting for the add-on patches
> from John Crispin to come in, please include John in the
> feedback loop.
> 
> Yours,
> Linus Walleij


