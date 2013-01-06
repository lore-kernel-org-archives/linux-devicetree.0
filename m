From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: Fix test relying in wrong behavior of is_printable
Date: Sun, 6 Jan 2013 14:58:09 +1100
Message-ID: <20130106035809.GG4674@truffula.fritz.box>
References: <1357326968-13124-1-git-send-email-panto@antoniou-consulting.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3009226824881944343=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1357326968-13124-1-git-send-email-panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org>
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
To: Pantelis Antoniou <panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org>
Cc: Matt Porter <mporter-l0cyMroinI0@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Russ Dill <Russ.Dill-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--===============3009226824881944343==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="uc35eWnScqDcQrv5"
Content-Disposition: inline


--uc35eWnScqDcQrv5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 04, 2013 at 09:16:08PM +0200, Pantelis Antoniou wrote:
> After fixing the is_printable bug the test suite fails.
> Fix it with this patch
>=20
> Signed-off-by: Pantelis Antoniou <panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org>

Rather than just removing the test, it would be better to still run it
using an explicit -t bi to force the byte output.

> ---
>  tests/run_tests.sh | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>=20
> diff --git a/tests/run_tests.sh b/tests/run_tests.sh
> index dd7f217..43279c9 100755
> --- a/tests/run_tests.sh
> +++ b/tests/run_tests.sh
> @@ -498,9 +498,8 @@ fdtget_tests () {
> =20
>      # run_fdtget_test <expected-result> [<flags>] <file> <node> <propert=
y>
>      run_fdtget_test "MyBoardName" $dtb / model
> -    run_fdtget_test "77 121 66 111 \
> -97 114 100 78 97 109 101 0 77 121 66 111 97 114 100 70 97 109 105 \
> -108 121 78 97 109 101 0" $dtb / compatible
> +    # run_fdtget_test "77 121 66 111 97 114 100 78 97 109 101 0 77 121 6=
6 111 97 114 100 70 97 109 105 108 121 78 97 109 101 0" $dtb / compatible
> +    run_fdtget_test "MyBoardName MyBoardFamilyName" $dtb / compatible
>      run_fdtget_test "MyBoardName MyBoardFamilyName" -t s $dtb / compatib=
le
>      run_fdtget_test 32768 $dtb /cpus/PowerPC,970@1 d-cache-size
>      run_fdtget_test 8000 -tx $dtb /cpus/PowerPC,970@1 d-cache-size

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--uc35eWnScqDcQrv5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlDo9lEACgkQaILKxv3ab8ZmUgCeP/8Qz1gsx65ab1jcBo5j3otO
Uc4Anio37VIVkH4oI4FfX2QBAtKWHH1f
=342s
-----END PGP SIGNATURE-----

--uc35eWnScqDcQrv5--

--===============3009226824881944343==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============3009226824881944343==--
