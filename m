From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCHv5][ 5/8] staging: imx-drm: parallel display: add
 regulator support.
Date: Fri, 6 Dec 2013 14:23:25 +0100
Message-ID: <20131206132324.GB30960@ulmo.nvidia.com>
References: <1386268092-21719-1-git-send-email-denis@eukrea.com>
 <1386268092-21719-5-git-send-email-denis@eukrea.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4984391257359348859=="
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <1386268092-21719-5-git-send-email-denis@eukrea.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: driverdev-devel-bounces@linuxdriverproject.org
To: Denis Carikli <denis@eukrea.com>
Cc: Marek Vasut <marex@denx.de>, devel@driverdev.osuosl.org, driverdev-devel@linuxdriverproject.org, Eric =?utf-8?Q?B=C3=A9nard?= <eric@eukrea.com>, Pawel Moll <pawel.moll@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, David Airlie <airlied@linux.ie>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <rob.herring@calxeda.com>, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, Sascha Hauer <kernel@pengutronix.de>, Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawn.guo@linaro.org>, Dan Carpenter <dan.carpenter@oracle.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--===============4984391257359348859==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="kXdP64Ggrk/fb43R"
Content-Disposition: inline


--kXdP64Ggrk/fb43R
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 05, 2013 at 07:28:09PM +0100, Denis Carikli wrote:
[...]
> diff --git a/drivers/staging/imx-drm/parallel-display.c b/drivers/staging=
/imx-drm/parallel-display.c
[...]
> @@ -260,6 +275,13 @@ static int imx_pd_probe(struct platform_device *pdev)
>  	if (ret)
>  		return ret;
> =20
> +	imxpd->disp_reg =3D devm_regulator_get(&pdev->dev, "display");
> +	if (PTR_ERR(imxpd->disp_reg) =3D=3D -EPROBE_DEFER)
> +		return -EPROBE_DEFER;
> +
> +	if (IS_ERR(imxpd->disp_reg))
> +		dev_dbg(&pdev->dev, "Operating without display regulator.\n");

I don't think this is necessary. There is code in the regulator core
nowadays that supplies a dummy regulator if one hasn't been hooked up in
devicetree explicitly. So any error that you get at this point is likely
a valid one rather than just a missing regulator.

The advantage is that you no longer have to check at every step of the
way that the regulator is valid before calling the regulator API.

Thierry

--kXdP64Ggrk/fb43R
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSoc/MAAoJEN0jrNd/PrOhZN8QAIJ/lMIBBzQ42EN0c/PRdo6v
3AyBn1/Q4UDCbqV/GPyrMjUgYJn0SbKq3rcEuL/51dXiHXhQfopxg8HVfr3te7VZ
UJBUgQR1W/PB5zXm0EE/giBKiZQneTZDE60RTpfeflkQo9bLtLI3tUZTl+ksub6V
i/wb+/YSHYNrV2a9MkAtWbpUMOaBueD85bK5P3veURzFRK18B+OUKbkjd7+ZsAAM
L4CrRevzm3dRhYXTVgkiwtTmEpM0xIHxYy174qOHVD72OsgcYcz1q8SazZDnmO55
QOap6hc016Zd2uVTwVflnJZYZ16IvjZeYTjTTebWDqU9PqvKLRrz6wz1L7ZhFSho
suXWq2+l00IMxv7UYGIoSghWgt1laYfWw0pG6szDc83pga8kXyJyTF3VwwOL7PnZ
0QecFYp9XvYmd+e/MbvfTTnbfxxFzoHTpsNbSA3CdT1F/HNifm/VoSOXKZvYsIzo
inBKhKmzZplwJW7zzUVfQ7NwWj4mUMUxH3BgrRnguRICWjf0goyDyKBcmXqK/n62
CPFT6zo2XUF8OqtbBPJaWWCr9O9aV8IfscaK+xfl2aDJ55JvMNby51Atd1ogVrZd
n6IA/d8pVSTEv8sjFxP+Rz5qRU7N+Avle1lyjUD+jcnN9v3MZHaXQnR1C6I5VNjY
IemqrwFkxLZc9HL+3YnK
=pXkV
-----END PGP SIGNATURE-----

--kXdP64Ggrk/fb43R--

--===============4984391257359348859==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devel mailing list
devel@linuxdriverproject.org
http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel

--===============4984391257359348859==--
