From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/2] regulator: of: Added a property to indicate bypass
 mode support
Date: Thu, 20 Jun 2013 12:20:22 +0100
Message-ID: <20130620112022.GC27646@sirena.org.uk>
References: <1371717458-10307-1-git-send-email-kishon@ti.com>
 <1371717458-10307-2-git-send-email-kishon@ti.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5625010920571466935=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1371717458-10307-2-git-send-email-kishon-l0cyMroinI0@public.gmane.org>
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
To: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
Cc: swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ian-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org, ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, gg-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org


--===============5625010920571466935==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="IpbVkmxF4tDyP/Kb"
Content-Disposition: inline


--IpbVkmxF4tDyP/Kb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jun 20, 2013 at 02:07:37PM +0530, Kishon Vijay Abraham I wrote:
> Added a property to indicate if the regulator supports bypass mode.
> Also modified of_get_regulation_constraints() to check for that
> property and set appropriate constraints.

Applied, thanks.

--IpbVkmxF4tDyP/Kb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBAgAGBQJRwuVzAAoJELSic+t+oim93v8P/0BeY/xi7fRzCpxULHHkv580
uncSHR9Oo8CKeMBIdQVZJWtxF0h+RqdGhOs6i3V558FsC5qmrBduj6qK2lgl6LEt
r9t7KOFMxYCH/E8vDK7A0CeGFOp/YqSkr9d9iJRNbNH7nvO82fkIHSAoUYlpzGyS
bJHcahj3G086BOmxvwUj17YZCYLXQ2Padoem5htQo9V9KQLchbBhQEXXdu33s1gf
m8ChuigIM9L8w0WssNwsuHUf1J1dXgsRbDFPb5/AKU13O84oDCiBDYDNA2qVx6NZ
jNGKhnBA6DWP9By11zpC5CXkzumP4+OHi9qKurTnLPhfJGLD8azPRSqn6uuofd0p
cvuomUhdlWqRNPKwSim3A2gCNnJ5aA5QA3bSLBGE2IUANQJRXrB7xRfurlBarVcM
HGsJoTAkGRP4M+dDws/HazL4PGN+BGhLETL+IrKHwOtgD2vOoFaJJi7ZPCAwCqb1
eaIOWtucz3fvRVjZqE2aIADew6iT42wYelp/QxafjHaJADWPd0Wr+Ey95TrfljMK
nodCdS9dKDpyTSvmNcBjQIzHnAwXxiZpRQTRssH+v0mHUKi5w3HlypYbdJy2q6gI
YqXk0lEhNvv+mAMAHWw0hVkKycHLX0ofzLvo1IokJxWh0dpBvK1r+TiRY5UzHVKN
vSk7gNz9fWgSmkiEAyOd
=PgN1
-----END PGP SIGNATURE-----

--IpbVkmxF4tDyP/Kb--

--===============5625010920571466935==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============5625010920571466935==--
