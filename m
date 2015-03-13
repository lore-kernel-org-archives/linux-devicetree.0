From: Sebastian Reichel <sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [RFC 18/18] omap3isp: Deprecate platform data support
Date: Fri, 13 Mar 2015 10:40:50 +0100
Message-ID: <20150313094050.GB4980@earth>
References: <1425764475-27691-1-git-send-email-sakari.ailus@iki.fi>
 <1425764475-27691-19-git-send-email-sakari.ailus@iki.fi>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="DKU6Jbt7q3WqK7+M"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1425764475-27691-19-git-send-email-sakari.ailus-X3B1VOXEql0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org>
Cc: linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, pali.rohar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--DKU6Jbt7q3WqK7+M
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

[+CC Tony]

On Sat, Mar 07, 2015 at 11:41:15PM +0200, Sakari Ailus wrote:
> Print a warning when the driver is used with platform data. Existing
> platform data user should move to DT now.

I guess this should become a more visible warning on OMAP SoC level,
since platform data based boot will be deprecated completly.

-- Sebastian

--DKU6Jbt7q3WqK7+M
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJVArCiAAoJENju1/PIO/qajWcQAIUyn6rZcJXxf06NC5Vp2mLt
wa5wUTAd4OSWwkW7TeLKda1wSifSPrnADz0W33RbRsE0hsOBU7fWuaLIEjPEAg75
xZii4eXGaXqlpbsE3gGlpZ3Fgob4BZbCYQpVKlvmIVoDf9Hk0uxU3TzHRtvVwR1B
9d1E6MdadohcTLAF2m3tLjPT+FzT9B8DA4HifmhfgsCXK41HL3DYD9YXTazc75RO
updeqnWHr1wETwx4eE2vEsBEuu9CU2Xt36NT2MVun7nl3yFlkJHoTxZGZsRLVVyG
adONppE7PCYzbzpDzUel8O4wJPpJ+Yp/pcj8ZEbgbf8SSDQHvDY3UMjJ/V6vJnVZ
joy4gJCHRtdkhXQn/ELXGXThFsJzfWOiuiH2ha+SQY0e2fy07XtyxiUnw+v2yMWQ
PxRimxG6UllBZDVYkcR8CV/HummdPFoG9REaGkNF45Pxs9G6FH60YLsh0UqjBXqa
mWQssuXzbsy3sxNP9SForeSouFW822adIrlm6pq6yrvl4sjcR7Uy12exMqO1zidM
jIQlxIAMnxa6CQMtpJPbk4MnaBvNve3HQCQp+2WGf7JQwcDr/5VtQTswnfX+fO+Q
cn14gC84mOogQYMYvYSiIM+SB3P+XL0w8VCAou1lgkAQB9SXLz0Pnf09gys361Ts
qZLhl4/IlNTns6lyl3ha
=s1SH
-----END PGP SIGNATURE-----

--DKU6Jbt7q3WqK7+M--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
