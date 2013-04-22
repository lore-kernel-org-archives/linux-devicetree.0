From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 04/10] util_version: new helper for displaying version info
Date: Mon, 22 Apr 2013 17:19:41 -0400
Message-ID: <201304221719.42982.vapier@gentoo.org>
References: <1366078397-14889-1-git-send-email-vapier@gentoo.org>
 <1366078397-14889-5-git-send-email-vapier@gentoo.org>
 <20130419005046.GL16400@truffula.fritz.box>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3800861639716163910=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20130419005046.GL16400-W9XWwYn+TF0XU02nzanrWNbf9cGiqdzd@public.gmane.org>
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
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

--===============3800861639716163910==
Content-Type: multipart/signed;
  boundary="nextPart3800893.9Cmf4mhXQi";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart3800893.9Cmf4mhXQi
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Thursday 18 April 2013 20:50:46 David Gibson wrote:
> On Mon, Apr 15, 2013 at 10:13:11PM -0400, Mike Frysinger wrote:
> > This is so all utilities can have this flag and not just dtc.
> >=20
> > Acked-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
> > Signed-off-by: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
>=20
> Please apply these first 4 patches, regardless of the rest of the
> series.

on the subject of the other patches, is there a way i could split them up=20
that'd make things more palatable ?  the usage clean up ones could be merge=
d=20
independently of the new fdtdump options.

clean up series:
fdtdump: make usage a bit more friendly
dtc/fdt{get,put}/convert-dtsv0-lexer: convert to new usage helpers
util: drop "long" from usage helpers
util: add common ARRAY_SIZE define

new functionality series:
fdtdump: add a --scan option
fdtdump: add a debug mode
=2Dmike

--nextPart3800893.9Cmf4mhXQi
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iQIcBAABAgAGBQJRdaluAAoJEEFjO5/oN/WBvQUQAIXN8/8Orhuzv8u6+6VczgQd
qH9xfKH8/2GV+VuBesm2Af4cHhdEpZX+FOD7jfp6KD1gGHTPG4uMcz/bB7kUHZa7
fP0j5dmSw9c/InXl0SsNTsTZeJT9fIPtRuiK5SDG67zTVS43bb27xbatj+rFOwnW
gZaInCaoCE4gJotesvajK5aRNlqVwtMHRNfZP1heJH/20GcrMtlCFelHC8fFp10v
xUOUqcw4CSJTM7bJ8a45mrIGq0iEDDSJagPZ46Z8+PPmZWTJr7NVk3bmaJtZ9lw4
NZ6Ds209KRTJFcLOf9KpRwJ/NgNQAP15G4LYKDYW1EKJxxEMi6fz3GIViq5faDrd
VtdiCyq3xDuCBvYbqXia/NJKYcMhda/8sQm4s3bhh1c99zqYzonfKFklRaLKRxV5
fKHqq8WLL6o45rz/aQ2dxeV1ysS97omzDJxE//DRfUGj7Fs7qNsa5wMqPu6w91VF
P+bHgaAwfQS/FlMcwwdVwBhVMdCdY4S0wQ2iOn9eUgzJCs0MoieJfGtAQPMY/Eqc
dGjEKOdLgzpWX95+if1VZrPfshY/Nxfqmqhd2/+5YdewPrB85aDZSaUKXc7+FqHC
CtB+yxV5RzHtPEtIAlQkyCPD52J4uGNlBwSSB2Jbzr4V8JuPKoidqc2/VqPiHiri
m+YE86DSqij1L5Obh73n
=EqS8
-----END PGP SIGNATURE-----

--nextPart3800893.9Cmf4mhXQi--

--===============3800861639716163910==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============3800861639716163910==--
