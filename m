From: Chris Brandt <Chris.Brandt@renesas.com>
Subject: RE: [PATCH 0/5] ARM: rskrza1: Add RZ/A1 IRQC and input switches
Date: Mon, 29 Apr 2019 12:21:50 +0000
Message-ID: <TY1PR01MB15620A5958E5A9211518E0C48A390@TY1PR01MB1562.jpnprd01.prod.outlook.com>
References: <20190429093631.10799-1-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190429093631.10799-1-geert+renesas@glider.be>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Geert,

Thanks for this patch!

I've been hacking this support into the standard GIC driver in our BSPs=20
for years now. :o

On Mon, Apr 29, 2019, Geert Uytterhoeven wrote:
> I expect this driver to be reusable for RZ/A2, after adding a match
> entry with .gic_spi_base =3D 4.

Yes, the same IP block is in RZ/A2.

So with that said, should we call this driver irq-renesas-rza1.c or just
irq-renesas-rza.c?
It doesn't really matter to me.
For an RZ/A3, we might just use the same IP again.

Side note, I've seen this interrupt pin HW in some older SH4A devices=20
(like SH7724 and SH7757). So it's been around for a while.


Chris
