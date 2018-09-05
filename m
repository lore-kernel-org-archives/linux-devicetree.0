Return-Path: <SRS0=ONUo=LT=renesas.com=Chris.Brandt@kernel.org>
From: Chris Brandt <Chris.Brandt@renesas.com>
Subject: RE: [PATCH v3] clk: renesas: cpg-mssr: Add R7S9210 support
Date: Wed, 5 Sep 2018 14:12:18 +0000
Message-ID: 
 <TY1PR01MB1562F79382CA2AA33AA661EB8A020@TY1PR01MB1562.jpnprd01.prod.outlook.com>
References: <20180829132841.64787-1-chris.brandt@renesas.com>
In-Reply-To: <20180829132841.64787-1-chris.brandt@renesas.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, Simon Horman <horms+renesas@verge.net.au>
List-ID: <devicetree@vger.kernel.org>

Hi Geert,

On Wednesday, August 29, 2018, Chris Brandt wrote:
>=20
> Add support for the R7S9210 (RZ/A2) Clock Pulse Generator and Module
> Standby.

I ran into an issue with this driver.

The issue is that the registers needed for this driver are scattered=20
throughout the address space.

I can't just reserve one big block of addresses that cover everything=20
because then I can't reserve any of the addresses that sit in the middle.

For example, my watchdog timer driver doesn't work with this driver=20
because it cannot allocate its register region.

So, I think I need to rework this driver to add the ability to add=20
multiple address regions.

Chris
