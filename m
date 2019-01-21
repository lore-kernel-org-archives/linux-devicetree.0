Return-Path: <SRS0=chu1=P5=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-eopbgr1400112.outbound.protection.outlook.com ([40.107.140.112]:9277
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727169AbfAUVR0 (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 21 Jan 2019 16:17:26 -0500
From: Chris Brandt <Chris.Brandt@renesas.com>
Subject: RE: [PATCH v4 0/2] Add Initial Device Tree for RZ/A2
Date: Mon, 21 Jan 2019 21:17:20 +0000
Message-ID: <TY1PR01MB1562E0657C155C47620BF6F68A9F0@TY1PR01MB1562.jpnprd01.prod.outlook.com>
References: <20181218170555.121673-1-chris.brandt@renesas.com>
In-Reply-To: <20181218170555.121673-1-chris.brandt@renesas.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: devicetree-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

Hi Simon,

On Tuesday, December 18, 2018, Chris Brandt wrote:
> Add a Device Tree for RZ/A2 and the existing eval board.
>=20
> Once these get approved, I'll start piling on the other drivers in
> another patch series
>=20
> NOTE:
> Since Rob is currently converting shmobile.txt to renesas.yaml,
> I'll wait till renesas.yaml hits -next, then add this RZ/A2M EVB
> board (it's too confusing to me to figure out how to make a patch
> series using multiple different trees)
>=20
> Chris Brandt (2):
>   ARM: dts: r7s9210: Initial SoC device tree
>   ARM: dts: r7s9210-rza2mevb: Add support for RZ/A2M EVB
>=20
>  arch/arm/boot/dts/Makefile             |   1 +
>  arch/arm/boot/dts/r7s9210-rza2mevb.dts |  82 +++++++++++++
>  arch/arm/boot/dts/r7s9210.dtsi         | 218
> +++++++++++++++++++++++++++++++++
>  3 files changed, 301 insertions(+)
>  create mode 100644 arch/arm/boot/dts/r7s9210-rza2mevb.dts
>  create mode 100644 arch/arm/boot/dts/r7s9210.dtsi


What ever happened to these patches?

I didn't see any negative feedback after V4, but I also never saw=20
anything get queued up.


Chris
