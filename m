From: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH] dt: remove of_alias_get_id() reference
Date: Thu, 4 Aug 2011 13:33:37 +0300
Message-ID: <20110804103336.GE17540@legolas.emea.dhcp.ti.com>
References: <20110804102950.10845.67898.stgit@ponder>
Reply-To: balbi-l0cyMroinI0@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2950300575379795492=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20110804102950.10845.67898.stgit@ponder>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--===============2950300575379795492==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="JSkcQAAxhB1h8DcT"
Content-Disposition: inline


--JSkcQAAxhB1h8DcT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 04, 2011 at 11:30:27AM +0100, Grant Likely wrote:
> of_alias_get_id() is broken and being reverted.  Remove the reference
> to it and replace with a single incrementing id number.
>=20
> There is no risk of regression here on the imx driver since the imx
> change to use of_alias_get_id() is commit 22698aa2, "serial/imx: add
> device tree probe support" which is new for v3.1, and it won't get
> used unless CONFIG_OF is enabled and the board is booted using a
> device tree.  A single incrementing integer is sufficient for now.
>=20
> Signed-off-by: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
> Acked-by: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>=20
> I'm about to ask Linus to pull this patch through the devicetree/merge
> branch along with the of_alias revert.
>=20
>  drivers/tty/serial/imx.c |   13 ++++---------
>  1 files changed, 4 insertions(+), 9 deletions(-)
>=20
> diff --git a/drivers/tty/serial/imx.c b/drivers/tty/serial/imx.c
> index 827db76..7e91b3d 100644
> --- a/drivers/tty/serial/imx.c
> +++ b/drivers/tty/serial/imx.c
> @@ -1286,22 +1286,17 @@ static int serial_imx_resume(struct platform_devi=
ce *dev)
>  static int serial_imx_probe_dt(struct imx_port *sport,
>  		struct platform_device *pdev)
>  {
> +	static int portnum =3D 0;

would it be better to use an IDR here ?

--=20
balbi

--JSkcQAAxhB1h8DcT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQEcBAEBAgAGBQJOOnWAAAoJEAv8Txj19kN1GJYH/3JxLcfRdvsCJWltIxgdjZ/t
/zx3jYkNYehs6Arm6Z5judmGQye2VdgGxQw6vKadxIvMm5mEHX3+IGpnIbetHA0O
yDy6cvCA+4mW6IngDHgclftXi+FZf847HwXuD7GSFU8gNADDtaxu4XggWJ6akf44
SwMv9O+ortn5DYZ6XihXfrNk1+lUX041HrnEFx94CbPc9aNZHCm6seP69gQT8HJm
9FMke9T4pxZ667YfTzKZmdBG9qZ+5VTKSPMFR/Mk08opA9MxdI46pqJLeBY2tboW
K3ZOmfM75QYchgarBPPk93wKfkh9CnzmJ2j5Ldu/XWHGinxvSRAHHfrn3h/sKR0=
=h4mZ
-----END PGP SIGNATURE-----

--JSkcQAAxhB1h8DcT--

--===============2950300575379795492==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============2950300575379795492==--
