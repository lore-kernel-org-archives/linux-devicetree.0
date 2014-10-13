From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 7/7] ARM: dts: sun6i: Add required ahb1 clock parent
 and rates for dma controller
Date: Mon, 13 Oct 2014 12:02:38 +0200
Message-ID: <20141013100238.GV19438@lukather>
References: <1411807795-6575-1-git-send-email-wens@csie.org>
 <1411807795-6575-8-git-send-email-wens@csie.org>
 <20140930155533.GP4081@lukather>
 <CAGb2v64TE=gzPdFJwfmJfpwWZcsdZQGONh11SawfBXZkWGFKCg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="xi8lRpXYeGgNnUjs"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAGb2v64TE=gzPdFJwfmJfpwWZcsdZQGONh11SawfBXZkWGFKCg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Emilio Lopez <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Tomeu Vizoso <tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--xi8lRpXYeGgNnUjs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 09, 2014 at 11:01:02AM +0800, Chen-Yu Tsai wrote:
> Hi, Mike,
>=20
> Is there a recommended way for clock providers to enforce a range
> on clock rates? Tomeu's patches seem to be for clock consumers.

We discussed that in the past with Mike, and his answer at the time
was that every driver should implement that, which I did some time
ago.

However, it was before Tomeu patches, that indeed enforce constraints
at the consumer level, but I'm pretty confident we could add some
provider-side constraints quite easily.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--xi8lRpXYeGgNnUjs
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJUO6M+AAoJEBx+YmzsjxAg7zoP+wYOp8boOZew4Z02I66TFeu/
CTkoFaPVTwqewjkTI5X1OvyyDlC3s3smH+DWUtja1aOZVp47hGJ0jduOGG3ZmJUl
Iw+iD3r6XZu1sMniWaiXR5sMd7CiqtGzUkmWGgo6AeEpM6sQicvex7CfvhDXXuI2
qxj02mCbnGOvJlrrwCmIg7bj4xr9iEUVnMvHSDX55UPy58VLdP5rVByrXAaAEmkS
A1hD218/KRXf+rr1cpE0czC5RlzBJXkf1zt6V/YyZfPktRwJdC1sUBO+Ss9Y6lOp
qj4Z92mh5SrYaZsZeB9qsg69ksQ/XmPmwj8xWE16X/rBur3uPDjnEO/rPmvvATvh
cBVI/Mhu3HpRdnVSjW+lfA/ZeyyQryG6OguhafTTbziiyMKCvIdaVLiloRhtqBJG
MxlP1dPeUPiJIxkF7967PZI4PkMJzn3N9LQWCayfu4hllgkcYRL3+RKprm/0Oyth
U+X0dlhZFlseSfRp1K7mWZnpbSLgml0vo/v7lrT2oyDoAIAPThFHdPiZfPyA3ew2
6jBK3agMjYQVPF9JAu59N3fRMheSxV3mF6OKdN1dyEwuG7F1Zj1ywDuvcAbT0RwR
CKZ7eigGvSPnTjocIBqtSfYIRDY3Jbw/Raho1PCbPO2ixbY526fcHat+mS/QBney
nOluxy3gVl7fQDB1O1YI
=CYcF
-----END PGP SIGNATURE-----

--xi8lRpXYeGgNnUjs--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
