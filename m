From: Paul Bolle <pebolle@tiscali.nl>
Subject: Re: [PATCH v5 1/5] ARM: mediatek: Add config options for mediatek
 SoCs.
Date: Tue, 27 Jan 2015 13:47:22 +0100
Message-ID: <1422362842.14015.48.camel@x220>
References: <1421818097-9281-1-git-send-email-hongzhou.yang@mediatek.com>
	 <1421818097-9281-2-git-send-email-hongzhou.yang@mediatek.com>
	 <CABuKBeJGigY5ym9cJy=PYK8jbdsOLLtkmovHq6xho4gYseCAWg@mail.gmail.com>
	 <1422353800.14015.35.camel@x220> <1422354400.32212.25.camel@mtksdaap41>
	 <1422354858.14015.39.camel@x220>
	 <CABuKBeLPN74fiLduvswHfPrgAoQCFXCtdLZhhoha8Q=0xBSjpA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CABuKBeLPN74fiLduvswHfPrgAoQCFXCtdLZhhoha8Q=0xBSjpA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Yingjoe Chen <yingjoe.chen@mediatek.com>, Valentin Rothberg <valentinrothberg@gmail.com>, Hongzhou Yang <hongzhou.yang@mediatek.com>, Rob Herring <robh+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Sascha Hauer <kernel@pengutronix.de>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Grant Likely <grant.likely@linaro.org>, Catalin Marinas <catalin.marinas@arm.com>, Vladimir Murzin <vladimir.murzin@arm.com>, Ashwin Chaugule <ashwin.chaugule@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, dandan.he@mediatek.com, alan.cheng@mediatek.com, toby.liu@mediate
List-Id: devicetree@vger.kernel.org

Matthias,

On Tue, 2015-01-27 at 13:38 +0100, Matthias Brugger wrote:
> Yes, this symbols are needed when we implement the pinctrl driver for
> the other platforms.
> I will implement mt6589 as soon as the pinctrl driver got merged.
> I suppose Howard will go for the mt6592.

I see. Unless the users of MACH_MT6589, MACH_MT6592, MACH_MT8127, and
MACH_MT8135 take very long to land in linux-next (or in mainline) I
won't bother you again about this.

Thanks!


Paul Bolle
