From: Beniamino Galvani <b.galvani@gmail.com>
Subject: Re: [PATCH 1/2] of: add bq and radxa vendor prefixes
Date: Tue, 6 May 2014 13:13:46 +0200
Message-ID: <20140506111345.GB22196@gmail.com>
References: <1398973835-26303-1-git-send-email-b.galvani@gmail.com>
 <2225372.rvnmuAdhHE@phil>
 <CABuKBe+fFCU2__rEHfiU+XPQwKE613VBxQ4=8xiA3PXQkBiMDQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <CABuKBe+fFCU2__rEHfiU+XPQwKE613VBxQ4=8xiA3PXQkBiMDQ@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>, Pawel Moll <pawel.moll@arm.com>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Sun, May 04, 2014 at 02:57:52PM +0200, Matthias Brugger wrote:
> 2014-05-02 1:32 GMT+02:00 Heiko St=FCbner <heiko@sntech.de>:
> > Hi Beniamino,
> >
> > Am Donnerstag, 1. Mai 2014, 21:50:34 schrieb Beniamino Galvani:
> >> Add new vendor prefixes for:
> >>
> >>     * bq, a company that sells multimedia devices and 3D printers
> >
> > bq is actually only a brandname. The company itself is "Mundo Reader S.=
L.".
> > I'm not sure what the actual policy is concerning the vendor prefix, i.=
e. if it
> > should use the visible brand name or the actual company name.
> >
> > I.e. another possibility would be to add the vendor prefix
> >         mundoreader     Mundo Reader S.L.
> > and name the currie
> >         mundoreader,bq-curie2
> =

> I think we should stick to the brand name, as this is the name people kno=
w.

Personally I don't have a strong preference, so either of the two.

Beniamino

> =

> >
> >
> > Heiko
> >
> >>     * Radxa, manufacturer of ARM boards
> >>
> >> Signed-off-by: Beniamino Galvani <b.galvani@gmail.com>
> >> ---
> >>  Documentation/devicetree/bindings/vendor-prefixes.txt |    2 ++
> >>  1 file changed, 2 insertions(+)
> >>
> >> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt
> >> b/Documentation/devicetree/bindings/vendor-prefixes.txt index
> >> abc3080..6f8177c 100644
> >> --- a/Documentation/devicetree/bindings/vendor-prefixes.txt
> >> +++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
> >> @@ -21,6 +21,7 @@ atmel       Atmel Corporation
> >>  auo  AU Optronics Corporation
> >>  avago        Avago Technologies
> >>  bosch        Bosch Sensortec GmbH
> >> +bq   bq
> >>  brcm Broadcom Corporation
> >>  buffalo      Buffalo, Inc.
> >>  calxeda      Calxeda
> >> @@ -98,6 +99,7 @@ powervr     PowerVR (deprecated, use img)
> >>  qca  Qualcomm Atheros, Inc.
> >>  qcom Qualcomm Technologies, Inc
> >>  qnap QNAP Systems, Inc.
> >> +radxa        Radxa
> >>  raidsonic    RaidSonic Technology GmbH
> >>  ralink       Mediatek/Ralink Technology Corp.
> >>  ramtron      Ramtron International
> >
> >
> > _______________________________________________
> > linux-arm-kernel mailing list
> > linux-arm-kernel@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
> =

> =

> =

> -- =

> motzblog.wordpress.com
