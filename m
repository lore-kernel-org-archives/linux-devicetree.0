From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/5] pinctrl: update the documentation for some pinconfig params
Date: Sun, 16 Jun 2013 14:26:12 +0200
Message-ID: <CACRpkdZrqpshFUnphphcpTDOiga4QHkyZZFYyVmswdLQaMQj2w@mail.gmail.com>
References: <201306141741.46077.heiko@sntech.de>
	<201306141742.21808.heiko@sntech.de>
	<CACRpkdaV78wXxGPFWVffEfnqrmhq1rsdVYdSKNx5mWaOcYOWrQ@mail.gmail.com>
	<201306161245.30465.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <201306161245.30465.heiko@sntech.de>
Sender: linux-kernel-owner@vger.kernel.org
To: =?ISO-8859-1?Q?Heiko_St=FCbner?= <heiko@sntech.de>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Grant Likely <grant.likely@linaro.org>, Rob Herring <rob.herring@calxeda.com>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, James Hogan <james.hogan@imgtec.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
List-Id: devicetree@vger.kernel.org

On Sun, Jun 16, 2013 at 12:45 PM, Heiko St=FCbner <heiko@sntech.de> wro=
te:
> Am Sonntag, 16. Juni 2013, 12:26:38 schrieb Linus Walleij:

>> Can't we rely on PIN_CONFIG_BIAS_DISABLE for all this?
>
> you're the boss on this, I'll do whatever you say :-)

Oh that's not good. As can be seen from past experience I am often
avoiding to do horrible design mistakes by other smart people telling
me how wrong I am ...

> Actually I'm too more comfortable with only using bias-disable.
>
> So I'll redo this patch to remove the disabling of a pull via this me=
thod, if
> that's the right way to go.

I sent some patch on how I'd like it defined, please check it.

> Same with the rockchip driver.

Hm I merged that patch actually, but you can send a v2 if you want
me to replace it. Or a patch on top, if preferred.

Yours,
Linus Walleij
