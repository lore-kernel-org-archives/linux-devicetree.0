From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH 1/2] pinctrl: sunxi: fix uart1 CTS/RTS pins at PG on
 A23/A33
Date: Tue, 23 Aug 2016 08:47:55 +0200
Message-ID: <20160823064755.GA2598@lukather>
References: <20160823055826.20591-1-icenowy@aosc.xyz>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8639681387406811082=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20160823055826.20591-1-icenowy@aosc.xyz>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Icenowy Zheng <icenowy@aosc.xyz>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--===============8639681387406811082==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="C7zPtVaVf+AK4Oqc"
Content-Disposition: inline


--C7zPtVaVf+AK4Oqc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Aug 23, 2016 at 01:58:25PM +0800, Icenowy Zheng wrote:
> PG8, PG9 is said to be the CTS/RTS pins for UART1 according to the A23/33
> datasheets. However, the function is wrongly named "uart2" in the pinctrl
> driver. This patch fixes this by modifying them to be named "uart1".
>=20
> Signed-off-by: Icenowy Zheng <icenowy@aosc.xyz>

This looks good, but could you send it to stable?

Thanks,
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--C7zPtVaVf+AK4Oqc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXu/GbAAoJEBx+YmzsjxAg5fQQAKT+B34MfMiQYYLKbNonXX9r
fVjAoNEEtO/q+fSlpzKx3t53KOW9st8x1Ec0wmX4XPLKnkg0frqPSd1671i0yy/C
A+HeudXw8eEE7B551Z4Iz9k0LIDnvIS2ztzacVdt3orSgUyfb1Su/sta3qiz4X0/
aLweAKFlhyrkP4CIXDprMtWbQVkDuacr/hcSv77dEYmG8NcqN//QiSxIncjCFSDP
tmO2opBqEg8p6CQeaNGEai6B44rOXITAxjCofLLjWWRe5swG71fOJjGDGo4yDTCI
QHZ2iwMuHtcWZsp+YsLzHnMTPCNgmKl6nBjM9t6Io1o7U4lbpIFrZQB3lNyh7JWZ
2LAXgS2rXLVZDp1Bn9Sei5nBFWopLsDL0zUWMcoEiAp7SSPzZnJ9kITNcd8JErPy
sJp9OhiBDVnDmjdB9NXjfKUVBe4RU8/Y2YgDCSJ9wQAGi2sOWq7u5DBXjQq9UyUn
CJrY/rzta9v4+UJop+k5K14OMnwj2qU/nZ3sUhS58ztDSTg5rzQCX4hM3+9U59Wu
D/cmBTbF7zt7rvOqsjK8M2lQ2RMoL2jfT+dVXrkyYi2Kh7nPEbsgeop/1B6CVA1g
5UaWpmKAfgqI5p1j1Ew2eVdQpBsrLq2nmyO1kJ3y97GHwKoeYLrChpYkN+v1cJyP
FnKUi7qJ4XTfLgbBoJhL
=kz51
-----END PGP SIGNATURE-----

--C7zPtVaVf+AK4Oqc--


--===============8639681387406811082==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============8639681387406811082==--
