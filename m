From: "Y.b. Lu" <yangbo.lu@nxp.com>
Subject: RE: [PATCH 5/5] MAINTAINERS: add myself as maintainer for QorIQ PTP
 clock driver
Date: Tue, 29 May 2018 03:57:16 +0000
Message-ID: <DB6PR0401MB253603A4BCE81F08557F9C0CF86D0@DB6PR0401MB2536.eurprd04.prod.outlook.com>
References: <20180525044038.37756-1-yangbo.lu@nxp.com>
        <20180525044038.37756-5-yangbo.lu@nxp.com>
 <20180528.230631.1400838711386498433.davem@davemloft.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180528.230631.1400838711386498433.davem@davemloft.net>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: David Miller <davem@davemloft.net>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "richardcochran@gmail.com" <richardcochran@gmail.com>, Claudiu Manoil <claudiu.manoil@nxp.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>
List-Id: devicetree@vger.kernel.org

Hi David,

> -----Original Message-----
> From: David Miller [mailto:davem@davemloft.net]
> Sent: Tuesday, May 29, 2018 11:07 AM
> To: Y.b. Lu <yangbo.lu@nxp.com>
> Cc: netdev@vger.kernel.org; devicetree@vger.kernel.org;
> linux-kernel@vger.kernel.org; richardcochran@gmail.com; Claudiu Manoil
> <claudiu.manoil@nxp.com>; robh+dt@kernel.org
> Subject: Re: [PATCH 5/5] MAINTAINERS: add myself as maintainer for QorIQ
> PTP clock driver
>=20
> From: Yangbo Lu <yangbo.lu@nxp.com>
> Date: Fri, 25 May 2018 12:40:38 +0800
>=20
> > Added myself as maintainer for QorIQ PTP clock driver.
> > Since gianfar_ptp.c was renamed to ptp_qoriq.c, let's also maintain it
> > under QorIQ PTP clock driver.
> >
> > Signed-off-by: Yangbo Lu <yangbo.lu@nxp.com>
>=20
> Because of the dependency on the staging tree changes, this doesn't apply
> cleanly to net-next.
>=20
> You'll have to figure out how you want to sort this out.

[Y.b. Lu] I sent out a v2 MAINTAINERS patch. I think it also makes sense to=
 drop dpaa2 rtc drivers in the entry.
Thanks a lot.
