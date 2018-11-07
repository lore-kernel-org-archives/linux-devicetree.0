From: Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [PATCH V3] arm64: dts: r8a77990: ebisu: Add and enable SDHI
 device nodes
Date: Wed, 7 Nov 2018 09:50:57 +0100
Message-ID: <20181107085056.GB31092@kunai>
References: <20181106204647.18051-1-marek.vasut+renesas@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6892887542076259819=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20181106204647.18051-1-marek.vasut+renesas@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Marek Vasut <marek.vasut@gmail.com>
Cc: devicetree@vger.kernel.org, Takeshi Kihara <takeshi.kihara.df@renesas.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, linux-renesas-soc@vger.kernel.org, Simon Horman <horms+renesas@verge.net.au>, linux-arm-kernel@lists.infradead.org, Marek Vasut <marek.vasut+renesas@gmail.com>
List-Id: devicetree@vger.kernel.org


--===============6892887542076259819==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+g7M9IMkV8truYOl"
Content-Disposition: inline


--+g7M9IMkV8truYOl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 06, 2018 at 09:46:47PM +0100, Marek Vasut wrote:
> From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
>=20
> This patch adds SDHI{0,1,3} device nodes for the r8a77990 SoC
> and enables SD card slot connected to SDHI0, micro SD card slot
> connected to SDHI1 and eMMC connected to SDHI3 on the Ebisu board
> using the R8A77990 SoC.
>=20
> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>

Acked-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Out of curiosity: have you tested HS400 on that board based on Niklas'
recent patches as well?


--+g7M9IMkV8truYOl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlvip3AACgkQFA3kzBSg
KbZ2wQ//VQfyMFYhpGLx15tChKnrGHzKDVXGUSYrLY6zaqii0TdRlj3ycnUrNk8U
tsg1d9hTQhzs666oFAGkaQgAogz/SFO8/Q2jZ7QMb9FL402lGKRjAOAsGkPBuGaK
XfgmOS521yaP3mwaTlgU6t1Y47S6jcIJgIcKoRRymLUO4SoNtvn9FTdWbq2kQuyl
r9J/4U/gYBx8/gIr4bUDambhJc+xAr8Iydv7CNrRZGGXy9I2hOqL12/tEGcN6s8G
RdoJkLKMOVdLutHz1HNkhfJVttxkfX7Lz7118MMJ+yP6RvWY4AGOE+FxkY84687C
oe/yH2yBql8u/MujYTBsF0k6544VkhOK/grhp3lRM/12HhY2Z6OkW11UlAUG3uTE
RqbiT65IFbvqMqvrQrpHzkWjiz4+85LYvs2lt5+vEd+5ReiDYDAk7zsqAhvk5w8H
E4C9XFUJN073ZVtGDfcibO3VzsWCfB4TVkSLx8cliFRRGRuzDlmXCxbWuhQWy+7+
eyVLPs06YgyTOQw5i12Me3AQ8tGpMonzhvxJnNhRPGd8JkRY4byg0aQQpHNPCXzc
+V6VY1X1XIGvMvW8o1+QMLL3n1MpHpc2NV3B2DxyavXV26kvppifcNBt2qsLPRuo
3+XR4R4nBPXEO6+AzmfkkBJvmPj3XX6WNt3c5XeCgheFsf+XQmA=
=U6XU
-----END PGP SIGNATURE-----

--+g7M9IMkV8truYOl--


--===============6892887542076259819==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============6892887542076259819==--
