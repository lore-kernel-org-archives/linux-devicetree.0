From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH V10 1/6] mfd: add device-tree binding doc for PMIC
 max77620/max20024
Date: Wed, 27 Apr 2016 16:30:57 +0100
Message-ID: <20160427153057.GF4892@dell>
References: <1459348188-11726-1-git-send-email-ldewangan@nvidia.com>
 <1459348188-11726-2-git-send-email-ldewangan@nvidia.com>
 <20160427124959.GC4892@dell>
 <20160427150443.GC4176@ulmo.ba.sec>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160427150443.GC4176@ulmo.ba.sec>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <treding@nvidia.com>
Cc: Laxman Dewangan <ldewangan@nvidia.com>, linus.walleij@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, gnurou@gmail.com, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, ijc+devicetree@hellion.org.uk, swarren@nvidia.com
List-Id: devicetree@vger.kernel.org

On Wed, 27 Apr 2016, Thierry Reding wrote:

> On Wed, Apr 27, 2016 at 01:49:59PM +0100, Lee Jones wrote:
> > On Wed, 30 Mar 2016, Laxman Dewangan wrote:
> >=20
> > > The MAXIM PMIC MAX77620 and MAX20024 are power management IC
> > > which supports RTC, GPIO, DCDC/LDO regulators, interrupt,
> > > watchdog etc.
> > >=20
> > > Add DT binding document for the different functionality of
> > > this device.
> > >=20
> > > Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
> > > Acked-by: Rob Herring <robh@kernel.org>
> > >=20
> > > ---
> > > Changes from V1:
> > > - Added units in some of properties.
> > > - Change the boolean property to tristate type and detail some of
> > >   properties.
> > >=20
> > > Change from V2:
> > > - added unit in period related dt property.
> > >=20
> > > Change from V3: None
> > > - Added Rob's ack.
> > >=20
> > > Changes from V4:
> > > - A- Provide more details in the dt binding doc.
> > > - Take care of fps nodes.
> > > - Split the submodule's DT binding doc on respective folder.
> > > - Drop the battery charger and low battery binding and related co=
de as
> > >   it need to go on power driver.
> > >=20
> > > Change from V5:
> > > - None
> > >=20
> > > Change from V6:
> > > -start the patch title with mfd instead of DT: mfd:
> > >=20
> > > Change from V7:
> > > - Better describe the FPS to make more clear.
> > >=20
> > > Changes from V8:
> > > None
> > >=20
> > > Changes from V9:
> > > None
> > >=20
> > >  Documentation/devicetree/bindings/mfd/max77620.txt | 143 +++++++=
++++++++++++++
> > >  include/dt-bindings/mfd/max77620.h                 |  39 ++++++
> > >  2 files changed, 182 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/mfd/max7762=
0.txt
> > >  create mode 100644 include/dt-bindings/mfd/max77620.h
> >=20
> > For my own reference:
> >=20
> >   Acked-by: Lee Jones <lee.jones@linaro.org>
>=20
> Hi Lee,
>=20
> I'm confused now. Were you going to pick this up, or are you waiting =
for
> someone else to do it?

I will pick it up once I'm good with the driver.

The "For my own reference" tags are just to let me know not to waste
my time and re-review.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
