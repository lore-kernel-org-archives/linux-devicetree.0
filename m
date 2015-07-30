From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v7 5/5] clk: dt: Introduce binding for critical clock
 support
Date: Thu, 30 Jul 2015 10:23:41 +0100
Message-ID: <20150730092341.GC14642@x1>
References: <1437570255-21049-1-git-send-email-lee.jones@linaro.org>
 <1437570255-21049-6-git-send-email-lee.jones@linaro.org>
 <20150727071013.GO2564@lukather>
 <20150727073149.GV3436@x1>
 <20150728093222.GV2564@lukather>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20150728093222.GV2564@lukather>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kernel@stlinux.com, mturquette@linaro.org, sboyd@codeaurora.org, devicetree@vger.kernel.org, geert@linux-m68k.org, s.hauer@pengutronix.de
List-Id: devicetree@vger.kernel.org

On Tue, 28 Jul 2015, Maxime Ripard wrote:

> On Mon, Jul 27, 2015 at 08:31:49AM +0100, Lee Jones wrote:
> > On Mon, 27 Jul 2015, Maxime Ripard wrote:
> >=20
> > > Hi Lee,
> > >=20
> > > On Wed, Jul 22, 2015 at 02:04:15PM +0100, Lee Jones wrote:
> > > > Signed-off-by: Lee Jones <lee.jones@linaro.org>
> > > > ---
> > > >  .../devicetree/bindings/clock/clock-bindings.txt   | 39 ++++++=
++++++++++++++++
> > > >  1 file changed, 39 insertions(+)
> > > >=20
> > > > diff --git a/Documentation/devicetree/bindings/clock/clock-bind=
ings.txt b/Documentation/devicetree/bindings/clock/clock-bindings.txt
> > > > index 06fc6d5..4137034 100644
> > > > --- a/Documentation/devicetree/bindings/clock/clock-bindings.tx=
t
> > > > +++ b/Documentation/devicetree/bindings/clock/clock-bindings.tx=
t
> > > > @@ -44,6 +44,45 @@ For example:
> > > >    clocks by index. The names should reflect the clock output s=
ignal
> > > >    names for the device.
> > > > =20
> > > > +critical-clock:	Some hardware contains bunches of clocks which=
, in normal
> > > > +		circumstances, must never be turned off.  If drivers a) fail=
 to
> > > > +		obtain a reference to any of these or b) give up a previousl=
y
> > > > +		obtained reference during suspend, it is possible that some
> > > > +		Operating Systems might attempt to disable them to save powe=
r.
> > > > +		If this happens a platform can fail irrecoverably as a resul=
t.
> > > > +		Usually the only way to recover from these failures is to
> > > > +		reboot.
> > > > +
> > > > +		To avoid either of these two scenarios from catastrophically
> > > > +		disabling an otherwise perfectly healthy running system,
> > > > +		clocks can be identified as 'critical' using this property f=
rom
> > > > +		inside a clocksource's node.
> > > > +
> > > > +		This property is not to be abused.  It is only to be used to
> > > > +		protect platforms from being crippled by gated clocks, NOT a=
s a
> > > > +		convenience function to avoid using the framework correctly
> > > > +		inside device drivers.
> > > > +
> > > > +		Expected values are hardware clock indices.  If the
> > > > +		clock-indices property (see below) is used, then supplied
> > > > +		values must correspond to one of the listed identifiers.
> > > > +		Using the clock-indices example below, hardware clock <2>
> > > > +		is missing, therefore it is considered invalid to then
> > > > +		list clock <2> as a critical clock.
> > >=20
> > > I think we should also consider having it simply as a boolean. Us=
ing
> > > indices for clocks that don't have any (for example because it on=
ly
> > > provides a single clock) seem to not really make much sense.
> >=20
> > Then how would you distinguish between the clocks if the provider
> > provides more than a single clock?
>=20
> What I had in mind was that, you would have three cases:
>=20
>   - critical-clocks is not there: no clocks are made critical
>=20
>   - critical-clocks is there, but doesn't have any values: all the
>     clocks provided are marked critical
>=20
>   - critical-clocks is there and it has a list of values: only the
>     clocks listed are marked critical.
>=20
> Does that make sense to you?

Yep, sounds good.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
