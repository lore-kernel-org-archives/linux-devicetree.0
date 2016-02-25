From: Scott Wood <oss@buserror.net>
Subject: Re: [PATCH v2 1/7] QE: Add IC, SI and SIRAM document to device tree
 bindings.
Date: Wed, 24 Feb 2016 23:56:44 -0600
Message-ID: <1456379804.5360.43.camel@buserror.net>
References: <1455757572-44955-1-git-send-email-qiang.zhao@nxp.com>
	 <20160223201520.GA3354@rob-hp-laptop>
	 <1456258812.5360.22.camel@buserror.net>
	 <AM3PR04MB1185D9D56F72F7AD64AC92E291A60@AM3PR04MB1185.eurprd04.prod.outlook.com>
	 <1456369908.5360.28.camel@buserror.net>
	 <AM3PR04MB118518B07AE928823BE73B8491A60@AM3PR04MB1185.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <AM3PR04MB118518B07AE928823BE73B8491A60@AM3PR04MB1185.eurprd04.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Qiang Zhao <qiang.zhao@nxp.com>, Rob Herring <robh@kernel.org>
Cc: Yang-Leo Li <leoyang.li@nxp.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
List-Id: devicetree@vger.kernel.org

On Thu, 2016-02-25 at 05:55 +0000, Qiang Zhao wrote:
> On Thu, 2016-02-25 at 11:12  AM, Scott Wood wrote:
> > -----Original Message-----
> > From: Scott Wood [mailto:oss@buserror.net]
> > Sent: Thursday, February 25, 2016 11:12 AM
> > To: Qiang Zhao <qiang.zhao@nxp.com>; Rob Herring <robh@kernel.org>
> > Cc: Yang-Leo Li <leoyang.li@nxp.com>; linux-kernel@vger.kernel.org;
> > devicetree@vger.kernel.org; linuxppc-dev@lists.ozlabs.org
> > Subject: Re: [PATCH v2 1/7] QE: Add IC, SI and SIRAM document to de=
vice
> > tree
> > bindings.
> >=20
> > On Thu, 2016-02-25 at 03:10 +0000, Qiang Zhao wrote:
> > > On Wed, 2016-02-24 at 04:20  AM, Scott Wood wrote:
> > > > -----Original Message-----
> > > > From: Scott Wood [mailto:oss@buserror.net]
> > > > Sent: Wednesday, February 24, 2016 4:20 AM
> > > > To: Rob Herring <robh@kernel.org>; Qiang Zhao <qiang.zhao@nxp.c=
om>
> > > > Cc: Yang-Leo Li <leoyang.li@nxp.com>; linux-kernel@vger.kernel.=
org;
> > > > devicetree@vger.kernel.org; linuxppc-dev@lists.ozlabs.org
> > > > Subject: Re: [PATCH v2 1/7] QE: Add IC, SI and SIRAM document t=
o
> > > > device tree bindings.
> > > >=20
> > > > On Tue, 2016-02-23 at 14:15 -0600, Rob Herring wrote:
> > > > > On Thu, Feb 18, 2016 at 09:06:06AM +0800, Zhao Qiang wrote:
> > > > > > Add IC, SI and SIRAM document of QE to
> > > > > > Documentation/devicetree/bindings/powerpc/fsl/cpm_qe/qe.txt
> > > > > >=20
> > > > > > Signed-off-by: Zhao Qiang <qiang.zhao@nxp.com>
> > > > > > ---
> > > > > > Changes for v2
> > > > > > 	- Add interrupt-controller in Required properties
> > > > > > 	- delete address-cells and size-cells for qe-si and qe-sir=
am
> > > > > >=20
> > > > > >  .../devicetree/bindings/powerpc/fsl/cpm_qe/qe.txt  | 50
> > > > > > ++++++++++++++++++++++
> > > > > >  1 file changed, 50 insertions(+)
> > > > > >=20
> > > > > > diff --git
> > > > > > a/Documentation/devicetree/bindings/powerpc/fsl/cpm_qe/qe.t=
xt
> > > > > > b/Documentation/devicetree/bindings/powerpc/fsl/cpm_qe/qe.t=
xt
> > > > > > index 4f89302..84052a7 100644
> > > > > > ---
> > > > > > a/Documentation/devicetree/bindings/powerpc/fsl/cpm_qe/qe.t=
xt
> > > > > > +++ b/Documentation/devicetree/bindings/powerpc/fsl/cpm_qe/=
qe.tx
> > > > > > +++ t
> > > > > > @@ -69,6 +69,56 @@ Example:
> > > > > >  	};
> > > > > >       };
> > > > > >=20
> > > > > > +* Interrupt Controller (IC)
> > > > > > +
> > > > > > +Required properties:
> > > > > > +- compatible : should be "fsl,qe-ic".
> > > > >=20
> > > > > > +- compatible : should be "fsl,qe-si".
> > > > >=20
> > > > > > +- compatible : should be "fsl,qe-siram".
> > > > >=20
> > > > > These compatible strings are all a bit generic and should hav=
e SoC
> > > > > specific compatible strings.
> > > >=20
> > > > I don't know about si/siram, but "fsl,qe-ic" has been around si=
nce
> > > > 2008, so it should be documented even if a more specific compat=
ible
> > > > is also added.
> > >=20
> > > Agree, and si/siram are also has been around since 2008.
> >=20
> > Where?  I couldn't find them when grepping.
>=20
> Sorry, I make a mistake, they have not been in upstream.
>=20
> >=20
> > > In addition, I don=E2=80=99t think it is needed to add specific c=
ompatible,
> > > because they are the same in qe-supported soc.
> >=20
> > How do we know that they are 100% the same?
>=20
> You mean it will be changed in later version?

That's always a possibility, but even on current chips, what bit of
documentation are you referring to that confirms it's the exact same lo=
gic?

-Scott
