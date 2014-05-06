From: Beniamino Galvani <b.galvani@gmail.com>
Subject: Re: [PATCH 1/2] of: add bq and radxa vendor prefixes
Date: Tue, 6 May 2014 19:15:42 +0200
Message-ID: <20140506171538.GA23762@gmail.com>
References: <1398973835-26303-1-git-send-email-b.galvani@gmail.com>
 <CABuKBe+fFCU2__rEHfiU+XPQwKE613VBxQ4=8xiA3PXQkBiMDQ@mail.gmail.com>
 <20140506111345.GB22196@gmail.com>
 <3107321.XJc3MCHyeC@diego>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <3107321.XJc3MCHyeC@diego>
Sender: linux-doc-owner@vger.kernel.org
To: Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>
List-Id: devicetree@vger.kernel.org

On Tue, May 06, 2014 at 01:31:24PM +0200, Heiko St=FCbner wrote:
> Am Dienstag, 6. Mai 2014, 13:13:46 schrieb Beniamino Galvani:
> > On Sun, May 04, 2014 at 02:57:52PM +0200, Matthias Brugger wrote:
> > > 2014-05-02 1:32 GMT+02:00 Heiko St=FCbner <heiko@sntech.de>:
> > > > Hi Beniamino,
> > > >=20
> > > > Am Donnerstag, 1. Mai 2014, 21:50:34 schrieb Beniamino Galvani:
> > > >> Add new vendor prefixes for:
> > > >>     * bq, a company that sells multimedia devices and 3D print=
ers
> > > >=20
> > > > bq is actually only a brandname. The company itself is "Mundo R=
eader
> > > > S.L.".
> > > > I'm not sure what the actual policy is concerning the vendor pr=
efix,
> > > > i.e. if it should use the visible brand name or the actual comp=
any
> > > > name.
> > > >=20
> > > > I.e. another possibility would be to add the vendor prefix
> > > >=20
> > > >         mundoreader     Mundo Reader S.L.
> > > >=20
> > > > and name the currie
> > > >=20
> > > >         mundoreader,bq-curie2
> > >=20
> > > I think we should stick to the brand name, as this is the name pe=
ople
> > > know.
> >=20
> > Personally I don't have a strong preference, so either of the two.
>=20
> According to an IRC conversation I just had, it is supposed to be the=
 real=20
> company name ... so I guess my option above would be the correct one.

Thanks, I updated the patches.

Beniamino

> > > >=20
> > > >>     * Radxa, manufacturer of ARM boards
> > > >>=20
> > > >> Signed-off-by: Beniamino Galvani <b.galvani@gmail.com>
> > > >> ---
> > > >>=20
> > > >>  Documentation/devicetree/bindings/vendor-prefixes.txt |    2 =
++
> > > >>  1 file changed, 2 insertions(+)
> > > >>=20
> > > >> diff --git a/Documentation/devicetree/bindings/vendor-prefixes=
=2Etxt
> > > >> b/Documentation/devicetree/bindings/vendor-prefixes.txt index
> > > >> abc3080..6f8177c 100644
> > > >> --- a/Documentation/devicetree/bindings/vendor-prefixes.txt
> > > >> +++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
> > > >> @@ -21,6 +21,7 @@ atmel       Atmel Corporation
> > > >>=20
> > > >>  auo  AU Optronics Corporation
> > > >>  avago        Avago Technologies
> > > >>  bosch        Bosch Sensortec GmbH
> > > >>=20
> > > >> +bq   bq
> > > >>=20
> > > >>  brcm Broadcom Corporation
> > > >>  buffalo      Buffalo, Inc.
> > > >>  calxeda      Calxeda
> > > >>=20
> > > >> @@ -98,6 +99,7 @@ powervr     PowerVR (deprecated, use img)
> > > >>=20
> > > >>  qca  Qualcomm Atheros, Inc.
> > > >>  qcom Qualcomm Technologies, Inc
> > > >>  qnap QNAP Systems, Inc.
> > > >>=20
> > > >> +radxa        Radxa
> > > >>=20
> > > >>  raidsonic    RaidSonic Technology GmbH
> > > >>  ralink       Mediatek/Ralink Technology Corp.
> > > >>  ramtron      Ramtron International
> > > >=20
> > > > _______________________________________________
> > > > linux-arm-kernel mailing list
> > > > linux-arm-kernel@lists.infradead.org
> > > > http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
>=20
