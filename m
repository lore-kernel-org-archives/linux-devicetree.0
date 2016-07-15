From: Jean-Francois Moine <moinejf@free.fr>
Subject: Re: [PATCH v2 06/14] ARM: sun8i: clk: Add clk-factor rate
 application method
Date: Fri, 15 Jul 2016 15:27:56 +0200
Message-ID: <20160715152756.db7375a7109fed18c2fbf43a@free.fr>
References: <20160625034511.7966-1-megous@megous.com>
	<20160625034511.7966-7-megous@megous.com>
	<20160630204001.GC5485@lukather>
	<0b71ed7e-98c9-109e-85e6-ceb95131d88a@megous.com>
	<20160715085356.GR4761@lukather>
	<085e185a-ac76-dd3f-9b0e-a7dc9c0c09f3@megous.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <085e185a-ac76-dd3f-9b0e-a7dc9c0c09f3@megous.com>
Sender: linux-clk-owner@vger.kernel.org
To: =?UTF-8?B?T25kxZllag==?= Jirman <megous@megous.com>
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>, Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, dev@linux-sunxi.org, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, open list <linux-kernel@vger.kernel.org>, Emilio =?UTF-8?B?TMOzcGV6?= <emilio@elopez.com.ar>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Fri, 15 Jul 2016 12:38:54 +0200
Ond=C5=99ej Jirman <megous@megous.com> wrote:

> > If so, then yes, trying to switch to the 24MHz oscillator before
> > applying the factors, and then switching back when the PLL is stabl=
e
> > would be a nice solution.
> >=20
> > I just checked, and all the SoCs we've had so far have that
> > possibility, so if it works, for now, I'd like to stick to that.
>=20
> It would need to be tested. U-boot does the change only once, while t=
he
> kernel would be doing it all the time and between various frequencies
> and PLL settings. So the issues may show up with this solution too.

I don't think this is a good idea: the CPU clock may be changed at any
time with the CPUFreq governor. I don't see the system moving from
1008MHz to 24MHz and then to 1200MHz when some computation is needed!

BTW, Ond=C5=99ej, in my BPi M2+, I tried to change the CPU clock with y=
our
code at kernel start time from 792MHz to 1008MHz, but the hardware
(arisc?) set an other value, and the system speed was lower than before
(the PLL-CPUx register is 0x90031521 on boot, I want to set it to
xxxx1410 and I read 0x91031f33 - sorry, I did not have a look at the
CPU SD pattern). Do you know why?

--=20
Ken ar c'henta=C3=B1	|	      ** Breizh ha Linux atav! **
Jef		|		http://moinejf.free.fr/
