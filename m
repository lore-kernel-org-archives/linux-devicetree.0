From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH 1/2] of: add bq and radxa vendor prefixes
Date: Tue, 06 May 2014 13:31:24 +0200
Message-ID: <3107321.XJc3MCHyeC@diego>
References: <1398973835-26303-1-git-send-email-b.galvani@gmail.com> <CABuKBe+fFCU2__rEHfiU+XPQwKE613VBxQ4=8xiA3PXQkBiMDQ@mail.gmail.com> <20140506111345.GB22196@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20140506111345.GB22196@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Beniamino Galvani <b.galvani@gmail.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Am Dienstag, 6. Mai 2014, 13:13:46 schrieb Beniamino Galvani:
> On Sun, May 04, 2014 at 02:57:52PM +0200, Matthias Brugger wrote:
> > 2014-05-02 1:32 GMT+02:00 Heiko St=FCbner <heiko@sntech.de>:
> > > Hi Beniamino,
> > >=20
> > > Am Donnerstag, 1. Mai 2014, 21:50:34 schrieb Beniamino Galvani:
> > >> Add new vendor prefixes for:
> > >>     * bq, a company that sells multimedia devices and 3D printer=
s
> > >=20
> > > bq is actually only a brandname. The company itself is "Mundo Rea=
der
> > > S.L.".
> > > I'm not sure what the actual policy is concerning the vendor pref=
ix,
> > > i.e. if it should use the visible brand name or the actual compan=
y
> > > name.
> > >=20
> > > I.e. another possibility would be to add the vendor prefix
> > >=20
> > >         mundoreader     Mundo Reader S.L.
> > >=20
> > > and name the currie
> > >=20
> > >         mundoreader,bq-curie2
> >=20
> > I think we should stick to the brand name, as this is the name peop=
le
> > know.
>=20
> Personally I don't have a strong preference, so either of the two.

According to an IRC conversation I just had, it is supposed to be the r=
eal=20
company name ... so I guess my option above would be the correct one.


Heiko

>=20
> Beniamino
>=20
> > > Heiko
> > >=20
> > >>     * Radxa, manufacturer of ARM boards
> > >>=20
> > >> Signed-off-by: Beniamino Galvani <b.galvani@gmail.com>
> > >> ---
> > >>=20
> > >>  Documentation/devicetree/bindings/vendor-prefixes.txt |    2 ++
> > >>  1 file changed, 2 insertions(+)
> > >>=20
> > >> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.t=
xt
> > >> b/Documentation/devicetree/bindings/vendor-prefixes.txt index
> > >> abc3080..6f8177c 100644
> > >> --- a/Documentation/devicetree/bindings/vendor-prefixes.txt
> > >> +++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
> > >> @@ -21,6 +21,7 @@ atmel       Atmel Corporation
> > >>=20
> > >>  auo  AU Optronics Corporation
> > >>  avago        Avago Technologies
> > >>  bosch        Bosch Sensortec GmbH
> > >>=20
> > >> +bq   bq
> > >>=20
> > >>  brcm Broadcom Corporation
> > >>  buffalo      Buffalo, Inc.
> > >>  calxeda      Calxeda
> > >>=20
> > >> @@ -98,6 +99,7 @@ powervr     PowerVR (deprecated, use img)
> > >>=20
> > >>  qca  Qualcomm Atheros, Inc.
> > >>  qcom Qualcomm Technologies, Inc
> > >>  qnap QNAP Systems, Inc.
> > >>=20
> > >> +radxa        Radxa
> > >>=20
> > >>  raidsonic    RaidSonic Technology GmbH
> > >>  ralink       Mediatek/Ralink Technology Corp.
> > >>  ramtron      Ramtron International
> > >=20
> > > _______________________________________________
> > > linux-arm-kernel mailing list
> > > linux-arm-kernel@lists.infradead.org
> > > http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
