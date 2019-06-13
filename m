From: Matti Vaittinen <mazziesaccount@gmail.com>
Subject: Re: [PATCH v15 0/7] support ROHM BD70528 PMIC
Date: Thu, 13 Jun 2019 11:35:06 +0300
Message-ID: <CANhJrGNM7fBXa8cY6ybF8WsaigwcREMvbGN0K4pdUVKck4POzw@mail.gmail.com>
References: <cover.1559546139.git.matti.vaittinen@fi.rohmeurope.com>
 <20190611200043.eib3g3acc7ilawsx@earth.universe> <20190612060328.GQ4797@dell>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190612060328.GQ4797@dell>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>, "Vaittinen, Matti" <matti.vaittinen@fi.rohmeurope.com>
Cc: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>, devicetree <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Linux PM list <linux-pm@vger.kernel.org>, linux-rtc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Jun 12, 2019 at 9:03 AM Lee Jones <lee.jones@linaro.org> wrote:
>
> On Tue, 11 Jun 2019, Sebastian Reichel wrote:
>
> > Hi,
> >
> > On Mon, Jun 03, 2019 at 10:23:37AM +0300, Matti Vaittinen wrote:
> > > Patch series introducing support for ROHM BD70528 PMIC
> > > [...]
> >
> > I think all patches have been reviewed by the respective subsystem
> > maintainers. Lee, can you provide an immutable branch with the MFD
> > patches (1, 2, 4)? Looks like the other patches only depend on those
> > and can go through their respective subsystems.
>
> Yes.  It's on my TODO list.
>
> Would you prefer this method over me just taking them all and sending
> out a PR?  The latter is my usual flow, but I'm happy with either.

Thanks guys for taking care of this! :)

--Matti
