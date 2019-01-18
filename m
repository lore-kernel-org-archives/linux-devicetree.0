From: "Y.b. Lu" <yangbo.lu@nxp.com>
Subject: RE: [v2, 5/5] ptp_qoriq: add fiper pulse loopback support
Date: Fri, 18 Jan 2019 08:11:58 +0000
Message-ID: <VI1PR0401MB2237C5DAA0FE89689B470751F89C0@VI1PR0401MB2237.eurprd04.prod.outlook.com>
References: <20190117014936.48117-1-yangbo.lu@nxp.com>
 <20190117014936.48117-6-yangbo.lu@nxp.com>
 <20190118014420.rlyk36477cqj6yb7@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190118014420.rlyk36477cqj6yb7@localhost>
Content-Language: en-US
Sender: netdev-owner@vger.kernel.org
To: Richard Cochran <richardcochran@gmail.com>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "David S . Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>
List-Id: devicetree@vger.kernel.org

Hi,

> -----Original Message-----
> From: Richard Cochran <richardcochran@gmail.com>
> Sent: Friday, January 18, 2019 9:44 AM
> To: Y.b. Lu <yangbo.lu@nxp.com>
> Cc: netdev@vger.kernel.org; devicetree@vger.kernel.org;
> linux-arm-kernel@lists.infradead.org; David S . Miller <davem@davemloft.n=
et>;
> Rob Herring <robh+dt@kernel.org>; Shawn Guo <shawnguo@kernel.org>
> Subject: Re: [v2, 5/5] ptp_qoriq: add fiper pulse loopback support
>=20
> On Thu, Jan 17, 2019 at 09:49:36AM +0800, Yangbo Lu wrote:
> > This patch is to add Kconfig options to support fiper pulse loopback
> > mode. This is very useful for validating hardware and driver without
> > external hardware.
>=20
> To me this feature makes more sense as a debugf-fs option.

[Y.b. Lu] Let me try debug-fs and update the patch-set.
Thanks for your suggestion.

>=20
> Thanks,
> Richard
