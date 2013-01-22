From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 1/8] Adjust util_is_printable_string() comment and fix test
Date: Tue, 22 Jan 2013 16:33:40 +1100
Message-ID: <20130122053340.GJ23500@truffula.fritz.box>
References: <1358801962-21707-1-git-send-email-sjg@chromium.org>
 <1358801962-21707-2-git-send-email-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============9203298845100310400=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1358801962-21707-2-git-send-email-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
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


--===============9203298845100310400==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="W/D3X8sky0X3AmG5"
Content-Disposition: inline


--W/D3X8sky0X3AmG5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 21, 2013 at 12:59:15PM -0800, Simon Glass wrote:
> This commit which changed the behaviour of this function broke one
> of the tests. Also the comment should be updated to reflect its new
> behaviour.
>=20
> Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

Acked-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>

Jon, please apply asap, regardless of what we do with the rest of this
series, since it fixes up the ugly test failure we have right now.

> ---
>  tests/run_tests.sh |    4 +---
>  util.h             |    8 +++++---
>  2 files changed, 6 insertions(+), 6 deletions(-)
>=20
> diff --git a/tests/run_tests.sh b/tests/run_tests.sh
> index dd7f217..e04512c 100755
> --- a/tests/run_tests.sh
> +++ b/tests/run_tests.sh
> @@ -498,9 +498,7 @@ fdtget_tests () {
> =20
>      # run_fdtget_test <expected-result> [<flags>] <file> <node> <propert=
y>
>      run_fdtget_test "MyBoardName" $dtb / model
> -    run_fdtget_test "77 121 66 111 \
> -97 114 100 78 97 109 101 0 77 121 66 111 97 114 100 70 97 109 105 \
> -108 121 78 97 109 101 0" $dtb / compatible
> +    run_fdtget_test "MyBoardName MyBoardFamilyName" $dtb / compatible

I would also like to see a test of the old-style behaviour still
present, by explicitly enabling it with -t bu.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--W/D3X8sky0X3AmG5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlD+JLQACgkQaILKxv3ab8YTIQCfTA/UNphJA1wR2AZ2vHsvzUzi
lU0AnRxWfYc+m/fwdix8vWH/7OYa67g+
=sfCO
-----END PGP SIGNATURE-----

--W/D3X8sky0X3AmG5--

--===============9203298845100310400==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============9203298845100310400==--
