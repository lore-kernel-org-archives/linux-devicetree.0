From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH 1/2] of: add vendor prefix for Mentor Graphics
Date: Mon, 6 Jan 2014 18:30:00 +0000
Message-ID: <20140106183000.GL24664@e106331-lin.cambridge.arm.com>
References: <1387470351-4696-1-git-send-email-bigeasy@linutronix.de>
 <D53158FF-7BCF-4BA8-A589-B6365B4DA058@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <D53158FF-7BCF-4BA8-A589-B6365B4DA058@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kumar Gala <galak@codeaurora.org>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Felipe Balbi <balbi@ti.com>, devicetree <devicetree@vger.kernel.org>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, Pawel Moll <Pawel.Moll@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Landley <rob@landley.net>
List-Id: devicetree@vger.kernel.org

On Fri, Dec 20, 2013 at 05:26:02PM +0000, Kumar Gala wrote:
>=20
> On Dec 19, 2013, at 10:25 AM, Sebastian Andrzej Siewior <bigeasy@linu=
tronix.de> wrote:
>=20
> > This prefix is currently used for the musb driver.
> >=20
> > Acked-by: Stephen Warren <swarren@nvidia.com>
> > Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> > ---
> > Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
> > 1 file changed, 1 insertion(+)
> >=20
> > diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt =
b/Documentation/devicetree/bindings/vendor-prefixes.txt
> > index 8c75d85..cb5c438 100644
> > --- a/Documentation/devicetree/bindings/vendor-prefixes.txt
> > +++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
> > @@ -43,6 +43,7 @@ linux	Linux-specific binding
> > lsi	LSI Corp. (LSI Logic)
> > marvell	Marvell Technology Group Ltd.
> > maxim	Maxim Integrated Products
> > +mentor	Mentor Graphics
>=20
> file like we should use =E2=80=98ment=E2=80=99, but not sure if we ar=
e going away from ticker symbols or not.

In general we've been heading towards full names rather than stock
ticker symbols. It's far easier for a human to make an educated guess
without searching.

I'm certainly happy with mentor as a vendor prefix.

Mark.

>=20
> > microchip	Microchip Technology Inc.
> > mosaixtech	Mosaix Technologies, Inc.
> > national	National Semiconductor
> > --=20
> > 1.8.5.1
> >=20
>=20
> - k
>=20
> --=20
> Employee of Qualcomm Innovation Center, Inc.
> Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, ho=
sted by The Linux Foundation
>=20
>=20
