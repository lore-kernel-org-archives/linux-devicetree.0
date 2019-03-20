Return-Path: <SRS0=p57L=RX=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-eopbgr1400123.outbound.protection.outlook.com ([40.107.140.123]:35900
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726832AbfCTUlq (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 20 Mar 2019 16:41:46 -0400
From: Chris Brandt <Chris.Brandt@renesas.com>
Subject: RE: [PATCH 0/2] ARM: dts: rskrza1: Add I2C and remaining LEDs
Date: Wed, 20 Mar 2019 20:41:43 +0000
Message-ID: <TY1PR01MB15627B138E7BE709BC483E2A8A410@TY1PR01MB1562.jpnprd01.prod.outlook.com>
References: <20190320194410.14870-1-geert+renesas@glider.be>
In-Reply-To: <20190320194410.14870-1-geert+renesas@glider.be>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: devicetree-owner@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>
Cc: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

Hi Geert,

On Wed, Mar 20, 2019, Geert Uytterhoeven wrote:
> 	Hi Simon, Magnus, Chris,
>=20
> This patch series adds support for devices on the I2C bus on the RSKRZA1
> board, including the GPIO expander that drives 3 LEDs.
>=20
> Thanks!

Very cool.

I figured there was a more graceful way of turning on/off those LEDs=20
than what I was doing...which was just writing to the I2C bus in my LED=20
heartbeat kernel thread.
https://github.com/renesas-rz/rza_linux-4.19/blob/master/arch/arm/mach-shmo=
bile/board-rskrza1.c#L145


Chris
