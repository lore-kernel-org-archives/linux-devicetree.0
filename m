From: Stephen Warren <swarren@nvidia.com>
Subject: RE: Pinmux bindings proposal
Date: Mon, 23 Jan 2012 14:43:59 -0800
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF178CB81BEB@HQMAIL01.nvidia.com>
References: <74CDBE0F657A3D45AFBB94109FB122FF17801D202F@HQMAIL01.nvidia.com>
	<CAJuYYwQoh4_SnA9wmy4x+cG0w0hGukxTkODWtcSw_2QHYuDsrg@mail.gmail.com>
	<74CDBE0F657A3D45AFBB94109FB122FF1780DAB475@HQMAIL01.nvidia.com>
 <CAJuYYwTOW7wOTA-a4q1aL7XvnnrXWa6Cp9vRnNAmQZ-9aBHo4A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAJuYYwTOW7wOTA-a4q1aL7XvnnrXWa6Cp9vRnNAmQZ-9aBHo4A@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Abraham <thomas.abraham@linaro.org>
Cc: Dong Aisheng-B29396 <B29396@freescale.com>, "linus.walleij@stericsson.com" <linus.walleij@stericsson.com>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "cjb@laptop.org" <cjb@laptop.org>, "Simon Glass (sjg@chromium.org)" <sjg@chromium.org>, Dong Aisheng <dongas86@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>
List-Id: devicetree@vger.kernel.org

Thomas Abraham wrote at Friday, January 20, 2012 6:28 PM:
> On 21 January 2012 02:41, Stephen Warren <swarren@nvidia.com> wrote:
> > Thomas Abraham wrote at Thursday, January 19, 2012 6:10 AM:
> >> On 14 January 2012 02:09, Stephen Warren <swarren@nvidia.com> wrot=
e:
=2E..
> >> * Specifying the pinmux/pinconfig settings in dts files:
> >>
> >> Device nodes which require specific pinmux/pinconfig settings shou=
ld
> >> include information about the required settings. For example, a i2=
c
> >> controller node in dts file is listed below.
> >>
> >> i2c0: i2c@18000000 {
> >> =A0 =A0 =A0 =A0 [... other properties ...]
> >> =A0 =A0 =A0 =A0 pinctrl-active =3D <&pctrl0 5 0 2 3 0>,
> >> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0<&pctrl=
0 5 1 2 3 0>;
> >> =A0 =A0 =A0 =A0 pinctrl-suspend =3D <&pctrl0 5 0 2 0 0>,
> >> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 <&=
pctrl0 5 1 2 0 0>;
> >> };
> >
> > The idea of encoding the state names into the property names came u=
p
> > before in this thread.
>=20
> Yes, I did borrow the idea of states 'active' and 'suspend' from the
> dt binding discussions here. The current Samsung mainline dt support
> for gpio and pinmux is using this type of encoding but did not have
> the states.
>=20
> > The problem is that it's hard for core code
> > to know which properties are actually related to pinctrl and which
> > aren't. reserving one name such as "pinctrl" seems reasonable, wher=
eas
> > reserving a whole class of names; everything prefixed "pinctrl-foo"=
 is
> > a little less so.
>=20
> The basic premise with which I proposed about the dt support for pinc=
trl was
>=20
> - The pinctrl core code does not have to know anything about these
> bindings inside device nodes (of say i2c).
>=20
> - Device drivers (such as i2c) retrieve the value of pinctrl-*
> property and pass on two parameters to the pinctrl code.
>   (a) The 'struct device_node' pointer of the intended pinctrl_dev
> instance (obtained from the phandle above).
>   (b) The encoding that specifies the hardware register values.

That seems like a bunch of extra work for device drivers, and also
something that's only required for device tree. By having a standardize=
d
representation (or framework for one) of the pinctrl properties within
each device node, then drivers can:

a) Drivers don't have to do a/b above, instead the pinctrl core will
do it.

b) Drivers can use the exact same pinctrl APIs when the system booted
using DT or not.

> - Pinctrl core scans its list for all registered pinctrl_dev, matches
> it against the 'device node' specified and selects one of the
> pinctrl_dev. It then passes on the second parameter to the pinctrl
> driver which decodes it and writes appropriate values to the hardware
> registers.
>=20
> - pinmux/pinconfig/pindesc tables are not built from DT. There are no
> static tables built into the SoC specific pinctrl driver.

Not having any pin/group/function tables in either the driver or DT
would be a pretty radical departure from the way the pinctrl subsystem
works today. It'd basically make pinctrl irrelevant on DT, I think, if
I'm understanding what you're saying correctly. I don't know if we
really want to go down that path.

Not having the pinctrl pinmux mapping table parsed up front, but instea=
d
deferring it until a driver called pinmux_get() might be reasonable. I'=
m
not totally opposed to that, but others have expressed a desire to pars=
e
up front, so that the pinctrl sysfs files that contain the pinmux mappi=
ng
table are identical for a non-DT and DT boot.

=2E..
> >> In the example above, the specifier of pinctrl-* is specific for
> >> Samsung io-pad controllers. Its format/syntax would be mainly
> >> dependent on the io-pad controller used, the above is only an exam=
ple
> >> for Samsung io-pad controller. In the above node, the format of th=
e
> >> pinctrl-* specifier is
> >>
> >> property-name =3D <phandle of the pin-controller
> >> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0pin bank wi=
thin the pin-controller
> >> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0pin number =
within the pin-bank
> >> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0pin-mux fun=
ction number
> >> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0pull up/dow=
n config
> >> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0drive stren=
gth config>;
> >
> > Yes, that seems reasonable.
> >
> > The only thing different between that example and my proposal is th=
at:
> >
> > a) In my proposal, the property in the device nodes doesn't actuall=
y
> > =A0 contain all those fields, but a phandle to a child node of the =
pin
> > =A0 controller where that data is kept. This keeps all the pin mux =
data
> > =A0 stored under the pin controller's node for neatness.
>=20
> I am not sure if that is required. In case dt support for interrupt
> controller such as gic, the interrupt number, type of interrupt and
> edge/level type flags are all listed in the device node itself and no=
t
> under the gic device node.

Yes, there's no specific need to place those nodes inside the
pin controller's node. I intended to put them inside the individual
device nodes for my boards. However, others have expressed a strong
desire to only allow these nodes to be inside the pin controller node,
and I've gone along with that in order to move the binding forward.
While this is a little different to GPIOs and IRQs, I don't see a
significant disadvantage to this requirement; when I started looking
at pinmux DT months ago, I had planned on simply putting a single big
table inside the pin controller node anyway, so this isn't so different=
=2E

=2E..
> > The pinctrl subsystem already has APIs such as pinmux_get() and
> > pinmux_enable() that initiate pin mux programming, so I've been
> > assuming they'd be used identically for both systems that use board
> > files and systems that use DT.
>=20
> In case of DT based boot, the code that handles the device node
> containing pinctrl-* (either device driver or platform code) need not
> call the pinmux_get(). The encoding in the pinctrl-* (as listed above=
)
> is sufficient to setup the pinmux/pinconfig as required.

I think drivers should call pinmux_get() in all cases. We don't want
some drivers using pinmux_get() and only working without DT, and others
using some different API and only working with DT. We need to hide all
the DT/non-DT details behind the existing APIs so that drivers are as
portable as possible.

--=20
nvpublic
