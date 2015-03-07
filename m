From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 1/2] regulator: act8865: add input supply handling
Date: Sat, 7 Mar 2015 16:34:16 +0000
Message-ID: <20150307163416.GS28806@sirena.org.uk>
References: <1709506.shJhJsMxOa@phil>
 <20150307143922.GM28806@sirena.org.uk>
 <2033007.teD9r9y7xo@phil>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="tqSMaTz1cCSspCQ4"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <2033007.teD9r9y7xo@phil>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Zubair Lutfullah Kakakhel <Zubair.Kakakhel-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--tqSMaTz1cCSspCQ4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Mar 07, 2015 at 04:33:53PM +0100, Heiko Stuebner wrote:
> The act88600/act8846/act8865 regulators have a number of input supplies
> supplying the individual regulators. This may even be recursively like on
> most Rockchip boards using the act8846 where REG4 is most of the time
> connected to the inl1-supply.

Applied, thanks.  The recursive supplies are very common - DCDCs are
vastly more efficient than LDOs so if you've got the capacity and care
about power it's much better to drop your main supply voltage down to
something near the LDO headroom with a DCDC in order to improve system
performance.

--tqSMaTz1cCSspCQ4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJU+yiHAAoJECTWi3JdVIfQxo8H/jpemBX11o5Qf2mzYZQToU9s
vOvdMvt5uUPubOuXnb4XIRCPZt7BoU9j5oFbCeWr6lUs17DpiFargisxcPldJ0K7
9nxfnG4dBl5nzf/kZTNFzoENSLkDECwXSf8EBpBKEdvYzznkB78kfgBDHdYEwSLj
9Pyfgd9RPJ4IsIGv4fcxby+ovHaK8nQqwGkuuTymXpin4/kxkiohXx21aESYLACj
/Z+vtAXu3HtiJuXn8IdN++KCC8pq0K8nmop2YR/ipNF4EijCmIAQP3N1FUZvnE79
9uPlOuVZXUxis29IxtkIbQ6A69jFOw01EP4nDwIoGK2lYrMw9g+RpqcQ98TG/o0=
=ue8K
-----END PGP SIGNATURE-----

--tqSMaTz1cCSspCQ4--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
