From: Scott Wood <oss@buserror.net>
Subject: Re: [PATCH v2 1/7] QE: Add IC, SI and SIRAM document to device tree
 bindings.
Date: Wed, 24 Feb 2016 21:11:48 -0600
Message-ID: <1456369908.5360.28.camel@buserror.net>
References: <1455757572-44955-1-git-send-email-qiang.zhao@nxp.com>
	 <20160223201520.GA3354@rob-hp-laptop>
	 <1456258812.5360.22.camel@buserror.net>
	 <AM3PR04MB1185D9D56F72F7AD64AC92E291A60@AM3PR04MB1185.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <AM3PR04MB1185D9D56F72F7AD64AC92E291A60@AM3PR04MB1185.eurprd04.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Qiang Zhao <qiang.zhao@nxp.com>, Rob Herring <robh@kernel.org>
Cc: Yang-Leo Li <leoyang.li@nxp.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
List-Id: devicetree@vger.kernel.org

On Thu, 2016-02-25 at 03:10 +0000, Qiang Zhao wrote:
> On Wed, 2016-02-24 at 04:20  AM, Scott Wood wrote:
> > -----Original Message-----
> > From: Scott Wood [mailto:oss@buserror.net]
> > Sent: Wednesday, February 24, 2016 4:20 AM
> > To: Rob Herring <robh@kernel.org>; Qiang Zhao <qiang.zhao@nxp.com>
> > Cc: Yang-Leo Li <leoyang.li@nxp.com>; linux-kernel@vger.kernel.org;
> > devicetree@vger.kernel.org; linuxppc-dev@lists.ozlabs.org
> > Subject: Re: [PATCH v2 1/7] QE: Add IC, SI and SIRAM document to de=
vice
> > tree
> > bindings.
> >=20
> > On Tue, 2016-02-23 at 14:15 -0600, Rob Herring wrote:
> > > On Thu, Feb 18, 2016 at 09:06:06AM +0800, Zhao Qiang wrote:
> > > > Add IC, SI and SIRAM document of QE to
> > > > Documentation/devicetree/bindings/powerpc/fsl/cpm_qe/qe.txt
> > > >=20
> > > > Signed-off-by: Zhao Qiang <qiang.zhao@nxp.com>
> > > > ---
> > > > Changes for v2
> > > > 	- Add interrupt-controller in Required properties
> > > > 	- delete address-cells and size-cells for qe-si and qe-siram
> > > >=20
> > > >  .../devicetree/bindings/powerpc/fsl/cpm_qe/qe.txt  | 50
> > > > ++++++++++++++++++++++
> > > >  1 file changed, 50 insertions(+)
> > > >=20
> > > > diff --git
> > > > a/Documentation/devicetree/bindings/powerpc/fsl/cpm_qe/qe.txt
> > > > b/Documentation/devicetree/bindings/powerpc/fsl/cpm_qe/qe.txt
> > > > index 4f89302..84052a7 100644
> > > > --- a/Documentation/devicetree/bindings/powerpc/fsl/cpm_qe/qe.t=
xt
> > > > +++ b/Documentation/devicetree/bindings/powerpc/fsl/cpm_qe/qe.t=
xt
> > > > @@ -69,6 +69,56 @@ Example:
> > > >  	};
> > > >       };
> > > >=20
> > > > +* Interrupt Controller (IC)
> > > > +
> > > > +Required properties:
> > > > +- compatible : should be "fsl,qe-ic".
> > >=20
> > > > +- compatible : should be "fsl,qe-si".
> > >=20
> > > > +- compatible : should be "fsl,qe-siram".
> > >=20
> > > These compatible strings are all a bit generic and should have So=
C
> > > specific compatible strings.
> >=20
> > I don't know about si/siram, but "fsl,qe-ic" has been around since =
2008,
> > so it
> > should be documented even if a more specific compatible is also add=
ed.
>=20
> Agree, and si/siram are also has been around since 2008.

Where?  I couldn't find them when grepping.

> In addition, I don=E2=80=99t think it is needed to add specific compa=
tible, because
> they are
> the same in qe-supported soc.

How do we know that they are 100% the same?

-Scott
