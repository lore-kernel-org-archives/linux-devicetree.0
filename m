From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/2] dt-bindings: regulator: Add regulator suspend state
 for PM state
Date: Mon, 9 Jun 2014 20:16:45 +0100
Message-ID: <20140609191645.GC5099@sirena.org.uk>
References: <1402309780-8118-1-git-send-email-cw00.choi@samsung.com>
 <1402309780-8118-3-git-send-email-cw00.choi@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="vUOrpVjU9N5sOsWB"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1402309780-8118-3-git-send-email-cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, myungjoo.ham-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--vUOrpVjU9N5sOsWB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jun 09, 2014 at 07:29:40PM +0900, Chanwoo Choi wrote:

> +- regulator-initial-state: initial state for suspend state
> +- regulator-state-[standby/mem/disk] sub-root node for suspend state
> +	regulator-volt: voltage consumers may set in suspend state
> +	regulator-mode: voltage mode in suspend state
> +	regulator-on-in-suspend: regulator should be on in suspend state
> +	regulator-off-in-suspend: regulator should be off in suspend state

These need to define what the states are in general terms - in
particular it's very unclear what standby is and how it differs from
suspend to RAM.  You also need to define what happens if neither
X-in-suspend property is set.

> +		regulator-state-mem {
> +			regulator-volt = <1000000>;
> +			regulator-mode = <0x8>;
> +			regulator-off-in-suspend;
> +		};

Probably best to remove mode from this.

--vUOrpVjU9N5sOsWB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJTlggaAAoJELSic+t+oim9TF0P+wX+yll+5iSqe6ERYk7eTmD4
n8JY1dUtsVF0OFVQUVBC30jKUMz2DXUqXDpMQ1rPtDtMt9qmWq0Wcys5ZH+o/AqV
r2ME3E8zkE15YfUYYz24w1xAZvFUDJfGs/xgnBEpXeH9TjbuxkDxb975xyxLQ3M+
DBrwRyO8EDfsP3nR74Rl26x6admlGxlbC7Bj/TpXiVc6gTO67s3bywXT1HsOD00y
SIpm1bPbjd5IuIfRBW8aoysHgBY91DvkNk9wnTwOTTh07rqZgoCvcaV7vAdb0LHu
b0DsJi9YGphHTHYc3jyvWI09XPtDntDjojAvGONe4LyErwJ3AushFMEqgnfu+8wp
T3Ci0MQHSEkU1fRUV6Nwk0/R67vh4JBzPaufUdhSxXG/1HD0pskTmIl3jYLEIqU9
9ooGrqDYfACezkMrhHOXy+zk/P+gjvNqMAeUzlZjBxKYRmP/oJ/bin7pAjFryg9a
NpuRQvlD3GXHzaO+4/UqcXsvsw54E/QBy5B4i5co4WvnONInMw3p45oLWcBdCKpO
9b30fwI1Y76HWPn9jkNd5Xt52dIX96deDMF8Y5wz67Pi7BUDoBFZND6I6G5IhsAk
bjO2vyTNN03EMv4fv7R/gmSifyF4YKKjz6WVaO7cPWXXsdGxWVrRzylJTX/zOafU
4Jug78WpTouy7CvlMtJ1
=Du7p
-----END PGP SIGNATURE-----

--vUOrpVjU9N5sOsWB--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
