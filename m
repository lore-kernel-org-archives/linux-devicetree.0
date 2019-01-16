From: Ioana Ciornei <ioana.ciornei@nxp.com>
Subject: RE: [PATCH 1/3] arm64: dts: add dpaa2-console node for DPAA2
 platforms
Date: Wed, 16 Jan 2019 17:31:46 +0000
Message-ID: <VI1PR0402MB2800477D1F1FE0E78F1D8D33E0820@VI1PR0402MB2800.eurprd04.prod.outlook.com>
References: <1545406240-3061-1-git-send-email-ioana.ciornei@nxp.com>
 <1545406240-3061-2-git-send-email-ioana.ciornei@nxp.com>
 <20190112024725.GO32649@dragon>
 <VI1PR0402MB2800E8F9F1884EB0669EE9F0E0820@VI1PR0402MB2800.eurprd04.prod.outlook.com>
 <20190116105559.GM15808@dragon>
 <VI1PR0402MB28007817A29E6116D1FAFC2BE0820@VI1PR0402MB2800.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <VI1PR0402MB28007817A29E6116D1FAFC2BE0820@VI1PR0402MB2800.eurprd04.prod.outlook.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Shawn Guo <shawnguo@kernel.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Ioana Ciocoi Radulescu <ruxandra.radulescu@nxp.com>, Roy Pledge <roy.pledge@nxp.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Leo Li <leoyang.li@nxp.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

> > Subject: Re: [PATCH 1/3] arm64: dts: add dpaa2-console node for DPAA2
> > platforms
> >
> > On Wed, Jan 16, 2019 at 10:02:01AM +0000, Ioana Ciornei wrote:
> > > > Subject: Re: [PATCH 1/3] arm64: dts: add dpaa2-console node for
> > > > DPAA2 platforms
> > > >
> > > > On Fri, Dec 21, 2018 at 03:31:09PM +0000, Ioana Ciornei wrote:
> > > > > Add the dpaa2-console device tree node for the following
> > > > > DPAA2 based platforms: LS1088A, LS2080A and LS2088A.
> > > > >
> > > > > Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
> > > >
> > > > DTS patch generally goes to the last in a series.
> > >
> > > Should I resend this with the DTS patch the last?
> >
> > You do not have to resend the series only for this.  It's pretty much
> > a suggestion for future posting.
>=20

One more thing, do you have any other feedback on the DTS part?
I think the best path for this patch set is through Leo's fsl soc tree but =
of course we need an ack from the DTS part also.

Thanks,
Ioana
