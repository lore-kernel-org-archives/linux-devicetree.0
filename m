Return-Path: <SRS0=nKhH=OJ=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-eopbgr1410127.outbound.protection.outlook.com ([40.107.141.127]:12409
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726521AbeK3XOE (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Fri, 30 Nov 2018 18:14:04 -0500
From: Chris Brandt <Chris.Brandt@renesas.com>
Subject: RE: [PATCH 1/2] ARM: dts: r7s9210: Initial SoC device tree
Date: Fri, 30 Nov 2018 12:04:57 +0000
Message-ID: <OSAPR01MB15534822E5E9CC52AA0BCE778AD30@OSAPR01MB1553.jpnprd01.prod.outlook.com>
References: <20181129130559.66732-1-chris.brandt@renesas.com>
 <20181129130559.66732-2-chris.brandt@renesas.com>
 <20181130115500.twmtwnu352ukjm73@verge.net.au>
In-Reply-To: <20181130115500.twmtwnu352ukjm73@verge.net.au>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: devicetree-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

Hi Simon,


On Friday, November 30, 2018, Simon Horman wrote:
> > +	cpg: clock-controller@fcfe0020 {
> > +		compatible =3D "renesas,r7s9210-cpg-mssr";
> > +		reg =3D <0xfcfe0010 0x455>;
>=20
> There is a discrepancy here between the base address, fcfe0020
> and the start address of the register range, 0xfcfe0010.

Good catch! Thank you.


> > +	ostm0: timer@e803b000 {
> > +		compatible =3D "renesas,r7s9210-ostm", "renesas,ostm";
> > +		reg =3D <0xe803b000 0x30>;
>=20
>=20
> Its not clear to me why the size of the register range is 0x30.

Because when reviewing the bindings docs, I was putting in 'exact'=20
values, but Geert said "those are ugly, just round up to make it look
nicer".
So instead of 0x21, I put 0x30.

You know...the standard answer: Throw Geert under the bus ;)


Chris
