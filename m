From: Beniamino Galvani <b.galvani@gmail.com>
Subject: Re: [PATCH 1/2] of: add bq and radxa vendor prefixes
Date: Sun, 4 May 2014 15:08:39 +0200
Message-ID: <20140504130837.GA4498@gmail.com>
References: <1398973835-26303-1-git-send-email-b.galvani@gmail.com>
 <2225372.rvnmuAdhHE@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <2225372.rvnmuAdhHE@phil>
Sender: linux-doc-owner@vger.kernel.org
To: Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>
List-Id: devicetree@vger.kernel.org

On Fri, May 02, 2014 at 01:32:37AM +0200, Heiko St=FCbner wrote:
> Hi Beniamino,
>=20
> Am Donnerstag, 1. Mai 2014, 21:50:34 schrieb Beniamino Galvani:
> > Add new vendor prefixes for:
> >=20
> >     * bq, a company that sells multimedia devices and 3D printers
>=20
> bq is actually only a brandname. The company itself is "Mundo Reader =
S.L.".
> I'm not sure what the actual policy is concerning the vendor prefix, =
i.e. if it=20
> should use the visible brand name or the actual company name.
>=20
> I.e. another possibility would be to add the vendor prefix
> 	mundoreader	Mundo Reader S.L.
> and name the currie
> 	mundoreader,bq-curie2

I've added DT bindings maintainers in CC as I should have done from
the beginning, hoping that someone can clarify this.

My opinion is that the brand name is not relevant since the prefix
represents the company which designs and manufactures the device; so
in this case I agree with your proposal to use mundoreader instead of
bq.

Beniamino

>=20
> >     * Radxa, manufacturer of ARM boards
> >=20
> > Signed-off-by: Beniamino Galvani <b.galvani@gmail.com>
> > ---
> >  Documentation/devicetree/bindings/vendor-prefixes.txt |    2 ++
> >  1 file changed, 2 insertions(+)
> >=20
> > diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt
> > b/Documentation/devicetree/bindings/vendor-prefixes.txt index
> > abc3080..6f8177c 100644
> > --- a/Documentation/devicetree/bindings/vendor-prefixes.txt
> > +++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
> > @@ -21,6 +21,7 @@ atmel	Atmel Corporation
> >  auo	AU Optronics Corporation
> >  avago	Avago Technologies
> >  bosch	Bosch Sensortec GmbH
> > +bq	bq
> >  brcm	Broadcom Corporation
> >  buffalo	Buffalo, Inc.
> >  calxeda	Calxeda
> > @@ -98,6 +99,7 @@ powervr	PowerVR (deprecated, use img)
> >  qca	Qualcomm Atheros, Inc.
> >  qcom	Qualcomm Technologies, Inc
> >  qnap	QNAP Systems, Inc.
> > +radxa	Radxa
> >  raidsonic	RaidSonic Technology GmbH
> >  ralink	Mediatek/Ralink Technology Corp.
> >  ramtron	Ramtron International
>=20
