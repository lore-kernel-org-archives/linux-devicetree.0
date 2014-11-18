From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [RESUBMIT PATCH v7 7/9] regulator: sky81452: Modify Device Tree
 structure
Date: Tue, 18 Nov 2014 11:20:56 +0000
Message-ID: <20141118112056.GA14734@sirena.org.uk>
References: <1416213190-20935-1-git-send-email-jack.yoo@skyworksinc.com>
 <1416213190-20935-8-git-send-email-jack.yoo@skyworksinc.com>
 <20141117141836.GA2722@sirena.org.uk>
 <20141118080451.GA3319@jack-ThinkPad-T520>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="zYM0uCDKw75PZbzx"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20141118080451.GA3319@jack-ThinkPad-T520>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Gyungoh Yoo <gyungoh-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, cooloney-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jack.yoo-tjhQNA90jdKqndwCJWfcng@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org, shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org, treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, florian.vaussard-p8DiymsW2f8@public.gmane.org, trivial-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org, andrew-g2DYL2Zd6BY@public.gmane.org, jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org


--zYM0uCDKw75PZbzx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Nov 18, 2014 at 05:04:51PM +0900, Gyungoh Yoo wrote:
> On Mon, Nov 17, 2014 at 02:18:36PM +0000, Mark Brown wrote:

> > Don't open code this, use regulators_node and of_match as previously
> > advised.

> I think I had a misunderstanding.
> But I have no idea about regulators_node and of_match.
> Could you let me know more about them?

They are fields in regulator_desc, there are documentation and examples
in current mainline - take a look at that and ask questions if it is
unclear.

--zYM0uCDKw75PZbzx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBAgAGBQJUayuXAAoJECTWi3JdVIfQaI4H/18xMT7GlZXmWY/mB6VXNSAZ
j9t+XEI2DhBIdebvpsIftI1e/aOA4j/FU0LAPhXxQNBza5+Ty1HmbeazGQfOdfsZ
8At5veBZ4kblIg+JhdRHdvBwD3EFGFqMnDrR5nQOqFoOuD7JfMb6mi8fVsxkRiFk
1mU1X9Xr/eS/mqG9A6JmevR/hwoN5ts4vY/vVQHWXAJquw1ADW1H9BbxYgZKx4xr
gOkNG4+kdrolzf1Gi3zPkWZTS2t0A99Fiji/IDYeXcpnQxCK2IDJ8VO2dvHdEzJO
TqxBGHO2DMibo7PkvsW0siWi4fm3Y2iRXsWFayVbmHbJEvUuhQCv9iPcTiMYCOA=
=K0/E
-----END PGP SIGNATURE-----

--zYM0uCDKw75PZbzx--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
