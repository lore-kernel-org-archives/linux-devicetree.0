From: Michal Nazarewicz <mina86@mina86.com>
Subject: Re: [PATCH v4 2/4] drivers: of: add function to scan fdt nodes given
 by path
Date: Mon, 05 Aug 2013 16:30:56 +0200
Message-ID: <xa1ttxj4us4f.fsf@mina86.com>
References: <1375275119-12787-1-git-send-email-m.szyprowski@samsung.com>
 <1375275119-12787-3-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-=-="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1375275119-12787-3-git-send-email-m.szyprowski@samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org, linaro-mm-sig@lists.linaro.org, devicetree-discuss@lists.ozlabs.org
Cc: Laura Abbott <lauraa@codeaurora.org>, Arnd Bergmann <arnd@arndb.de>, Tomasz Figa <t.figa@samsung.com>, Nishanth Peethambaran <nishanth.p@gmail.com>, Grant Likely <grant.likely@secretlab.ca>, Marc <marc.ceeeee@gmail.com>, Kyungmin Park <kyungmin.park@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Olof Johansson <olof@lixom.net>, Sascha Hauer <s.hauer@pengutronix.de>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 31 2013, Marek Szyprowski wrote:
> Add a function to scan the flattened device-tree starting from the
> node given by the path. It is used to extract information (like reserved
> memory), which is required on ealy boot before we can unflatten the
                                ^^^^ early
> tree.
>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Acked-by: Kyungmin Park <kyungmin.park@samsung.com>

Acked-by: Michal Nazarewicz <mina86@mina86.com>

Some minor comments inline.

> +static int __init fdt_scan_node_by_path(unsigned long node, const char *=
uname,
> +					int depth, void *data)
> +{
> +	struct fdt_scan_status *st =3D data;
> +
> +	/*
> +	 * if scan at the requested fdt node has been completed,
> +	 * return -ENXIO to abort further scanning
> +	 */
> +	if (depth <=3D st->depth)
> +		return -ENXIO;
> +
> +	/* requested fdt node has been found, so call iterator function */
> +	if (st->found)
> +		return st->iterator(node, uname, depth, st->data);
> +
> +	/* check if scanning automata is entering next level of fdt nodes */
> +	if (depth =3D=3D st->depth + 1 &&
> +	    strncmp(st->name, uname, st->namelen) =3D=3D 0) {

+	    strncmp(st->name, uname, st->namelen) =3D=3D 0 &&
+	    uname[st->namelen] =3D=3D 0) {

> +		st->depth +=3D 1;
> +		if (st->name[st->namelen] =3D=3D 0) {
> +			st->found =3D 1;
> +		} else {
> +			const char *next =3D st->name + st->namelen + 1;
> +			const char *p =3D next;
> +			while (*p !=3D '/' && *p !=3D 0)
> +				p++;
> +			st->name =3D next;
> +			st->namelen =3D p - next;

+			st->namelen =3D strcspn(next, "/");

except this might be slightly slower since the second argument is looped
over, but something to consider I guess since it get rid of few of the
lines of code.

> +		}
> +		return 0;
> +	}
> +
> +	/* scan next fdt node */
> +	return 0;
> +}
> +
> +/**
> + * of_scan_flat_dt_by_path - scan flattened tree blob and call callback =
on each
> + *			     child of the given path.
> + * @path: path to start searching for children
> + * @it: callback function
> + * @data: context data pointer
> + *
> + * This function is used to scan the flattened device-tree starting from=
 the
> + * node given by path. It is used to extract information (like reserved
> + * memory), which is required on ealy boot before we can unflatten the t=
ree.
> + */
> +int __init of_scan_flat_dt_by_path(const char *path,
> +	int (*it)(unsigned long node, const char *name, int depth, void *data),
> +	void *data)
> +{
> +	struct fdt_scan_status st =3D {path, 0, -1, 0, it, data};
> +	int ret =3D 0;
> +
> +	if (initial_boot_params)
> +		ret =3D of_scan_flat_dt(fdt_scan_node_by_path, &st);
> +
> +	if (st.found && ret =3D=3D -ENXIO)	/* scan has been completed */
> +		return 0;
> +	else
> +		return -ENOENT;

Perhaps propagate ret:

+	if (!st.found)
+		return -ENOENT;
+	else if (ret =3D=3D -ENXIO)
+		return 0;
+	else
+		return ret;

> +}
> +
>  #ifdef CONFIG_BLK_DEV_INITRD
>  /**
>   * early_init_dt_check_for_initrd - Decode initrd location from flat tree

--=20
Best regards,                                         _     _
.o. | Liege of Serenely Enlightened Majesty of      o' \,=3D./ `o
..o | Computer Science,  Micha=C5=82 =E2=80=9Cmina86=E2=80=9D Nazarewicz   =
 (o o)
ooo +----<email/xmpp: mpn@google.com>--------------ooO--(_)--Ooo--
--=-=-=
Content-Type: multipart/signed; boundary="==-=-=";
	micalg=pgp-sha1; protocol="application/pgp-signature"

--==-=-=
Content-Type: text/plain


--==-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBAgAGBQJR/7cgAAoJECBgQBJQdR/0VFUP/1RAXFh7GLK+CRLxhF3IlEXs
XYqj3nU7ahlrszbEOi0PyZ4yaH3qzxF4pjsMtG2zMJ8mfT+i4uNX+cQ5/GunieDi
uXE9eihWEirrlybS+Z1igR/2E8mOgScO4bMszy/oxCGL6uo6Wc7fmAJTDe6xfRR4
E1KI6qipNSu00ees8M2REG9/TyfTTomkzUg6q6E1WbxBRgIClthrbxMvgjvbWoaa
Smepy8kvBUIsy03QhH/ZEdWTTtG9h9nePl5VEYN95kP8sAlPA0mknQ1f6/DjOmtl
Vv3qj0Bl7r1yH8eWu+DXUxZbYToyRfdOp5131TiKWZ/QioCma6AdEtB0Wdi41+Z6
O8iv7Wce9eMFM86zS/mwdS+7paGHhqH7xbjzXWIw1nA7+y0j5YNn131cFOiBUDy6
8XaOg3VJMLMfRrGdrJwsoAvWtj76HflNKanevtQWWaee7hPXw5dsXqmA/51A2tCt
GgnxWI7BchDDbxk4rE1kF2BHrSioliBj4/QK5NKXheCYsr8KM4GqimjoXfbW8jg4
5h88zljUZB4x1t9fALpibsHOy6yBOMnj5ycrBjI9TjFrQrL5+k2SCkVuUy+jkqHe
LboyoOnXD1o2x0vZIsxBOjq9HXcupbLUB+TczZP9BWVwCal2X9ExklAEmqBFKl+I
R++nUQ9GzdInxcWrkWQQ
=NwmJ
-----END PGP SIGNATURE-----
--==-=-=--

--=-=-=
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--=-=-=--
