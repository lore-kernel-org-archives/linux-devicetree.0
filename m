From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Subject: Re: [PATCH v3 6/9] ARM: mvebu: add pinctrl device in DT for Armada
 370/XP SoCs
Date: Wed, 12 Sep 2012 08:56:52 +0200
Message-ID: <20120912085652.21d3232f@skate>
References: <1345623750-10645-1-git-send-email-sebastian.hesselbarth@gmail.com>
	<1347266386-16229-1-git-send-email-sebastian.hesselbarth@gmail.com>
	<1347266386-16229-7-git-send-email-sebastian.hesselbarth@gmail.com>
	<504FB9D7.3030205@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <504FB9D7.3030205@wwwdotorg.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, Rob Landley <rob@landley.net>, Russell King <linux@arm.linux.org.uk>, Lior Amsalem <alior@marvell.com>, Andrew Lunn <andrew@lunn.ch>, Jason Cooper <jason@lakedaemon.net>, Gregory CLEMENT <gregory.clement@free-electrons.com>, Ben Dooks <ben.dooks@codethink.co.uk>, Linus Walleij <linus.walleij@linaro.org>, devicetree-discuss@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Le Tue, 11 Sep 2012 16:23:19 -0600,
Stephen Warren <swarren@wwwdotorg.org> a =C3=A9crit :

> On 09/10/2012 02:39 AM, Sebastian Hesselbarth wrote:
> > From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> >=20
> > The Armada 370 and XP SoCs have configurable muxing for a certain
> > number of their pins, controlled through a pinctrl driver.
>=20
> Hmmm. I'd be tempted just to put the entire node definition there;
> putting in a .dtsi file just to share the reg property doesn't seem
> especially useful.

When you say "here" you're mentioning the SoC-specific .dtsi files (i.e
the ones in PATCH 7/9 and PATCH 8/9), correct?

> > The 'compatible' property is defined in the SoC-specific .dtsi file=
s,
> > since the compatible string identifies the number of pins and other
> > SoC-specific properties.
>=20
> > diff --git a/arch/arm/boot/dts/armada-370-xp.dtsi b/arch/arm/boot/d=
ts/armada-370-xp.dtsi
>=20
> > +		pinctrl@d0018000 {
>=20
> If this is the only pinctrl instance, you'd typically name the node j=
ust
> "pinctrl", since the "@d0018000" isn't needed to get unique node name=
s.

Ack.

> > +			reg =3D <0xd0018000 0x38>;
> > +			#address-cells =3D <1>;
> > +			#size-cells =3D <1>;
> > +			ranges;
>=20
> What is "ranges" for; this isn't a memory-mapped bus, right?

Ack.

Best regards,

Thomas
--=20
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
