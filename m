Return-Path: <SRS0=dIfH=OV=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-eopbgr1400107.outbound.protection.outlook.com ([40.107.140.107]:51376
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726245AbeLLN7E (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 12 Dec 2018 08:59:04 -0500
From: Chris Brandt <Chris.Brandt@renesas.com>
Subject: RE: [PATCH 2/2] ARM: dts: r7s9210-rza2mevb: Add support for RZ/A2M
 EVB
Date: Wed, 12 Dec 2018 13:58:59 +0000
Message-ID: <TYXPR01MB1568DD386FE18BD1F985E5178AA70@TYXPR01MB1568.jpnprd01.prod.outlook.com>
References: <20181129130559.66732-1-chris.brandt@renesas.com>
 <20181129130559.66732-3-chris.brandt@renesas.com>
 <20181212021549.GA26333@bogus>
In-Reply-To: <20181212021549.GA26333@bogus>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: devicetree-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Simon Horman <horms@verge.net.au>, Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

On Tuesday, December 11, 2018, Rob Herring wrote:
> > +	/* Cramfs XIP File System in QSPI */
> > +	qspi@20000000 {
>=20
>=20
> > +		compatible =3D "mtd-rom";
>=20
> This should be the actual Quad-SPI controller and then a flash device
> underneath it. It may work as-is initially, but eventually won't you
> need the flash details?

Not really.
The "QSPI" actually works as a memory mapped SPI (as in, the CPU sees=20
the QSPI flash as a linear read-only address range).
Basically, u-boot sets up the QSPI to look like a ROM area, and that's=20
it. Everything is running directly from that QSPI flash, so you can't=20
make any modifications to it while running, otherwise the whole system will
go down. Therefore, there is no need to know anything about the actually
Flash that is connected, because you are never allowed to interact with it
(or even query it on boot).

This board in particular only has 8MB of RAM. So, it really only works=20
well as an XIP system (meaning both kernel and file system are XIP from=20
Flash).


Chris
