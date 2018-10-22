Return-Path: <SRS0=/AVO=NC=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-eopbgr50065.outbound.protection.outlook.com ([40.107.5.65]:6254
        "EHLO EUR03-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726694AbeJVMNS (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 22 Oct 2018 08:13:18 -0400
From: Pankaj Bansal <pankaj.bansal@nxp.com>
Subject: RE: using interrupt controller dt-bindings macros in Non GPL dts
 files
Date: Mon, 22 Oct 2018 03:56:29 +0000
Message-ID: <HE1PR0402MB3323412D5AB2DF59A5CE1030F1F40@HE1PR0402MB3323.eurprd04.prod.outlook.com>
References: <HE1PR0402MB3323967BD6C0E11C738BFF38F1F40@HE1PR0402MB3323.eurprd04.prod.outlook.com>
In-Reply-To: <HE1PR0402MB3323967BD6C0E11C738BFF38F1F40@HE1PR0402MB3323.eurprd04.prod.outlook.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: devicetree-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@nvidia.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Varun Sethi <V.Sethi@nxp.com>, Udit Kumar <udit.kumar@nxp.com>, Leo Li <leoyang.li@nxp.com>
List-ID: <devicetree@vger.kernel.org>

Hi All,

I have a query about include/dt-bindings/interrupt-controller/irq.h and inc=
lude/dt-bindings/interrupt-controller/arm-gic.h files.
I would like to use these header files in NON-GPL (X11 Licensed) dts/dtsi f=
iles, to use the macros defined in these header files in our dts/dtsi files=
.
1. Does including the GPL header files for macros (NON executable code) in =
NON-GPL files, causes the license of NON-GPL file to be contaminated with G=
PL code?

If that is the case:
2. Would it be possible for the copyright owners of these header files to m=
ake these files dual licensed, so that we are able to use these files in ou=
r dts/dtsi files?

I was not able to find the copyright owner of these files from files itself=
, so I have included all the developers who have contributed to these files=
 in *TO* list.

Regards,
Pankaj Bansal
