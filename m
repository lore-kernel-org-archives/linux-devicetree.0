From: "Westergreen, Dalon" <dalon.westergreen@intel.com>
Subject: Re: [PATCH v2 net-next 08/10] net: eth: altera: add support for ptp
 and timestamping
Date: Wed, 19 Dec 2018 19:27:53 +0000
Message-ID: <b7684912d093c7fc94448487e670646e694b17d3.camel@intel.com>
References: <20181213175252.21143-1-dalon.westergreen@linux.intel.com>
         <20181213175252.21143-9-dalon.westergreen@linux.intel.com>
         <20181219042757.vhetz2zsrpsz6p3u@localhost>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=sha-1;
        protocol="application/x-pkcs7-signature"; boundary="=-K03pDXNO4MPmMNVEFLiv"
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20181219042757.vhetz2zsrpsz6p3u@localhost>
Content-Language: en-US
Sender: netdev-owner@vger.kernel.org
To: "richardcochran@gmail.com" <richardcochran@gmail.com>
Cc: "Ong, Hean Loong" <hean.loong.ong@intel.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "thor.thayer@linux.intel.com" <thor.thayer@linux.intel.com>, "dinguyen@kernel.org" <dinguyen@kernel.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "vbridger@opensource.altera.com" <vbridger@opensource.altera.com>, "davem@davemloft.net" <davem@davemloft.net>
List-Id: devicetree@vger.kernel.org

--=-K03pDXNO4MPmMNVEFLiv
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Richard,

On Tue, 2018-12-18 at 20:27 -0800, Richard Cochran wrote:
> On Thu, Dec 13, 2018 at 09:52:50AM -0800, dwesterg@gmail.com wrote:
> > Changes from V1:
> >  -> Remove debugfs for tod manipulation
> >  -> Reorder variable declarations in functions to order
> >     by length of declaration, largest to smallest
> >  -> Rename altera_ptp to intel_fpga_tod
> >  -> Rename functions in intel_fpga_tod so that they are not
> >     generic
> >  -> Use imply instead of select in Kconfig
> >  -> Re-write adjust time function to remove while loop with
> >     64 bit divide.
>=20
> Overall this is looking better.  A few more comments follow...

Thanks, all of your comments will be included in a v3 patch.

--dalon

>=20
> > +static int tse_get_ts_info(struct net_device *dev,
> > +			   struct ethtool_ts_info *info)
> > +{
> > +	struct altera_tse_private *priv =3D netdev_priv(dev);
> > +
> > +	if (priv->ptp_enable) {
> > +		if (priv->ptp_priv.ptp_clock)
> > +			info->phc_index =3D
> > +				ptp_clock_index(priv->ptp_priv.ptp_clock);
>=20
> else
> info->phc_index =3D -1;
>=20


> > +		info->so_timestamping =3D SOF_TIMESTAMPING_TX_HARDWARE |
> > +					SOF_TIMESTAMPING_RX_HARDWARE |
> > +					SOF_TIMESTAMPING_RAW_HARDWARE;
> > +
> > +		info->tx_types =3D (1 << HWTSTAMP_TX_OFF) |
> > +						 (1 << HWTSTAMP_TX_ON);
>=20
> This fits on one line ^^^
>=20
> > +		info->rx_filters =3D (1 << HWTSTAMP_FILTER_NONE) |
> > +						   (1 << HWTSTAMP_FILTER_ALL);
>=20
> Funky indentation here.  One extra level is enough:
>=20
> 		info->rx_filters =3D (1 << HWTSTAMP_FILTER_NONE) |
> 			(1 << HWTSTAMP_FILTER_ALL);
>=20
> > +		return 0;
> > +	} else {
> > +		return ethtool_op_get_ts_info(dev, info);
> > +	}
> > +}
> > +
>=20
> ...
>=20
> > @@ -609,7 +613,14 @@ static netdev_tx_t tse_start_xmit(struct sk_buff *=
skb,
> > struct net_device *dev)
> >  	if (ret)
> >  		goto out;
> > =20
> > -	skb_tx_timestamp(skb);
> > +	/* Provide a hardware time stamp if requested.
> > +	 */
> > +	if (unlikely((skb_shinfo(skb)->tx_flags & SKBTX_HW_TSTAMP) &&
> > +		     priv->hwts_tx_en))
> > +		/* declare that device is doing timestamping */
>=20
> Please drop those two comments.  They are redundant because they only
> restate what the code does.
>=20
> > +		skb_shinfo(skb)->tx_flags |=3D SKBTX_IN_PROGRESS;
> > +	else
> > +		skb_tx_timestamp(skb);
> > =20
> >  	priv->tx_prod++;
> >  	dev->stats.tx_bytes +=3D skb->len;
>=20
> Thanks,
> Richard

