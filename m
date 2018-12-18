Return-Path: <SRS0=Wq7E=O3=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-eopbgr1400129.outbound.protection.outlook.com ([40.107.140.129]:49822
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726422AbeLRPkH (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 18 Dec 2018 10:40:07 -0500
From: Chris Brandt <Chris.Brandt@renesas.com>
Subject: RE: [PATCH v3 1/2] ARM: dts: r7s9210: Initial SoC device tree
Date: Tue, 18 Dec 2018 15:40:02 +0000
Message-ID: <TYXPR01MB1568D8FDF5E286B2832703048ABD0@TYXPR01MB1568.jpnprd01.prod.outlook.com>
References: <20181217144324.99422-1-chris.brandt@renesas.com>
 <20181217144324.99422-2-chris.brandt@renesas.com>
 <20181218150551.GA15519@bogus>
In-Reply-To: <20181218150551.GA15519@bogus>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: devicetree-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Simon Horman <horms@verge.net.au>, Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

On Tuesday, December 18, 2018 1, Rob Herring wrote:
> > +/ {
> > +	compatible =3D "renesas,r7s9210";
> > +	interrupt-parent =3D <&gic>;
> > +	#address-cells =3D <1>;
> > +	#size-cells =3D <1>;
> > +
> > +	bsid: chipid@fcfe8004 {
>=20
> Put all the mmio peripherals under a simple-bus node or nodes.

Just to be clear on what you mean, basically put all the peripherals=20
under a 'soc' node like the other Renesas parts?

	soc {
		compatible =3D "simple-bus";
		interrupt-parent =3D <&gic>;

		#address-cells =3D <2>;
		#size-cells =3D <2>;
		ranges;


Thanks,
Chris
