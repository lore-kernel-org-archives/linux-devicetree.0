From: "Y.b. Lu" <yangbo.lu@nxp.com>
Subject: RE: [PATCH 3/3] ptp_qoriq: convert to use module parameters for
 initialization
Date: Wed, 1 Aug 2018 10:10:24 +0000
Message-ID: <DB6PR0401MB2536CE4BCEE872F2C4D63710F82D0@DB6PR0401MB2536.eurprd04.prod.outlook.com>
References: <20180730100154.27906-1-yangbo.lu@nxp.com>
 <20180730100154.27906-3-yangbo.lu@nxp.com>
 <20180730143043.qu66ttzwyjbw6si7@localhost>
 <DB6PR0401MB253643010802739AD55820F3F82D0@DB6PR0401MB2536.eurprd04.prod.outlook.com>
 <20180801061515.krn52iaq2kqdi3wo@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20180801061515.krn52iaq2kqdi3wo@localhost>
Content-Language: en-US
Sender: netdev-owner@vger.kernel.org
To: Richard Cochran <richardcochran@gmail.com>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>, Madalin-cristian Bucur <madalin.bucur@nxp.com>, Rob Herring <robh+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, "David S . Miller" <davem@davemloft.net>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Richard,

> -----Original Message-----
> From: Richard Cochran [mailto:richardcochran@gmail.com]
> Sent: Wednesday, August 1, 2018 2:15 PM
> To: Y.b. Lu <yangbo.lu@nxp.com>
> Cc: netdev@vger.kernel.org; Madalin-cristian Bucur
> <madalin.bucur@nxp.com>; Rob Herring <robh+dt@kernel.org>; Shawn Guo
> <shawnguo@kernel.org>; David S . Miller <davem@davemloft.net>;
> devicetree@vger.kernel.org; linuxppc-dev@lists.ozlabs.org;
> linux-arm-kernel@lists.infradead.org; linux-kernel@vger.kernel.org
> Subject: Re: [PATCH 3/3] ptp_qoriq: convert to use module parameters for
> initialization
>=20
> On Wed, Aug 01, 2018 at 04:36:40AM +0000, Y.b. Lu wrote:
>=20
> > Could I add a function to calculate a set of default register values
> > to initialize ptp timer when dts method failed to get required
> > properties in driver?
>=20
> Yes, it would be ideal if the driver can pick correct values automaticall=
y.
>=20
> However, the frequency on the FIPER outputs can't be configured
> automatically, and we don't have an API for the user to choose this.

[Y.b. Lu] Thanks a lot. Just let me send out the v2 patch for your reviewin=
g.

>=20
> > I think this will be useful. The ptp timer on new platforms (you may
> > see two dts patches in this patchset. Many platforms will be
> > affected.) will work without these dts properties. If user want
> > specific setting, they can set dts properties.
>=20
> Sure.
>=20
> Thanks,
> Richard
