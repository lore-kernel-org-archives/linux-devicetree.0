From: "Y.b. Lu" <yangbo.lu@nxp.com>
Subject: RE: [v2, 0/9] Add ENETC PTP clock driver
Date: Tue, 12 Feb 2019 04:02:32 +0000
Message-ID: <VI1PR0401MB223780B31DA0DE1A69B5A221F8650@VI1PR0401MB2237.eurprd04.prod.outlook.com>
References: <20190202025707.10794-1-yangbo.lu@nxp.com>
        <20190203.113921.1847323007238920901.davem@davemloft.net>
 <20190203.121144.623666032377925349.davem@davemloft.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190203.121144.623666032377925349.davem@davemloft.net>
Content-Language: en-US
Sender: netdev-owner@vger.kernel.org
To: David Miller <davem@davemloft.net>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "richardcochran@gmail.com" <richardcochran@gmail.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, Claudiu Manoil <claudiu.manoil@nxp.com>
List-Id: devicetree@vger.kernel.org

Hi David,

> -----Original Message-----
> From: David Miller <davem@davemloft.net>
> Sent: Monday, February 4, 2019 4:12 AM
> To: Y.b. Lu <yangbo.lu@nxp.com>
> Cc: netdev@vger.kernel.org; devicetree@vger.kernel.org;
> richardcochran@gmail.com; robh+dt@kernel.org; Claudiu Manoil
> <claudiu.manoil@nxp.com>
> Subject: Re: [v2, 0/9] Add ENETC PTP clock driver
>=20
> From: David Miller <davem@davemloft.net>
> Date: Sun, 03 Feb 2019 11:39:21 -0800 (PST)
>=20
> > From: Yangbo Lu <yangbo.lu@nxp.com>
> > Date: Sat,  2 Feb 2019 10:56:58 +0800
> >
> >> There is same QorIQ 1588 timer IP block on the new ENETC Ethernet
> >> controller with eTSEC/DPAA Ethernet controllers. However it's
> >> different endianness (little-endian) and using PCI driver.
> >>
> >> To support ENETC PTP driver, ptp_qoriq driver needed to be reworked
> >> to make functions global for reusing, to add little- endian support,
> >> to add ENETC memory map support, and to add ENETC dependency for
> >> ptp_qoriq driver.
> >>
> >> In addition, although ENETC PTP driver is a PCI driver, the dts node
> >> still could be used. Currently the ls1028a dtsi which is the only
> >> platform by now using ENETC is not complete, so there is still
> >> dependency for ENETC PTP node upstreaming. This will be done in the
> >> near future. The hardware timestamping support for ENETC is done but
> >> needs to be reworked with new method in internal git tree, and will
> >> be sent out soon.
> >
> > Series applied.
>=20
> Once AGAIN, I had to revert:
>=20
> [davem@localhost net-next]$ make -s -j8
> ERROR: "ptp_qoriq_remove_debugfs"
> [drivers/net/ethernet/freescale/enetc/fsl-enetc-ptp.ko] undefined!
> make[1]: *** [scripts/Makefile.modpost:92: __modpost] Error 1
> make: *** [Makefile:1262: modules] Error 2
>=20
> Please do an allmodconfig build and don't resubmit this until it all pass=
es.

[Y.b. Lu] Oh.. Sorry for the trouble.
Just come back from Chinese Spring Festival holiday. Let me fix the issue a=
nd send out new version after testing.

Thanks a lot for your patience :)

>=20
> Thank you.
