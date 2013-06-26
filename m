From: Christian Ruppert <christian.ruppert@abilis.com>
Subject: Re: [PATCH 2/4] pinmux: Add TB10x pinmux driver
Date: Wed, 26 Jun 2013 13:50:52 +0200
Message-ID: <20130626115051.GC7095@ab42.lan>
References: <20130618092516.GC18663@ab42.lan>
 <1371547751-13873-2-git-send-email-christian.ruppert@abilis.com>
 <51C23222.2060906@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <51C23222.2060906@wwwdotorg.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Patrice CHOTARD <patrice.chotard@st.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, Rob Landley <rob@landley.net>, Sascha Leuenberger <sascha.leuenberger@abilis.com>, Pierrick Hascoet <pierrick.hascoet@abilis.com>, devicetree-discuss@lists.ozlabs.org, linux-doc@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
List-Id: devicetree@vger.kernel.org

On Wed, Jun 19, 2013 at 04:35:14PM -0600, Stephen Warren wrote:
> On 06/18/2013 03:29 AM, Christian Ruppert wrote:
> > The pinmux driver of the Abilis Systems TB10x platform based on ARC=
700 CPUs.
> > Used to control the pinmux and is a prerequisite for the GPIO drive=
r.
>=20
> > diff --git a/Documentation/devicetree/bindings/pinctrl/abilis,tb10x=
-iomux.txt b/Documentation/devicetree/bindings/pinctrl/abilis,tb10x-iom=
ux.txt
>=20
> > +Port definitions
> > +----------------
> > +
> > +Ports are defined (and referenced) by sub-nodes of the pin control=
ler. Every
> > +sub-node defines exactly one port (i.e. a set of pins). Ports are =
predefined
> > +as named pin groups inside the pin controller driver and these nam=
es are used
> > +to associate pin group predefinitions to pin controller sub-nodes.
> > +
> > +Required port definition subnode properties:
> > +  - pingrp: should be set to the name of the port's pin group.
>=20
> This seems odd.... More on that where I comment on the example.
>=20
> > +The following pin groups are available:
> > +  - GPIO ports: gpioa_pins, gpiob_pins, gpioc_pins, gpiod_pins, gp=
ioe_pins,
> > +                gpiof_pins, gpiog_pins, gpioh_pins, gpioi_pins, gp=
ioj_pins,
> > +                gpiok_pins, gpiol_pins, gpiom_pins, gpion_pins
> ...
> > +  - JTAG: jtag_pins
>=20
> I'd suggest removing "_pins" from all those names, since it's the sam=
e
> in all names and hence isn't necessary.
>=20
> > +GPIO ranges definition
> > +----------------------
> > +
> > +The named pin groups of GPIO ports can be used to define GPIO rang=
es as
> > +explained in Documentation/devicetree/bindings/gpio/gpio.txt.
>=20
> I wouldn't mention that here; the GPIO node contains the gpio-ranges
> property, not the pin controller node. Hence, the binding for the GPI=
O
> DT node should describe the property, not the binding for this node.
>=20
> > +Example
> > +-------
> > +
> > +iomux: iomux@FF10601c {
> > +	compatible =3D "abilis,tb10x-iomux";
> > +	reg =3D <0xFF10601c 0x4>;
> > +	pctl_gpio_a: pctl-gpio-a {
> > +		pingrp =3D "gpioa_pins";
> > +	};
> > +	pctl_uart0: pctl-uart0 {
> > +		pingrp =3D "uart0_pins";
> > +	};
> > +};
>=20
> The two nodes pctl-gpio-a and pctl-uart0 seem to be missing data. The
> idea here is that you define nodes that says:
>=20
> * This node applies to these pin(s)/group(s).
> * Select mux function X on those pins/groups and/or apply these pin
> configuration options to those pins/groups.
>=20
> The examples above don't include any mux/config options, nor does the
> binding say how to do specify them.
>=20
> The set of pin groups defined by this binding should correspond direc=
tly
> to the set of pin groups that actually exist in HW. So, if you have 3
> pin groups (A, B, C) in HW each of which has two mux functions (X, Y)=
,
> your DT binding should define just 3 pin groups (A, B, C), not 6 (A_X=
,
> A_Y, B_X, B_Y, C_X, C_Y). In other words, the pin group name shouldn'=
t
> imply the mux function.

Can we consider it as agreed now that this implementation is acceptable
for the TB10x pin controller?

--=20
  Christian Ruppert              ,          <christian.ruppert@abilis.c=
om>
                                /|
  Tel: +41/(0)22 816 19-42     //|                 3, Chemin du Pr=E9-F=
leuri
                             _// | bilis Systems   CH-1228 Plan-les-Oua=
tes
