From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH v3] pwm: Device tree support for PWM polarity.
Date: Thu, 22 Nov 2012 22:29:41 +0100
Message-ID: <20121122212941.GL16716@avionic-0098.adnet.avionic-design.de>
References: <1353483644-32711-1-git-send-email-avinashphilip@ti.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3837442556938045892=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1353483644-32711-1-git-send-email-avinashphilip-l0cyMroinI0@public.gmane.org>
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
To: "Philip, Avinash" <avinashphilip-l0cyMroinI0@public.gmane.org>
Cc: linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, nsekhar-l0cyMroinI0@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, gururaja.hebbar-l0cyMroinI0@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org


--===============3837442556938045892==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="9JSHP372f+2dzJ8X"
Content-Disposition: inline


--9JSHP372f+2dzJ8X
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 21, 2012 at 01:10:44PM +0530, Philip, Avinash wrote:
> Add support for encoding PWM properties in bit encoded form with
> of_pwm_xlate_with_flags() function support. Platforms require platform
> specific PWM properties has to populate in 3rd cell of the pwm-specifier
> and PWM driver should also set .of_xlate support with this function.
> Currently PWM property polarity encoded in bit position 0 of the third
> cell in pwm-specifier.
>=20
> Signed-off-by: Philip, Avinash <avinashphilip-l0cyMroinI0@public.gmane.org>

Applied with two minor stylistic cleanups, thanks.

Thierry

--9JSHP372f+2dzJ8X
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJQrplFAAoJEN0jrNd/PrOhaTgP/iAnnHegKeb2v0YdYpEA4an/
zfxRMvbrDpkuZzx2G08WRL/nNdx6kl0nO/iKV/20X7dFoueedb/cr1ZFHj6V0sQj
ArT1EmGNQewLvdj2w9Jwmwc+V7dtxeh4NsWWZbk1veJm5chIoUK+lJEFYcltLgD0
GaQ6OkYaGvNI9aQwj7I722ypH0AYXD9CGrl+l1ULyx5nOosg8FTQE5vd9aCFx6mY
lUcwiAWs2t52o848XhjRsMXIt4VJ+9W50UeETtAwyneGkDpHXm/n6Gp3RpIEEsmK
jPGv2CWr/lr6aS7hd+jTfv48eOrIu2zMI3Heu/vSv5nJFdPFf21c6KHo0CI58/ib
7Xl1LbUO3mhFK4evd024jEZW4rQaUVnQGJPVmQYvDhpST3F+2oa6EXj2hmPsPpHP
gvW8G72LvNNfSeCX5qtDV2TbdHBoOeR+tpMq3WyAygPbRUd7AjKdPjk4V7IwhrJs
5ZAq6g7lcO4FuY/yOXyq5GQcz9694w5BsWmdsIjYi7kSOx5BHEHwNy5Sh+ldeoUC
TOjVsZdSPBjFhiLAlFno4FqvFygE7xIo4MPBzEX9ba+Z59fUYN4xhWo2qDQhqDKt
T1y5eg+sBxi+P/LpJ0V7nUT4tc4ZjWs7ok5xRGqzDo4klTW881uqqN8fwZyw21sf
kmfm7uuRsWCajTpj5zKZ
=2ipj
-----END PGP SIGNATURE-----

--9JSHP372f+2dzJ8X--

--===============3837442556938045892==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============3837442556938045892==--
