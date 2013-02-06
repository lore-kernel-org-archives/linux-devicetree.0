From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 7/8] Remove fdtdump and use fdtgrep instead
Date: Wed, 6 Feb 2013 18:16:06 +1100
Message-ID: <20130206071606.GR821@truffula.fritz.box>
References: <1358801962-21707-1-git-send-email-sjg@chromium.org>
 <1358801962-21707-8-git-send-email-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8702140748175168703=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1358801962-21707-8-git-send-email-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--===============8702140748175168703==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="4NNqsQ/a67jpuySk"
Content-Disposition: inline


--4NNqsQ/a67jpuySk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 21, 2013 at 12:59:21PM -0800, Simon Glass wrote:
> Since fdtgrep does everything that fdtdump does now, perhaps we should
> replace it with a symlink.

Nack.  The point of fdtdump is not simply to be a tool for dumping
device trees - dtc -I dtb -O dts will do that already.  The point is
to be a really simple, independent implementation of dumping the tree,
which can be used for analyzing bugs in the more complex tools.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--4NNqsQ/a67jpuySk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlESAzYACgkQaILKxv3ab8ZM+ACgjCC2dHV6F9qXgZy5GXkOl3Of
2VIAoIj/MyTeKfCi/xSM+P1KWH6YGuGw
=VOB8
-----END PGP SIGNATURE-----

--4NNqsQ/a67jpuySk--

--===============8702140748175168703==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============8702140748175168703==--
