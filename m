From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2.2 2/2] dt-bindings: Adding compatible attribute for
 SKY81452 regulator
Date: Sat, 6 Sep 2014 15:38:28 +0100
Message-ID: <20140906143828.GJ2601@sirena.org.uk>
References: <20140813190423.GI17528@sirena.org.uk>
 <1409539218-5571-1-git-send-email-jack.yoo@skyworksinc.com>
 <1409539218-5571-3-git-send-email-jack.yoo@skyworksinc.com>
 <20140901103158.GO29327@sirena.org.uk>
 <20140905015507.GA2636@jack-ThinkPad-T520>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ibvzjYYg+QDzMCy1"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140905015507.GA2636@jack-ThinkPad-T520>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Gyungoh Yoo <gyungoh-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Gyungoh Yoo <jack.yoo-tjhQNA90jdKqndwCJWfcng@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--ibvzjYYg+QDzMCy1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Sep 05, 2014 at 10:55:07AM +0900, Gyungoh Yoo wrote:
> On Mon, Sep 01, 2014 at 11:31:58AM +0100, Mark Brown wrote:

> > Why is this a good idea - can this driver be used for anything other
> > than a sky81452?

> Yes. There is a possibility that this driver will be used by similar
> device with SKY81452.

OK, so tha was slightly the wrong question.  What added information is
forcing the user to create a subnode and specify a compatible string
providing?  This driver is specifying a block of multiple regulators
with absolute register addresses hard coded into it, there's no real
ability to use the driver in a different configuration here.  As soon as
we see the parent device we already know everything there is to know
about the IP block, having a separate compatible string just forces the
user to do more typing for no gain.

--ibvzjYYg+QDzMCy1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBAgAGBQJUCxxgAAoJECTWi3JdVIfQcBYH/R2CS4T/GKxj2OQMNW2zJrC8
FdTwq6lavlnYlxzmwXiOF7+grWbxXil5oLxw3N/qRPN2c5Tu2XaNz2BG2MK6gIgY
jgBIvY7tOKxnVohjcf2GWn60EyCZDBws76Exs3MJlE1qAPZjIeTt+eh42IGHCdo7
/JnBWobjro77Q8zJpHkEj31kjHrSb97POZoqn9gMOhpmWVdfJr/qbb6GKiu5rwJj
Kg7eNszlJx/739Rs732ZgEzdiIWXQkLT8d22Q6hW4Dz9aUKnJxohhpcFaqsM/vn5
Hfd+LKavPdodU8l0Rv4N7XEXVj0iMMWK0SB/WwV9aY2XM0bMai2W/8ULfdWiZCA=
=ncGW
-----END PGP SIGNATURE-----

--ibvzjYYg+QDzMCy1--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
