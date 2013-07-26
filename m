From: Christian Ruppert <christian.ruppert@abilis.com>
Subject: Re: [PATCH 2/4] pinmux: Add TB10x pinmux driver
Date: Fri, 26 Jul 2013 11:42:29 +0200
Message-ID: <20130726094228.GA3232@ab42.lan>
References: <20130626115051.GC7095@ab42.lan>
 <51CB279A.1090404@wwwdotorg.org>
 <20130705094859.GA27196@ab42.lan>
 <51D71337.6030409@wwwdotorg.org>
 <20130708130222.GA6402@ab42.lan>
 <51DDB5B8.5060909@wwwdotorg.org>
 <20130716084755.GB10914@ab42.lan>
 <51E56EF3.5040506@wwwdotorg.org>
 <20130718160700.GA14482@ab42.lan>
 <51E847EA.9060302@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <51E847EA.9060302@wwwdotorg.org>
Sender: linux-doc-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Patrice CHOTARD <patrice.chotard@st.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, Rob Landley <rob@landley.net>, Sascha Leuenberger <sascha.leuenberger@abilis.com>, Pierrick Hascoet <pierrick.hascoet@abilis.com>, devicetree-discuss@lists.ozlabs.org, linux-doc@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
List-Id: devicetree@vger.kernel.org

On Thu, Jul 18, 2013 at 01:54:18PM -0600, Stephen Warren wrote:
> On 07/18/2013 10:07 AM, Christian Ruppert wrote:
> ...
> > Well, perhaps my definition of "inside"/"outside" pins was not quit=
e
> > clear: The pin groups define the set of (kernel internal) pin numbe=
rs of
> > "outside" pins which are used by pin controller to map a given
> > interface. Inside pins are not numbered and the inside interfaces a=
re
> > only used to determine which outside pins are part of the same grou=
p
> > (namely those for which the pin controller hardware provides a mux
> > connection to the same inside interface):
> >=20
> >                        4
> >                 4  /|--/-- SPI
> >    PINS[0..3] --/--||  4
> >                    \|--/-- GPIO[0..3]
> >=20
> >                    4
> >    PINS[4..7] -----/------ GPIO[4..7]
> >=20
> >                        2
> >                 2  /|--/-- I2C
> >    PINS[8..9] --/--||  2
> >                    \|--/-- GPIO[8..9]
> >=20
> > Pins 0..3 are in the SPI group because on the "inside" they can be =
muxed
> > to the SPI interface.
> > Pins 8..9 are in the I2C group because on the "inside" they can be =
muxed
> > to the I2C interface.
> > Pins 0..9 are in the GPIO group because on the "inside" they can be
> > muxed to the GPIO controller.
> >=20
> > All pin numbers are relative to the "outside", however, or conflict
> > management would not be possible. I hope this is more understandabl=
e
> > than my previous explanations.
> > Both muxes are controlled by the same register. In our overly simpl=
istic
> > example this is not strictly necessary but in reality you might hav=
e pin
> > conflicts between the different interfaces.
>=20
> Same register, or same field/bits in that register?
>=20
> If it's the same field/bits, I would expect to see the following pin =
groups:
>=20
> 1) PINS[0..3], PINS[8..9]
> 2) PINS[4..7]
>=20
> ... since those are the things that are independently muxable.
> Otherwise, I'd expect to see the following groups:
>=20
> 1) PINS[0..3]
> 2) PINS[4..7]
> 3) PINS[8..9]
>=20
> > After the discussion we had so far I'm not so sure if extending the
> > pinctrl system with this kind of features is a very good idea.
>=20
> That makes things simple:-)
>=20
> One thing I still don't understand; in a previous mail, you'd mention=
ed
> 3 DT properties for configuring the pinmux; one represented the pin
> group, one represented the mux function that was selected for that pi=
n
> group, and there was a third ("config"?) property. I still don't
> understand that third property. I only see pins/pingroups and mux
> functions in the diagram I quoted above.

In my proposal, pin groups represent interfaces instead of ports: All
three pin groups are configured through the same bit field in the same
register but they represent _logically_ independent functionalities.
The three DT properties are:

1. interface (which pins are we actually interested in when requesting
   this)
2. port (which bit field/register is used to configure this)
3. configuration of that port (which mux function(s) in that bit
   field/register are possible to make the interface available)

--=20
  Christian Ruppert              ,          <christian.ruppert@abilis.c=
om>
                                /|
  Tel: +41/(0)22 816 19-42     //|                 3, Chemin du Pr=E9-F=
leuri
                             _// | bilis Systems   CH-1228 Plan-les-Oua=
tes
