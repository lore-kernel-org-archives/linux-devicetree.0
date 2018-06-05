From: "Y.b. Lu" <yangbo.lu@nxp.com>
Subject: RE: [PATCH 09/10] dpaa_eth: add support for hardware timestamping
Date: Tue, 5 Jun 2018 03:35:28 +0000
Message-ID: <DB6PR0401MB2536376432EC481473A5B4A3F8660@DB6PR0401MB2536.eurprd04.prod.outlook.com>
References: <20180604070837.19265-1-yangbo.lu@nxp.com>
 <20180604070837.19265-10-yangbo.lu@nxp.com>
 <20180604134920.ezhe6jz5ntpnqyzj@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180604134920.ezhe6jz5ntpnqyzj@localhost>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Richard Cochran <richardcochran@gmail.com>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>, Madalin-cristian Bucur <madalin.bucur@nxp.com>, Rob Herring <robh+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, "David S . Miller" <davem@davemloft.net>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Richard,

> -----Original Message-----
> From: Richard Cochran [mailto:richardcochran@gmail.com]
> Sent: Monday, June 4, 2018 9:49 PM
> To: Y.b. Lu <yangbo.lu@nxp.com>
> Cc: netdev@vger.kernel.org; Madalin-cristian Bucur
> <madalin.bucur@nxp.com>; Rob Herring <robh+dt@kernel.org>; Shawn Guo
> <shawnguo@kernel.org>; David S . Miller <davem@davemloft.net>;
> devicetree@vger.kernel.org; linuxppc-dev@lists.ozlabs.org;
> linux-arm-kernel@lists.infradead.org; linux-kernel@vger.kernel.org
> Subject: Re: [PATCH 09/10] dpaa_eth: add support for hardware timestampin=
g
>=20
> On Mon, Jun 04, 2018 at 03:08:36PM +0800, Yangbo Lu wrote:
>=20
> > +if FSL_DPAA_ETH
> > +config FSL_DPAA_ETH_TS
> > +	bool "DPAA hardware timestamping support"
> > +	select PTP_1588_CLOCK_QORIQ
> > +	default n
> > +	help
> > +	  Enable DPAA hardware timestamping support.
> > +	  This option is useful for applications to get
> > +	  hardware time stamps on the Ethernet packets
> > +	  using the SO_TIMESTAMPING API.
> > +endif
>=20
> You should drop this #ifdef.  In general, if a MAC supports time stamping=
 and
> PHC, then the driver support should simply be compiled in.
>=20
> [ When time stamping incurs a large run time performance penalty to
>   non-PTP users, then it might make sense to have a Kconfig option to
>   disable it, but that doesn't appear to be the case here. ]

[Y.b. Lu] Actually these timestamping codes affected DPAA networking perfor=
mance in our previous performance test.
That's why we used ifdef for it.

>=20
> > @@ -1615,6 +1635,24 @@ static int dpaa_eth_refill_bpools(struct
> dpaa_priv *priv)
> >  	skbh =3D (struct sk_buff **)phys_to_virt(addr);
> >  	skb =3D *skbh;
> >
> > +#ifdef CONFIG_FSL_DPAA_ETH_TS
> > +	if (priv->tx_tstamp &&
> > +	    skb_shinfo(skb)->tx_flags & SKBTX_HW_TSTAMP) {
>=20
> This condition fits on one line easily.

[Y.b. Lu] Right. I will use one line in next version.

>=20
> > +		struct skb_shared_hwtstamps shhwtstamps;
> > +		u64 ns;
>=20
> Local variables belong at the top of the function.

[Y.b. Lu] Ok, will move them to the top in next verison.

>=20
> > +		memset(&shhwtstamps, 0, sizeof(shhwtstamps));
> > +
> > +		if (!dpaa_get_tstamp_ns(priv->net_dev, &ns,
> > +					priv->mac_dev->port[TX],
> > +					(void *)skbh)) {
> > +			shhwtstamps.hwtstamp =3D ns_to_ktime(ns);
> > +			skb_tstamp_tx(skb, &shhwtstamps);
> > +		} else {
> > +			dev_warn(dev, "dpaa_get_tstamp_ns failed!\n");
> > +		}
> > +	}
> > +#endif
> >  	if (unlikely(qm_fd_get_format(fd) =3D=3D qm_fd_sg)) {
> >  		nr_frags =3D skb_shinfo(skb)->nr_frags;
> >  		dma_unmap_single(dev, addr, qm_fd_get_offset(fd) + @@ -2086,6
> > +2124,14 @@ static int dpaa_start_xmit(struct sk_buff *skb, struct
> net_device *net_dev)
> >  	if (unlikely(err < 0))
> >  		goto skb_to_fd_failed;
> >
> > +#ifdef CONFIG_FSL_DPAA_ETH_TS
> > +	if (priv->tx_tstamp &&
> > +	    skb_shinfo(skb)->tx_flags & SKBTX_HW_TSTAMP) {
>=20
> One line please.

[Y.b. Lu] No problem.

>=20
> > +		fd.cmd |=3D FM_FD_CMD_UPD;
> > +		skb_shinfo(skb)->tx_flags |=3D SKBTX_IN_PROGRESS;
> > +	}
> > +#endif
> > +
> >  	if (likely(dpaa_xmit(priv, percpu_stats, queue_mapping, &fd) =3D=3D 0=
))
> >  		return NETDEV_TX_OK;
> >
>=20
> Thanks,
> Richard
