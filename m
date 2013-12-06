From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCHv5][ 3/8] staging: imx-drm: Correct BGR666 and the board's
	dts that use them.
Date: Fri, 6 Dec 2013 14:07:40 +0100
Message-ID: <20131206130739.GD30625@ulmo.nvidia.com>
References: <1386268092-21719-1-git-send-email-denis@eukrea.com>
	<1386268092-21719-3-git-send-email-denis@eukrea.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0062579372=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1386268092-21719-3-git-send-email-denis@eukrea.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
To: Denis Carikli <denis@eukrea.com>
Cc: Marek Vasut <marex@denx.de>, devel@driverdev.osuosl.org, Ian Campbell <ijc+devicetree@hellion.org.uk>, Sascha Hauer <kernel@pengutronix.de>, Pawel Moll <pawel.moll@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, dri-devel@lists.freedesktop.org, driverdev-devel@linuxdriverproject.org, Rob Herring <rob.herring@calxeda.com>, Mauro Carvalho Chehab <m.chehab@samsung.com>, devicetree@vger.kernel.org, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Eric =?utf-8?Q?B=C3=A9nard?= <eric@eukrea.com>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--===============0062579372==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="4zI0WCX1RcnW9Hbu"
Content-Disposition: inline


--4zI0WCX1RcnW9Hbu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Dec 05, 2013 at 07:28:07PM +0100, Denis Carikli wrote:
[...]
> diff --git a/arch/arm/boot/dts/imx51-apf51dev.dts b/arch/arm/boot/dts/imx51-apf51dev.dts
> index f36a3aa..3b6de6a 100644
> --- a/arch/arm/boot/dts/imx51-apf51dev.dts
> +++ b/arch/arm/boot/dts/imx51-apf51dev.dts
> @@ -19,7 +19,7 @@
>  	display@di1 {
               ^^^^

I know this isn't introduced by your patch, but WTF???

Thierry

--4zI0WCX1RcnW9Hbu
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSocwbAAoJEN0jrNd/PrOhP94P/0mBACQRMAUOTMWDoLqUY2jk
69YIl1VTy33ezV1Rmhd3TBd8vEBQzJGQvIeR219KrDmKr6tPyvHwV7TSgPvARAju
RcZ5JN91h/NsjkYAQCHIDKNwyGe5uq4uwSNZoGDOAi+a5zmS2MpjfXNPm9BbyJSf
6vm4dGA6KPIlprBZLEbMvi4/AVnJDriBA6giuC09iEVSJhH4uI+e/DE8UsW6fCrm
B5gZrbfcEqecrmh4kDgewmIgkBRdholuK3A1XMBWEnsbkPRHi0w8GCLMR1bwH8GP
W+2GrQ8pmH/yjIS9Deq/aKVrM9BzbQjb4r0uKMpe2CCOI2Yx01BsIWoo3Tr83GlP
E2AoStk1vjnHC5oY0HIvMyCD4a0l5dlUTxsN/6DrVQepYDNm4a4I9PELyX1xCQ+g
02kMV4yuIuKewbtPxPsvSBZY3VV1XY2+F/PNrrqSd+rUIoF12bXNUQXOpClJ1R7Y
qZem14g4JFZwhLYg7oI1F8tBVUlVGaBR0C4P6mjoyEvlWJtQdPqe/spm3xo8Lisa
Tc2cKRXhycSo7SB/BYsMS/rt0Z5+dg8KLvNohJQ9qEVHEO1jpFimIi6r78ZrNOty
6YfzHoT+kOZd21M3WJrOltpTx2uSkhxgOqL1uWRStiUL5kgssIXgUduN3g66oZXb
XkD06/r1ieeI45TlOULZ
=UUqC
-----END PGP SIGNATURE-----

--4zI0WCX1RcnW9Hbu--

--===============0062579372==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0062579372==--
