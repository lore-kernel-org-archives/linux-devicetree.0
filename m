From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH V2] video: implement a simple framebuffer driver
Date: Tue, 30 Apr 2013 10:39:43 +0300
Message-ID: <517F753F.5090909@ti.com>
References: <1365043183-28905-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2044241721984097843=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1365043183-28905-1-git-send-email-swarren@wwwdotorg.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: linux-fbdev@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, devicetree-discuss@lists.ozlabs.org, Rob Clark <robclark@gmail.com>, linux-rpi-kernel@lists.infradead.org, Olof Johansson <olof@lixom.net>, Andrew Morton <akpm@linux-foundation.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

--===============2044241721984097843==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="----enig2FJCRKBMWXSCPKGPWNMOA"

------enig2FJCRKBMWXSCPKGPWNMOA
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On 04/04/2013 05:39 AM, Stephen Warren wrote:
> A simple frame-buffer describes a raw memory region that may be rendere=
d
> to, with the assumption that the display hardware has already been set
> up to scan out from that buffer.
>=20
> This is useful in cases where a bootloader exists and has set up the
> display hardware, but a Linux driver doesn't yet exist for the display
> hardware.
>=20
> Signed-off-by: Stephen Warren <swarren@wwwdotorg.org>
> ---
> v2: s/dumb/simple/ throughout. Provide more details on pixel format.
>=20
> I ended up going with a separate FB driver:
> * DRM/KMS look much more complex, and don't provide any benefit that I =
can
>   tell for this simple driver.
> * Creating a separate driver rather than adjusting offb.c to work allow=
s a
>   new clean binding to be defined, and doesn't require removing or ifde=
fing
>   PPC-isms in offb.c.
> ---
>  .../bindings/video/simple-framebuffer.txt          |   25 +++
>  drivers/video/Kconfig                              |   17 ++
>  drivers/video/Makefile                             |    1 +
>  drivers/video/simplefb.c                           |  234 ++++++++++++=
++++++++
>  4 files changed, 277 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/video/simple-fram=
ebuffer.txt
>  create mode 100644 drivers/video/simplefb.c
>=20
> diff --git a/Documentation/devicetree/bindings/video/simple-framebuffer=
=2Etxt b/Documentation/devicetree/bindings/video/simple-framebuffer.txt
> new file mode 100644
> index 0000000..3ea4605
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/video/simple-framebuffer.txt
> @@ -0,0 +1,25 @@
> +Simple Framebuffer
> +
> +A simple frame-buffer describes a raw memory region that may be render=
ed to,
> +with the assumption that the display hardware has already been set up =
to scan
> +out from that buffer.
> +
> +Required properties:
> +- compatible: "simple-framebuffer"
> +- reg: Should contain the location and size of the framebuffer memory.=

> +- width: The width of the framebuffer in pixels.
> +- height: The height of the framebuffer in pixels.
> +- stride: The number of bytes in each line of the framebuffer.
> +- format: The format of the framebuffer surface. Valid values are:
> +  - r5g6b5 (16-bit pixels, d[15:11]=3Dr, d[10:5]=3Dg, d[4:0]=3Db).
> +
> +Example:
> +
> +	framebuffer {
> +		compatible =3D "simple-framebuffer";
> +		reg =3D <0x1d385000 (1600 * 1200 * 2)>;
> +		width =3D <1600>;
> +		height =3D <1200>;
> +		stride =3D <(1600 * 2)>;
> +		format =3D "r5g6b5";
> +	};

I'm not an expert on DT, but I think the point of DT is to describe the
hardware. This doesn't describe the hardware at all.

 Tomi



------enig2FJCRKBMWXSCPKGPWNMOA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQIcBAEBAgAGBQJRf3U/AAoJEPo9qoy8lh71wFcP/jxnFSLarF5hL1OgI3KnKCvF
EakOmcaKb5BNqav3K59WFQhW+Jw9L2w/ryYdCx41bIawcGusSoNxjxXbXQf73W8a
Zcc4BVm6+lCSvunIYQfCqbeNDkDZiPC4nzBLcN1lQ4nXEgqoJmuGy3G5mqSj6ntR
N0bde/Mk4kkqyMGAri2+ejQlt7UDO+rD0FHp8jMg6JBcyeTebvaeKhLYqSEoENrL
YFPgYHjlOYs6LQ/BOBtUmihSS8FzfoNxGZQY0fpLWWUi2ePDkQg55BKx6upwUaIJ
NUgaTb7y6BAO4IaTjPhMDH8LLnmOqU/3LDLws2plOYr8dzTBkEFwzTBiWzIIt6/i
A/DILbo3RfM6eIQEOIb9TDfdxU6bUal0rPD2sWbkARYoUgNlpZOenWZMFI51TgCi
40nNB4GMfL4M5oerT9X9jIPORKIhppfW+nMzw1sDzsXHJdkPWhrnRzcj0KUK43TV
RfIUqFrFgPvKY6wVDFZsW8huV6Q1k6mlur7MdQTg36fgiFLyH5LidgXsQA09Ko9H
NE66hzWbLv1qykyArI44Wzi5k5q2ArrMez/pqJPgwaIMC8nmTXxH5lH5+lPrr0jX
fy643WTbwt2ggE3XSL31TO5+DZ1RC8eNLPwnnwJHzbTwgpcz62mE9ABB/G8xBKH1
tndqOuUqkWvlQxOkvH50
=2Xf9
-----END PGP SIGNATURE-----

------enig2FJCRKBMWXSCPKGPWNMOA--


--===============2044241721984097843==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============2044241721984097843==--
