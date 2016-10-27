From: Antoine Tenart <antoine.tenart@free-electrons.com>
Subject: Re: [RFC PATCH 5/5] of: overlay-mgr: add a detector for headers
 stored on a ds2431 eeprom over w1
Date: Thu, 27 Oct 2016 15:55:36 +0200
Message-ID: <20161027135536.tk4y7b36aqjleyfd@kwain>
References: <20161026145756.21689-1-antoine.tenart@free-electrons.com>
 <20161026145756.21689-6-antoine.tenart@free-electrons.com>
 <e839e92f-127b-efc3-b10f-37477d1c5d9a@suse.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7543786898131409248=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <e839e92f-127b-efc3-b10f-37477d1c5d9a@suse.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Matthias Brugger <mbrugger@suse.com>
Cc: mark.rutland@arm.com, thomas.petazzoni@free-electrons.com, devicetree@vger.kernel.org, pantelis.antoniou@konsulko.com, Antoine Tenart <antoine.tenart@free-electrons.com>, sboyd@codeaurora.org, linux-kernel@vger.kernel.org, maxime.ripard@free-electrons.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--===============7543786898131409248==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="crb3gkvyn7n3u62r"
Content-Disposition: inline


--crb3gkvyn7n3u62r
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Matthias,

On Thu, Oct 27, 2016 at 11:19:14AM +0200, Matthias Brugger wrote:
> On 10/26/2016 04:57 PM, Antoine Tenart wrote:
> > Signed-off-by: Antoine Tenart <antoine.tenart@free-electrons.com>
> > ---
>=20
> Please provide a commit message.

Sure. There are other modifications I'd like to do in the series if it
happens to be an use case for people. This patch is given as an example
of how we could implement this.

Antoine

--=20
Antoine T=E9nart, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--crb3gkvyn7n3u62r
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCgAGBQJYEgdYAAoJEFxNi8it27zYuvUQAJFwKekwVTfub59UusQ/8xyh
FBwuM4jxUabcQC4x2C4yuqz7ZPdB9jcD/nV2pucnJuXW3lMqEgSZfTrsfD9CGjSN
gQQsAEYNY9XFUmW5mKrpT17SC6N71Uk8uXmLR+4PpFbf7I9US0ZZ1ruuVvUgSUMn
I9fSjF4I6GKIsuR4xT1Z2Q7Oh4ALR0PK5dM+4+Cig9SXpZC32RGJ+HANJum8B66k
y31qiRB36vkgl/5igADWjSD/e57vc7pPG0Tn909WtF71GTuNZ1qT6OmY6wjmhCGz
9Gtk7zpP947a3+jqZ/pObWjCJziHOzvakeRKWD4GYnUjM+wl2Wp2bQW0a025zeLd
JDoaQ+cys3R+KDzfi+rJZJ4HnOnvlEvxFIIManyPJwgHiUF32U7Rn7lgXT7sLEyZ
h/+b1kcdJekhkRVgWWOkTMDfkJWCvJOxuG0oKDJYCfnphNnkieGzB2uYJY+eMlXw
A2rZjw5XDNB+Krseyl4TPaDWKU3MsHdni/TyteX5ggXsOfPm6pYQZD58BoRsHQPI
cPQOwCg2azqhmxuRjaCC+iRp8ShIPG8s3uDOglKKjx0Sqw683sN4dFGsLcPGqTfu
/xx09timwfawfqRbcWcPQagwoTII00RzQiB1bV6hqb/gI7xI2s2+ijv8YyWE+Op2
DxXbFuH1onX7uJCeb3XD
=O8Ml
-----END PGP SIGNATURE-----

--crb3gkvyn7n3u62r--


--===============7543786898131409248==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============7543786898131409248==--
