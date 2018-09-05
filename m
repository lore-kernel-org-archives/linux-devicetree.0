From: Ran Wang <ran.wang_1@nxp.com>
Subject: RE: [PATCH 2/3] Documentation: dt: binding: fsl: update property
 description for RCPM
Date: Wed, 5 Sep 2018 02:22:55 +0000
Message-ID: <AM5PR0402MB28659BF8C2B5B3B18DB6BAC9F1020@AM5PR0402MB2865.eurprd04.prod.outlook.com>
References: <20180831035219.31619-1-ran.wang_1@nxp.com>
 <20180831035219.31619-2-ran.wang_1@nxp.com>
 <5b8e8a71.1c69fb81.d966f.1ca1@mx.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5b8e8a71.1c69fb81.d966f.1ca1@mx.google.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Leo Li <leoyang.li@nxp.com>, Mark Rutland <mark.rutland@arm.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Rob

> -----Original Message-----
> From: Rob Herring <robh@kernel.org>
> Sent: Tuesday, September 04, 2018 09:25
> To: Ran Wang <ran.wang_1@nxp.com>
> Cc: Leo Li <leoyang.li@nxp.com>; Mark Rutland <mark.rutland@arm.com>;
> linuxppc-dev@lists.ozlabs.org; linux-arm-kernel@lists.infradead.org;
> devicetree@vger.kernel.org; linux-kernel@vger.kernel.org
> Subject: Re: [PATCH 2/3] Documentation: dt: binding: fsl: update property
> description for RCPM
>=20
> On Fri, Aug 31, 2018 at 11:52:18AM +0800, Ran Wang wrote:
> > Add property 'big-endian' and supportted IP's configuration info.
> > Remove property 'fsl,#rcpm-wakeup-cell'.
>=20
> "dt-bindings: soc: ..." for the subject
>=20
> It is obvious reading the diff you are removing fsl,#rcpm-wakeup-cell.
> What is not obvious is why? The commit msg should answer that.

Sure, I will add this in next version patch.

> You also are mixing several things in this patch like adding ls1012 which=
 you
> don't mention. Please split.

Got it, will split them and add more information in next version.
=20
Ran
> >
> > Signed-off-by: Ran Wang <ran.wang_1@nxp.com>
> > ---
> >  Documentation/devicetree/bindings/soc/fsl/rcpm.txt |   42 ++++++------=
-----
> --
> >  1 files changed, 13 insertions(+), 29 deletions(-)
