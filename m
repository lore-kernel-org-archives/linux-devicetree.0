From: Wolfram Sang <w.sang@pengutronix.de>
Subject: Re: [PATCH] hwmon: (ads1015) Add devicetree documentation
Date: Thu, 3 Mar 2011 12:51:51 +0100
Message-ID: <20110303115151.GF3649@pengutronix.de>
References: <1299143805-13133-1-git-send-email-eibach@gdsys.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="5Mfx4RzfBqgnTE/w"
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1299143805-13133-1-git-send-email-eibach@gdsys.de>
Sender: linux-doc-owner@vger.kernel.org
To: Dirk Eibach <eibach@gdsys.de>
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, rdunlap@xenotime.net, devicetree-discuss@lists.ozlabs.org, khali@linux-fr.org
List-Id: devicetree@vger.kernel.org


--5Mfx4RzfBqgnTE/w
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 03, 2011 at 10:16:45AM +0100, Dirk Eibach wrote:
> Signed-off-by: Dirk Eibach <eibach@gdsys.de>
> ---
>  Documentation/devicetree/bindings/i2c/ads1015.txt |   15 +++++++++++++++
>  1 files changed, 15 insertions(+), 0 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/i2c/ads1015.txt
>=20
> diff --git a/Documentation/devicetree/bindings/i2c/ads1015.txt b/Document=
ation/devicetree/bindings/i2c/ads1015.txt
> new file mode 100644
> index 0000000..3a7d67a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i2c/ads1015.txt
> @@ -0,0 +1,15 @@
> +ADS1015 (I2C)
> +
> +Optional properties:
> +
> + - exported-channels : exported_channels is a bitmask that specifies whi=
ch
> +		       inputs should be exported to sysfs.

Hmm, device tree bindings should be OS-neutral, sysfs is not. Maybe
"active-channels" would be better; then the OS could decide what to do
with the active channels. Then again, what is the drawback of exporting
all channels? Is there another hwmon-driver doing so (couldn't find
one)?

Regards,

   Wolfram

--=20
Pengutronix e.K.                           | Wolfram Sang                |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

--5Mfx4RzfBqgnTE/w
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAk1vgNcACgkQD27XaX1/VRvkIACZAaLxtgm8KgjKOnoqQM9skwDG
uDwAoIhgJTes0oEt3ojx8aZKjgG3CAoq
=Mrgf
-----END PGP SIGNATURE-----

--5Mfx4RzfBqgnTE/w--
