From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] drm/panel: Add support for Chungwa CLAA101WA01A panel
Date: Wed, 8 Jan 2014 16:15:49 +0100
Message-ID: <20140108151548.GD21974@ulmo.nvidia.com>
References: <1389138386-4618-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1590846161=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1389138386-4618-1-git-send-email-swarren@wwwdotorg.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: devicetree@vger.kernel.org, Thierry Reding <treding@nvidia.com>, Stephen Warren <swarren@nvidia.com>, dri-devel@lists.freedesktop.org
List-Id: devicetree@vger.kernel.org


--===============1590846161==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="bajzpZikUji1w+G9"
Content-Disposition: inline


--bajzpZikUji1w+G9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 07, 2014 at 04:46:26PM -0700, Stephen Warren wrote:
> From: Stephen Warren <swarren@nvidia.com>
>=20
> The Chungwa CLAA101WA01A is a 10.1" 1366x768 panel, which can be
> supported by the simple panel driver.
>=20
> Signed-off-by: Stephen Warren <swarren@nvidia.com>
> ---
>  .../bindings/panel/chunghwa,claa101wa01a.txt       |  7 ++++++
>  drivers/gpu/drm/panel/panel-simple.c               | 25 ++++++++++++++++=
++++++
>  2 files changed, 32 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/panel/chunghwa,claa=
101wa01a.txt

I performed s/Chungwa/Chunghwa/ and s/chungwa/chunghwa/ (yes, it's
horrible to spell that) on this patch and applied it.

Thanks,
Thierry

--bajzpZikUji1w+G9
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSzWukAAoJEN0jrNd/PrOhkZoQAKgY5ss8nwScGVlKx3pkFMbj
mtOBO93MkGKi6yu6nnCPnsx7cuoZHDzdwVDMj247oR//PBQ8scgWdddLPLp4iumf
jv7Rg9JBSMWIlHSfaGXK2o74s1EWf3VnGmfBHkxX5DYe1JKjNPXzR4qGPlx2Xz+0
lUG2uPPSB9CBKcyyYWyXmEgxMvepDnpZUFDDk2iK7voRYSbf0qW4tQD8u+avuaYW
B45FtiRyoAOBLg/n00A67fiU/hCocDnvUzZrzHOum2DkKjwWgZl+fj4AfE1Nb/Xg
8PmX5r4c3auGxOsZCqZL94l08TFA5Sx0OhoqXTA9NnCJhNxO47Ug+QlkPQ2BFB2c
Uz8/s1fTCodF0yBWNG+gmOfPBE9iATlmQGxPrAeuW5wyu8kGdync0lQu/QifJcrS
APRNUkGqFTQcT8Biv68MjOCDfEH+hsLkKaQhwlleJ54K/+lDzKDg4JvlLssgIqn9
w4WlvGhi8Y6Hh4FLfBaj1WKcF/g3FKTBLvURmCnrnxI8SFHABQpKmY6b+9j6vCRJ
+EHcXWgRdByjFvxvijExowcMeGNhTPP/IBqezmL0RqrRkm7/HSCy4YxUe+Snduzt
r+J2gCSKTKC/OM55ORtqKsGus5RXVkRugwJn+skka1xsmIzX82KMsHwQPlvF4Vbm
r6owObe4bt/1u7DAf2w/
=AirR
-----END PGP SIGNATURE-----

--bajzpZikUji1w+G9--

--===============1590846161==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1590846161==--
