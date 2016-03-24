From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 0/2] ARM: sunxi: dt: Add missing DRAM gate clock for
 simplefb TV output
Date: Thu, 24 Mar 2016 20:58:23 +0100
Message-ID: <20160324195823.GB30977@lukather>
References: <1458849137-3883-1-git-send-email-plaes@plaes.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="9x5Nt6l8xCrbPDaP"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1458849137-3883-1-git-send-email-plaes-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Priit Laes <plaes-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--9x5Nt6l8xCrbPDaP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 24, 2016 at 09:52:15PM +0200, Priit Laes wrote:
> DRAM gating driver commit for sun[47]i seems to be missing DRAM gate bit =
5 for
> simplefb TV output node. Add it.

Applied both, thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--9x5Nt6l8xCrbPDaP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJW9EbfAAoJEBx+YmzsjxAgfmwP/3W3tW7HsO9KOP5rktpkENvN
7kwwBBZcCxQUCKyeOUQQ7Icxbyh+myUJ7FeL4sowM4KSGYO2iZB8tLV8inhgVbSI
vc0cEwW9FElmBpO2WfgpPC3Y7pfsyCaXGZCw6/9o2RcjrRkCM6lkiB194ik82wHT
n/B46YXiMxric3sVfBax1X6aoTldV8cECdic0zz9ifkzdexmte5FMImFSWSTYyOF
xEOFxeliC51Did+vqaCEfUd1ea1o769tsVWe2hR/eG8OFq+KcZeBJznstWXnWOJ7
GfBiPCq9AqKHMqf4EYWd049JPUeifdk7LO8yjBIlQZpNSPXTdPd4ryXRvqYOznAh
2VRTOMW9B1Btwai3TkeIoxIcvTDwJkYg8dR2DDzvcS+TYaYzecxoGxfUOO0vQUpA
umfIqUTRRDcUhuRzuURT+Y0mJO8Vse3Vlo8iXAowlEMuVSBTaaUns+Qr+mIU3fxt
g6vr123TCVmrpgvCLsOqG9Wmup8sTX7knAV3WUOFrDX8KMolU738T48SCmEISyFK
QQRR20e0WxtZpuTwfDe5ia6QaBNwPC6Kg2eiuJqg/bZhSlum0MpBHBKhcAsvnn4/
f3lm18UhyzLvATBYoI3s3AA8E+Q4Kis7GelX3RtCcNcUMHfs3GUa9lkebtsy2myV
fO/MNc8INn+DyAtTWC2H
=pf+h
-----END PGP SIGNATURE-----

--9x5Nt6l8xCrbPDaP--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
