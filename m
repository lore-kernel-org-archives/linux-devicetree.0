From: Nava kishore Manne <navam@xilinx.com>
Subject: RE: [RFC PATCH v3 2/3] dt-bindings: reset: Add bindings for ZynqMP
 reset driver
Date: Mon, 17 Sep 2018 09:09:45 +0000
Message-ID: <BYAPR02MB471009755B88F55A97DA5694C21E0@BYAPR02MB4710.namprd02.prod.outlook.com>
References: <1536131342-28041-1-git-send-email-nava.manne@xilinx.com>
 <1536131342-28041-3-git-send-email-nava.manne@xilinx.com>
 <20180910201224.GA31501@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180910201224.GA31501@bogus>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, Michal Simek <michals@xilinx.com>, "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, Rajan Vaja <RAJANV@xilinx.com>, Jolly Shah <JOLLYS@xilinx.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Rob,

Thanks for providing the comments...
Please find my response inline.

> -----Original Message-----
> From: Rob Herring [mailto:robh@kernel.org]
> Sent: Tuesday, September 11, 2018 1:42 AM
> To: Nava kishore Manne <navam@xilinx.com>
> Cc: mark.rutland@arm.com; Michal Simek <michals@xilinx.com>;
> p.zabel@pengutronix.de; Rajan Vaja <RAJANV@xilinx.com>; Jolly Shah
> <JOLLYS@xilinx.com>; devicetree@vger.kernel.org; linux-arm-
> kernel@lists.infradead.org; linux-kernel@vger.kernel.org
> Subject: Re: [RFC PATCH v3 2/3] dt-bindings: reset: Add bindings for Zynq=
MP
> reset driver
>=20
> On Wed, Sep 05, 2018 at 12:39:01PM +0530, Nava kishore Manne wrote:
> > Add documentation to describe Xilinx ZynqMP reset driver bindings.
> >
> > Signed-off-by: Nava kishore Manne <nava.manne@xilinx.com>
> > ---
> > Changes for v3:
> > 		-Corrected Commit Msg.
> > Changes for v2:
> > 		-Moved reset node as a child to firwmare
> > 		 node.
>=20
> Why? There's no reason for that. The parent can be multiple providers.
> You only need child nodes if the sub functions have their own DT resource=
s.
>=20

This driver having a dependency on firmware. So I have moved this node as a=
 child to firmware
As per other drivers which is using this firmware interface=20
https://lkml.org/lkml/2018/8/14/432=20
I didn't get your comment could you please elaborate more???=20
Did you mean I should move the changes in the file to Documentation/devicet=
ree/bindings/reset/ ???

Regards,
Navakishore.
