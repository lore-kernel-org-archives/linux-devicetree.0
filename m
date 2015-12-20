From: Sergei Ianovich <ynvich@gmail.com>
Subject: Re: [PATCH v5] rtc: support DS1302 RTC on ICP DAS LP-8x4x
Date: Sun, 20 Dec 2015 15:14:16 +0300
Message-ID: <1450613656.15911.62.camel@gmail.com>
References: <397668667-27328-3-git-send-email-ynvich@gmail.com>
	 <1450201525-9137-1-git-send-email-ynvich@gmail.com>
	 <20151220033815.GD9883@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20151220033815.GD9883@rob-hp-laptop>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Alessandro Zummo <a.zummo@towertech.it>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "open list:REAL TIME CLOCK (RTC) SUBSYSTEM" <rtc-linux@googlegroups.com>
List-Id: devicetree@vger.kernel.org

On Sat, 2015-12-19 at 21:38 -0600, Rob Herring wrote:
> On Tue, Dec 15, 2015 at 08:45:23PM +0300, Sergei Ianovich wrote:
>=20
> Nothing in this is specific to ICP, so the subject should be updated.
>=20
> > Signed-off-by: Sergei Ianovich <ynvich@gmail.com>
> > CC: Alexandre Belloni <alexandre.belloni@free-electrons.com>
> > ---
> > =C2=A0=C2=A0=C2=A0v4..v5
> > =C2=A0=C2=A0=C2=A0* drop THIS_MODULE from struct platform driver
> > =C2=A0=C2=A0=C2=A0* use "dallas" for vendor name per vendor-prefixe=
s.txt
> >=20
> > =C2=A0=C2=A0=C2=A0v3..v4
> > =C2=A0=C2=A0=C2=A0* move DTS bindings to a different patch
> >=20
> > =C2=A0=C2=A0=C2=A0v2..v3
> > =C2=A0=C2=A0=C2=A0* use usleep_range instead of custom nsleep
> > =C2=A0=C2=A0=C2=A0* number change (07/16 -> 09/21)
> >=20
> > =C2=A0=C2=A0=C2=A0v0..v2
> > =C2=A0=C2=A0=C2=A0* use device tree
> > =C2=A0=C2=A0=C2=A0* use devm helpers where possible
> >=20
> > =C2=A0.../devicetree/bindings/rtc/rtc-ds1302.txt=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|=C2=A0=C2=A014 +++
> > =C2=A0drivers/rtc/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0|=C2=A0=C2=A0=C2=A02 +-
> > =C2=A0drivers/rtc/rtc-ds1302.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| 100
> > ++++++++++++++++++++-
> > =C2=A03 files changed, 113 insertions(+), 3 deletions(-)
> > =C2=A0create mode 100644 Documentation/devicetree/bindings/rtc/rtc-
> > ds1302.txt
> >=20
> > diff --git a/Documentation/devicetree/bindings/rtc/rtc-ds1302.txt
> > b/Documentation/devicetree/bindings/rtc/rtc-ds1302.txt
> > new file mode 100644
> > index 0000000..810613b
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/rtc/rtc-ds1302.txt
> > @@ -0,0 +1,14 @@
> > +* Dallas Semiconductor DS-1302 RTC
> > +
> > +Simple device which could be used to store date/time between
> > reboots.
> > +
> > +Required properties:
> > +- compatible : Should be "dallas,rtc-ds1302"
> > +- reg : Should be address and size of IO memory region
>=20
> This device is a SPI (or SPI like?) interface. So you have some sort
> of=20
> of FPGA logic in between the cpu and ds1302. The DT should have a nod=
e
> for the controller and then the ds1302 as a child of it. A full blown=
=20
> SPI driver may be overkill here, but that's a separate discussion fro=
m
> the DT binding.

Below is the quote from the actual DT of LP-8x4x:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0fpga@5 {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0compatible =3D "simple-bus";
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0#address-cells =3D <1>;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0#size-cells =3D <1>;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0ranges =3D <0 5 0x3000000 0x10000>;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0interrupt-parent =3D <&fpgairq>;
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0rtc@901c {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0compatible =3D "dall=
as,rtc-ds1302";
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0reg =3D <0x901c 0x1>=
;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0status =3D "okay";
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0};

You are right about the topology. ds1302 is a half-duplex SPI device.
Does this mean I should rewrite the driver to handle the chip as a slav=
e
SPI device, and then provide a master SPI functionality at the FPGA?
