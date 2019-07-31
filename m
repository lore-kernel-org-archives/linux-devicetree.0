Return-Path: <SRS0=ZxCc=V4=renesas.com=Chris.Brandt@kernel.org>
From: Chris Brandt <Chris.Brandt@renesas.com>
Subject: RE: [PATCH/RFC] ARM: dts: rza2mevb: Fix numbering of Ethernet aliases
Date: Wed, 31 Jul 2019 14:28:16 +0000
Message-ID: 
 <TY1PR01MB156262DA5C9260BEE51472268ADF0@TY1PR01MB1562.jpnprd01.prod.outlook.com>
References: <20190731133936.18228-1-geert+renesas@glider.be>
In-Reply-To: <20190731133936.18228-1-geert+renesas@glider.be>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: Geert Uytterhoeven <geert+renesas@glider.be>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Marek Vasut <marek.vasut+renesas@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

Hi Geert,

On Wed, Jul 31, 2019, Geert Uytterhoeven wrote:
> The two Ethernet ports on the RZA2MEVB development board are labeled
> "Ether1" and "Ether2".  Reflect this numbering in the ethernet aliases.

However, the channels are labeled as ETHERC0 and ETHERC1 in the hardware
manual.

So I guess my question is, in general, is the board specific Device Tree
supposed to describe what is on the SoC? Or on the board silk screen?

Maybe this is like "COM1" is labeled on PC motherboard and we expect it=20
to show up as /dev/ttyS0 regardless of what physical serial port it is=20
connected to.

Thanks,
Chris
