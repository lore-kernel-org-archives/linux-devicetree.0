From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v3 0/4] clk: st: New always-on clock domain
Date: Mon, 9 Mar 2015 09:28:04 +0000
Message-ID: <20150309092804.GB3427@x1>
References: <1424799222-9301-1-git-send-email-lee.jones@linaro.org>
 <20150304120003.GL32624@x1>
 <20150306190812.11109.82130@quantum>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20150306190812.11109.82130@quantum>
Sender: linux-kernel-owner@vger.kernel.org
To: Mike Turquette <mturquette@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kernel@stlinux.com, sboyd@codeaurora.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, 06 Mar 2015, Mike Turquette wrote:

> Quoting Lee Jones (2015-03-04 04:00:03)
> > Mike,
> >=20
> > Do you want me to resend this set with Robert's Reviewed-by applied=
,
> > or are you happy to apply it yourself?
>=20
> No need for the resend. I am hoping for a final review from a DT huma=
n.
>=20
> This approach looks fine to me. In practice I think it is restricted =
to
> hardware blocks that don't exist in DT yet (e.g. no driver, in the ca=
se
> of your interconnect) and that restriction is probably for the best.

Agreed.

> > > v2 =3D> v3:
> > >   - Ensure DT actually reflects h/w
> > >     - i.e. Nodes should not contain a mishmash of different IP
> > >       blocks, but should identify related h/w.  In the current
> > >       example we use interconnects
> > >   - Change naming from clkdomain to clk-always-on
> > >   - Place "do not abuse" warning in documentation
> > >=20
> > > v1 =3D> v2:
> > >   - Turned the ST specific driver into a generic one
> > >  =20
> > > Hardware can have a bunch of clocks which must not be turned off.
> > > If drivers a) fail to obtain a reference to any of these or b) gi=
ve
> > > up a previously obtained reference during suspend, the common clk
> > > framework will attempt to turn them off and the hardware will
> > > subsequently die.  The only way to recover from this failure is t=
o
> > > restart.
> > >  =20
> > > To avoid either of these two scenarios from catastrophically
> > > disabling the running system we have implemented a clock domain
> > > where clocks are consumed and references are taken, thus preventi=
ng
> > > them from being shut down by the framework.
> > >=20
> > > *** BLURB HERE ***
> > >=20
> > > Lee Jones (4):
> > >   ARM: sti: stih407-family: Supply defines for CLOCKGEN A0
> > >   ARM: sti: stih407-family: Add platform interconnects to always-=
on clk
> > >     domain
> > >   clk: Provide an always-on clock domain framework
> > >   clk: dt: Introduce always-on clock domain documentation
> > >=20
> > >  .../devicetree/bindings/clock/clk-always-on.txt    | 35 ++++++++=
++++
> > >  arch/arm/boot/dts/stih407-family.dtsi              | 15 ++++++
> > >  drivers/clk/Makefile                               |  1 +
> > >  drivers/clk/clk-always-on.c                        | 62 ++++++++=
++++++++++++++
> > >  include/dt-bindings/clock/stih407-clks.h           |  4 ++
> > >  5 files changed, 117 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/clock/clk-a=
lways-on.txt
> > >  create mode 100644 drivers/clk/clk-always-on.c
> > >=20
> >=20

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
