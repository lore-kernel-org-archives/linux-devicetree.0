From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH RESEND 2/2] gpio: axp209: add pinctrl support
Date: Fri, 25 Nov 2016 16:17:04 +0100
Message-ID: <20161125151704.3am7wyqrlz767dvc@lukather>
References: <20161123141151.25315-1-quentin.schulz@free-electrons.com>
 <20161123141151.25315-3-quentin.schulz@free-electrons.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0195527841009247813=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20161123141151.25315-3-quentin.schulz@free-electrons.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Quentin Schulz <quentin.schulz@free-electrons.com>
Cc: mark.rutland@arm.com, gnurou@gmail.com, devicetree@vger.kernel.org, linus.walleij@linaro.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, wens@csie.org, robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--===============0195527841009247813==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="q7zkz75dpw73y3wm"
Content-Disposition: inline


--q7zkz75dpw73y3wm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Nov 23, 2016 at 03:11:51PM +0100, Quentin Schulz wrote:
> The GPIOs present in the AXP209 PMIC have multiple functions. They
> typically allow a pin to be used as GPIO input or output and can also be
> used as ADC or regulator for example.[1]
>=20
> This adds the possibility to use all functions of the GPIOs present in
> the AXP209 PMIC thanks to pinctrl subsystem.
>=20
> [1] see registers 90H, 92H and 93H at
>     http://dl.linux-sunxi.org/AXP/AXP209_Datasheet_v1.0en.pdf
>=20
> Signed-off-by: Quentin Schulz <quentin.schulz@free-electrons.com>

I've said it already face to face, but ideally you should split that
patch into logical changes.

I can see here at least three:
  - Adding the pinctrl features
  - Renaming the structure and functions
  - Removal of a few functions

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--q7zkz75dpw73y3wm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYOFXrAAoJEBx+YmzsjxAgp4EQAKYR94eDwq3THuZlI/vwVbA7
Cz8yS/SSD+fek6uw30EwvJFupsO8J5YiaNGb3g6W35y956IrguQuokqPfAf+2tR9
ZgCpwFgUE/0BZKEaPDqPaaXHV4xEKfBynC84A5DxrrF9G7v1xkxrx6C1nRdEhIeo
USLU+xkKWveY0QH74bcEtG/iBui+1KipE79Y2os58MsY3Iq+RMVtSIR+U0IGSeEI
Ny9jF4an4A5z6Lp6xHh7RxXsRWGkvVSCYteqMxSnSjEqvekyTP+L9zjpYBCAiPS6
VjJreq7nnye1EGaGkdE6XmI+WJEI5wH61h3ZcjCFYkNm90lEeKsgN6A2nDeiFOou
nazpSW0ixI64LUncbmFd0YmQmv2TgjQjB7o4Ozu/c+UPEZXj3vFf3eapDqdsSKjf
b6uhCpRj5Y4inomrkt6IRlD3V6Vxu3tvjSzMjAEpro384nreKnk/u7a4XEzbzOKO
fb+Z9Kp32Qjr6ZiSD1+wpduUgaQswk2fG1A1xPngw1rMus8omYUiNcQJ/hZCxj+0
ITlZRdQS3o2JiVrlW2jjEAPHCIs7vZUxgH+yu5nJtzN3aaUz5vNzWkPUmKgRjdt+
a9Odo+Tunvss46eoZOoplUBYJ7G2AZI+Ozxmv9oyGsvzCKI3jKWSX34WDJNXr/TH
3dewDGICgG7u7ZqfePw6
=zC3k
-----END PGP SIGNATURE-----

--q7zkz75dpw73y3wm--


--===============0195527841009247813==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============0195527841009247813==--