--=-K03pDXNO4MPmMNVEFLiv
Content-Type: application/x-pkcs7-signature; name="smime.p7s"
Content-Disposition: attachment; filename="smime.p7s"
Content-Transfer-Encoding: base64

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
liuz1xLCrs3Xat4U3Z6uBcvumwdumQgDjHLPO3sVTs0vb7H4IjdLj/8mqR479cKThzVGWGBF3gj9
OJcCAwEAAaOCAjkwggI1MB0GA1UdDgQWBBQLYGeMh1f+Myljxk1HiDpjOL16kzAfBgNVHSMEGDAW
gBQeaSq03Cj+RxhOIQs/vKwRL/CY9TBlBgNVHR8EXjBcMFqgWKBWhlRodHRwOi8vd3d3LmludGVs
LmNvbS9yZXBvc2l0b3J5L0NSTC9JbnRlbCUyMEV4dGVybmFsJTIwQmFzaWMlMjBJc3N1aW5nJTIw
Q0ElMjA0QS5jcmwwgZ8GCCsGAQUFBwEBBIGSMIGPMGkGCCsGAQUFBzAChl1odHRwOi8vd3d3Lmlu
dGVsLmNvbS9yZXBvc2l0b3J5L2NlcnRpZmljYXRlcy9JbnRlbCUyMEV4dGVybmFsJTIwQmFzaWMl
MjBJc3N1aW5nJTIwQ0ElMjA0QS5jcnQwIgYIKwYBBQUHMAGGFmh0dHA6Ly9vY3NwLmludGVsLmNv
bS8wCwYDVR0PBAQDAgeAMDwGCSsGAQQBgjcVBwQvMC0GJSsGAQQBgjcVCIbDjHWEmeVRg/2BKIWO
n1OCkcAJZ4HevTmV8EMCAWQCAQkwHwYDVR0lBBgwFgYIKwYBBQUHAwQGCisGAQQBgjcKAwwwKQYJ
KwYBBAGCNxUKBBwwGjAKBggrBgEFBQcDBDAMBgorBgEEAYI3CgMMMFMGA1UdEQRMMEqgKwYKKwYB
BAGCNxQCA6AdDBtkYWxvbi53ZXN0ZXJncmVlbkBpbnRlbC5jb22BG2RhbG9uLndlc3RlcmdyZWVu
QGludGVsLmNvbTANBgkqhkiG9w0BAQUFAAOCAQEALbZP/Q2mwwdd3dqvCmfSPu+TAVQxVzvu4A3d
yUKjbDfmoJjQFiQFHCFkBr4McicLwClimgK9aHXm7Wp7D2w6QuWwjrnVOWpa9XrFYw3gqFCAotMA
Qkoe2Mn82ToU/vUt6YvvQqg1EBWBuObcFp7ycy9YtQ2ghmdULH/WBrQpZwkU7Xj42kWeZJSCBkaX
vLwzycBJEtLnEiN6ESnqHwDz9PZzZqxzWGb+FrRlF1x7ppkZxJwyh+i7opNKSEo60pB53XZOrPk4
jDCDhXctNoRdxsLpFnvfxZnczp0twQ+8/KUDzBrPhQkzrORJhiHxPseLCIYyOYM5AS3YTaDq7WIy
NDGCAhcwggITAgEBMIGQMHkxCzAJBgNVBAYTAlVTMQswCQYDVQQIEwJDQTEUMBIGA1UEBxMLU2Fu
dGEgQ2xhcmExGjAYBgNVBAoTEUludGVsIENvcnBvcmF0aW9uMSswKQYDVQQDEyJJbnRlbCBFeHRl
cm5hbCBCYXNpYyBJc3N1aW5nIENBIDRBAhMzAADIOv7OOBoXahnpAAAAAMg6MAkGBSsOAwIaBQCg
XTAYBgkqhkiG9w0BCQMxCwYJKoZIhvcNAQcBMBwGCSqGSIb3DQEJBTEPFw0xODEyMTkxOTI3NTFa
MCMGCSqGSIb3DQEJBDEWBBR9E7Q4VfwD/6fQT6KKaiJ6SMUTODANBgkqhkiG9w0BAQEFAASCAQAl
RMsKY01rQlJqOVv+TDSp0McXf6pgaGU291AlZoL66wca3iKiVi/1WJWYMxtBWY5iroYeLbBjptHL
ztGnAdBnxeFqyzFs1LHPo7vEszdDZtTN13FoQ8HnsmHEDdU4pXGtBEWTRbUD1XKZkuhLbMsOuTpF
NRpzwv/YYJQYZokN1u5AHNm5zgYqlcrOh27CYMwTN17P4FeGsdvC+gA6nS5TNZKESxLbfbwM4VOF
Ib/wdFCBehPWwSsLwV7UOk0X+n+3YvqA0SDX1vUBqPcLpIeLnwVZOaAnUQrYwrlkLc7EPjMe2unF
J6QLtSxgD3jnQD3HYLOjifENnOQJZOXa/nY/AAAAAAAA


--=-K03pDXNO4MPmMNVEFLiv--
