From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v5 13/17] clk: sunxi-ng: add support for suniv F1C100s SoC
Date: Thu, 29 Nov 2018 15:37:34 -0800
Message-ID: <154353465409.88331.8677593357765162802@swboyd.mtv.corp.google.com>
References: <cover.1543443475.git.mesihkilinc@gmail.com>
 <cc1357c9272628b4d89af007cead83117d9ba6e9.1543443475.git.mesihkilinc@gmail.com>
 <154345243603.88331.17915868280143383591@swboyd.mtv.corp.google.com>
 <20181129063952.623svjr7pti7apah@ThinkPad>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181129063952.623svjr7pti7apah@ThinkPad>
Sender: linux-kernel-owner@vger.kernel.org
To: Mesih Kilinc <mesihkilinc@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com, Maxime Ripard <maxime.ripard@free-electrons.com>, Chen-Yu Tsai <wens@csie.org>, Russell King <linux@armlinux.org.uk>, Daniel Lezcano <daniel.lezcano@linaro.org>, Marc Zyngier <marc.zyngier@arm.com>, Linus Walleij <linus.walleij@linaro.org>, Icenowy Zheng <icenowy@aosc.io>, Rob Herring <robh+dt@kernel.org>, Julian Calaby <julian.calaby@gmail.com>
List-Id: devicetree@vger.kernel.org

Quoting Mesih Kilinc (2018-11-28 22:39:52)
> On 18/11/28 04:47, Stephen Boyd wrote:
> > Quoting Mesih Kilinc (2018-11-28 14:33:23)
> > > diff --git a/drivers/clk/sunxi-ng/ccu-suniv-f1c100s.c b/drivers/clk/s=
unxi-ng/ccu-suniv-f1c100s.c
> > > new file mode 100644
> > > index 0000000..d4bc1b8
> > > --- /dev/null
> > > +++ b/drivers/clk/sunxi-ng/ccu-suniv-f1c100s.c
> > > @@ -0,0 +1,541 @@
> > > +/*
> > > + * Copyright (c) 2016 Icenowy Zheng <icenowy@aosc.io>
> > > + *
> > > + * SPDX-License-Identifier: GPL-2.0
> > =

> > Please fix this location.
> =

> I am very sorry, I should have been more carefull. Should I resend whole
> patchset or just resending this patch is enough? =

> =


Just this one? Who do you intend to pick up these patches?
