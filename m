From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 4/4] clk: dt: Introduce always-on clock domain
 documentation
Date: Thu, 19 Feb 2015 10:11:06 +0000
Message-ID: <20150219101106.GD12212@x1>
References: <1424276101-30137-1-git-send-email-lee.jones@linaro.org>
 <1424276101-30137-5-git-send-email-lee.jones@linaro.org>
 <CAL_Jsq+r1BKt5B9FNPG+Y0Oi1-3RGNmRUDbpX_uDJwr45bxMXA@mail.gmail.com>
 <20150218171230.GA30676@x1>
 <CAL_JsqJ0sfQ-OQvYjL3X3ebH4p9HkN4iy35iT7i9S2d+yz9zYg@mail.gmail.com>
 <20150218215435.GA32415@x1>
 <CAMuHMdU6DpZoi-q3pUFUX8xjnXGfTqfEYyzajZZm=-qZTk1qHQ@mail.gmail.com>
 <20150219094200.GB12212@x1>
 <CAMuHMdW+np0_zUhBOXVBN_7ztM5Z=xN5-mE-P_wR35BggQxerQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAMuHMdW+np0_zUhBOXVBN_7ztM5Z=xN5-mE-P_wR35BggQxerQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Cc: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, 19 Feb 2015, Geert Uytterhoeven wrote:

> Hi Lee,
>=20
> On Thu, Feb 19, 2015 at 10:42 AM, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wr=
ote:
> >> What kind of clocks are these? What do they control?
> >> Memory controllers? Bus controllers?
> >>
> >> They must control some device(s), so there should be one or more d=
evice
> >> nodes in DT that reference these clocks.
> >> As soon as that information is in DT, support can be added to Linu=
x to
> >> make sure the "critical" clocks stay enabled, either through a rea=
l driver,
> >> or through platform code.
> >
> > Some do, some don't.  For instance, we have one clock which control=
s
> > SPI and I2C that must not be turned off.  We discovered this then w=
hen
> > a suspend was attempted and the board refused to resume.  This cloc=
k
> > also runs one of the critical interconnects that runs from the a9. =
 It
> > would be wrong to remove the clk_disable() attempt from the SPI/I2C
> > drivers because the same IP on another board might be controlled by=
 a
> > different clock which is able to be gated.
> >
> > There are also clocks which control other interconnects that are no=
t
> > connected to any device drivers.  If we fail to take references for
> > them before clk_disable_unused() is called, again the board hangs. =
 We
> > even lose JTAG support.
>=20
> Interconnects are buses. Can't you represent those buses in the DT
> hierarchy, and give them clocks properties?

So instead of this nice succinct, simple, cover all bases
(interconnects was just an example, there are bound to be others),
generic framework, you are suggesting to write drivers for devices
which other than "don't turn my clocks off", Linux can't actually see
or control?

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
