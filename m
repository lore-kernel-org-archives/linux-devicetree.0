From: Chen-Yu Tsai <wens@csie.org>
Subject: Re: [linux-sunxi] Re: [PATCH 1/9] pinctrl: sunxi: Support I/O bias
 voltage setting on A80
Date: Wed, 6 Feb 2019 18:22:43 +0800
Message-ID: <CAGb2v67m_yO42VrivTf9x3JvAE3DL4nUZzzXt2BMU_Xb=ZHDtg@mail.gmail.com>
References: <20190206033239.3619-1-wens@csie.org> <20190206033239.3619-2-wens@csie.org>
 <CACRpkda45Zhopkk+P9-poDut-gJdJg5POPGSa_Rt_wqE24GGqg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkda45Zhopkk+P9-poDut-gJdJg5POPGSa_Rt_wqE24GGqg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-sunxi <linux-sunxi@googlegroups.com>
List-Id: devicetree@vger.kernel.org

On Wed, Feb 6, 2019 at 4:14 PM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Wed, Feb 6, 2019 at 4:32 AM Chen-Yu Tsai <wens@csie.org> wrote:
>
> > The A80 SoC has configuration registers for I/O bias voltage. Incorrect
> > settings would make the affected peripherals inoperable in some cases,
> > such as Ethernet RGMII signals biased at 2.5V with the settings still
> > at 3.3V. However low speed signals such as MDIO on the same group of
> > pins seem to be unaffected.
> >
> > Previously there was no way to know what the actual voltage used was,
> > short of hard-coding a value in the device tree. With the new pin bank
> > regulator supply support in place, the driver can now query the
> > regulator for its voltage, and if it's valid (as opposed to being the
> > dummy regulator), set the bias voltage setting accordingly.
> >
> > Add a quirk to denote the presence of the configuration registers, and
> > a function to set the correct setting based on the voltage read back
> > from the regulator.
> >
> > This is only done when the regulator is first acquired and enabled.
> > While it would be nice to have a notifier on the regulator so that when
> > the voltage changes, the driver can update the setting, in practice no
> > board currently supports dynamic changing of the I/O voltages.
> >
> > Signed-off-by: Chen-Yu Tsai <wens@csie.org>
>
> Hi Chen-Yu,
>
> thanks for the patch! I tried to apply it on the pinctrl devel branch
> (for v5.1) but it failed to apply, I assume because it depends on
> the fixes that I just sent to Torvalds.
>
> Shall we proceed like this that I merge v5.0-rc6 as soon as it is
> out and then try to apply this on top of that instead, so we get
> rid of this conflict?

Sure. That sounds like a good plan.

ChenYu
