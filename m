From: Markus Pargmann <mpa@pengutronix.de>
Subject: Re: [PATCH v3] pstore-ram: add Device Tree bindings
Date: Wed, 27 Jan 2016 11:44:40 +0100
Message-ID: <20160127104440.GC17933@pengutronix.de>
References: <1452210056-14436-1-git-send-email-ghackmann@google.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="azLHFNyN32YCQGCU"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1452210056-14436-1-git-send-email-ghackmann@google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Hackmann <ghackmann@google.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Jonathan Corbet <corbet@lwn.net>, Anton Vorontsov <anton@enomsg.org>, Colin Cross <ccross@android.com>, Kees Cook <keescook@chromium.org>, Tony Luck <tony.luck@intel.com>, John Stultz <john.stultz@linaro.org>, linux-doc@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--azLHFNyN32YCQGCU
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

sorry for the late response.

On Thu, Jan 07, 2016 at 03:40:56PM -0800, Greg Hackmann wrote:
> ramoops is one of the remaining places where ARM vendors still rely on
> board-specific shims.  Device Tree lets us replace those shims with
> generic code.
>=20
> These bindings mirror the ramoops module parameters, with two small
> differences:
>=20
> (1) dump_oops becomes an optional "no-dump-oops" property, since ramoops
>     sets dump_oops=3D1 by default.
>=20
> (2) mem_type=3D1 becomes the more self-explanatory "unbuffered" property.

I thought about the same patch at the end of last year but decided
against this for several reasons.

1) ramoops is a memory region, not hardware or any hardware description.

2) A suitable location for the ramoops depends on many factors. It is
not restricted to a specific board. For example the boot ROM of a SoC
may work differently for different boot mechanisms (usb, nand, SD-Card,
=2E..) and may by accident overwrite the ramoops area given in the
devicetree.

3) Different bootloaders use the available memory differently which may
conflict with the definition in the devicetree and some data is placed
in memory before the devicetree is even accessible, for example if we
are running in sram before switching to a bootloader running in sdram.

These were the reasons why I decided to implement ramoops support in
the bootloader instead. The bootloader is the component that has
knowledge about used memory and it can inform other system components
(kernel) about the ramoops area. This way the ramoops area can be set
where it is not overwritten by any other component.

Best Regards,

Markus

>=20
> Signed-off-by: Greg Hackmann <ghackmann@google.com>
> ---
> Changes in V3:
> - documentation fixes
> - look for "no-ram-oops" property as documented
>=20
> Changes in V2:
> - make DT binding documentation more generic
>=20
>  Documentation/devicetree/bindings/misc/ramoops.txt |  43 ++++++++
>  Documentation/ramoops.txt                          |   6 +-
>  fs/pstore/ram.c                                    | 110 +++++++++++++++=
+++++-
>  3 files changed, 155 insertions(+), 4 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/misc/ramoops.txt
>=20
> diff --git a/Documentation/devicetree/bindings/misc/ramoops.txt b/Documen=
tation/devicetree/bindings/misc/ramoops.txt
> new file mode 100644
> index 0000000..5a475fa
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/misc/ramoops.txt
> @@ -0,0 +1,43 @@
> +Ramoops oops/panic logger
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
> +
> +ramoops provides persistent RAM storage for oops and panics, so they can=
 be
> +recovered after a reboot.
> +
> +Parts of this storage may be set aside for other persistent log buffers,=
 such
> +as kernel log messages, or for optional ECC error-correction data.  The =
total
> +size of these optional buffers must fit in the reserved region.
> +
> +Any remaining space will be used for a circular buffer of oops and panic
> +records.  These records have a configurable size, with a size of 0 indic=
ating
> +that they should be disabled.
> +
> +
> +Required properties:
> +
> +- compatible: must be "ramoops"
> +
> +- memory-region: phandle to a region of memory that is preserved between=
 reboots
> +
> +
> +Optional properties:
> +
> +- ecc-size: enables ECC support and specifies ECC buffer size in bytes
> +  (defaults to no ECC)
> +
> +- record-size: maximum size in bytes of each dump done on oops/panic
> +  (defaults to 0)
> +
> +- console-size: size in bytes of log buffer reserved for kernel messages
> +  (defaults to 0)
> +
> +- ftrace-size: size in bytes of log buffer reserved for function tracing=
 and
> +  profiling (defaults to 0)
> +
> +- pmsg-size: size in bytes of log buffer reserved for userspace messages
> +  (defaults to 0)
> +
> +- unbuffered: if present, use unbuffered mappings to map the reserved re=
gion
> +  (defaults to buffered mappings)
> +
> +- no-dump-oops: if present, only dump panics (defaults to panics and oop=
s)
> diff --git a/Documentation/ramoops.txt b/Documentation/ramoops.txt
> index 5d86756..9264bca 100644
> --- a/Documentation/ramoops.txt
> +++ b/Documentation/ramoops.txt
> @@ -45,7 +45,7 @@ corrupt, but usually it is restorable.
> =20
>  2. Setting the parameters
> =20
> -Setting the ramoops parameters can be done in 2 different manners:
> +Setting the ramoops parameters can be done in 3 different manners:
>   1. Use the module parameters (which have the names of the variables des=
cribed
>   as before).
>   For quick debugging, you can also reserve parts of memory during boot
> @@ -54,7 +54,9 @@ Setting the ramoops parameters can be done in 2 differe=
nt manners:
>   kernel to use only the first 128 MB of memory, and place ECC-protected =
ramoops
>   region at 128 MB boundary:
>   "mem=3D128M ramoops.mem_address=3D0x8000000 ramoops.ecc=3D1"
> - 2. Use a platform device and set the platform data. The parameters can =
then
> + 2. Use Device Tree bindings, as described in
> + Documentation/device-tree/bindings/misc/ramoops.txt.
> + 3. Use a platform device and set the platform data. The parameters can =
then
>   be set through that platform data. An example of doing that is:
> =20
>  #include <linux/pstore_ram.h>
> diff --git a/fs/pstore/ram.c b/fs/pstore/ram.c
> index 319c3a6..0f2912c 100644
> --- a/fs/pstore/ram.c
> +++ b/fs/pstore/ram.c
> @@ -34,6 +34,8 @@
>  #include <linux/slab.h>
>  #include <linux/compiler.h>
>  #include <linux/pstore_ram.h>
> +#include <linux/of.h>
> +#include <linux/of_address.h>
> =20
>  #define RAMOOPS_KERNMSG_HDR "=3D=3D=3D=3D"
>  #define MIN_MEM_SIZE 4096UL
> @@ -458,15 +460,112 @@ static int ramoops_init_prz(struct device *dev, st=
ruct ramoops_context *cxt,
>  	return 0;
>  }
> =20
> +static int ramoops_parse_dt_size(struct platform_device *pdev,
> +		const char *propname, unsigned long *val)
> +{
> +	u64 val64;
> +	int ret;
> +
> +	ret =3D of_property_read_u64(pdev->dev.of_node, propname, &val64);
> +	if (ret =3D=3D -EINVAL) {
> +		*val =3D 0;
> +		return 0;
> +	} else if (ret !=3D 0) {
> +		dev_err(&pdev->dev, "failed to parse property %s: %d\n",
> +				propname, ret);
> +		return ret;
> +	}
> +
> +	if (val64 > ULONG_MAX) {
> +		dev_err(&pdev->dev, "invalid %s %llu\n", propname, val64);
> +		return -EOVERFLOW;
> +	}
> +
> +	*val =3D val64;
> +	return 0;
> +}
> +
> +static int ramoops_parse_dt(struct platform_device *pdev,
> +		struct ramoops_platform_data *pdata)
> +{
> +	struct device_node *of_node =3D pdev->dev.of_node;
> +	struct device_node *mem_region;
> +	struct resource res;
> +	u32 ecc_size;
> +	int ret;
> +
> +	dev_dbg(&pdev->dev, "using Device Tree\n");
> +
> +	mem_region =3D of_parse_phandle(of_node, "memory-region", 0);
> +	if (!mem_region) {
> +		dev_err(&pdev->dev, "no memory-region phandle\n");
> +		return -ENODEV;
> +	}
> +
> +	ret =3D of_address_to_resource(mem_region, 0, &res);
> +	of_node_put(mem_region);
> +	if (ret) {
> +		dev_err(&pdev->dev, "failed to translate memory-region to resource: %d=
\n",
> +				ret);
> +		return ret;
> +	}
> +
> +	pdata->mem_size =3D resource_size(&res);
> +	pdata->mem_address =3D res.start;
> +	pdata->mem_type =3D of_property_read_bool(of_node, "unbuffered");
> +	pdata->dump_oops =3D !of_property_read_bool(of_node, "no-dump-oops");
> +
> +	ret =3D ramoops_parse_dt_size(pdev, "record-size", &pdata->record_size);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret =3D ramoops_parse_dt_size(pdev, "console-size", &pdata->console_siz=
e);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret =3D ramoops_parse_dt_size(pdev, "ftrace-size", &pdata->ftrace_size);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret =3D ramoops_parse_dt_size(pdev, "pmsg-size", &pdata->pmsg_size);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret =3D of_property_read_u32(of_node, "ecc-size", &ecc_size);
> +	if (ret =3D=3D 0) {
> +		if (ecc_size > INT_MAX) {
> +			dev_err(&pdev->dev, "invalid ecc-size %u\n", ecc_size);
> +			return -EOVERFLOW;
> +		}
> +		pdata->ecc_info.ecc_size =3D ecc_size;
> +	} else if (ret !=3D -EINVAL) {
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
>  static int ramoops_probe(struct platform_device *pdev)
>  {
>  	struct device *dev =3D &pdev->dev;
> -	struct ramoops_platform_data *pdata =3D pdev->dev.platform_data;
> +	struct ramoops_platform_data *pdata =3D platform_get_drvdata(pdev);
>  	struct ramoops_context *cxt =3D &oops_cxt;
>  	size_t dump_mem_sz;
>  	phys_addr_t paddr;
>  	int err =3D -EINVAL;
> =20
> +	if (dev->of_node && !pdata) {
> +		pdata =3D devm_kzalloc(&pdev->dev, sizeof(*pdata), GFP_KERNEL);
> +		if (!pdata) {
> +			err =3D -ENOMEM;
> +			goto fail_out;
> +		}
> +
> +		err =3D ramoops_parse_dt(pdev, pdata);
> +		if (err < 0)
> +			goto fail_out;
> +	}
> +
>  	/* Only a single ramoops area allowed at a time, so fail extra
>  	 * probes.
>  	 */
> @@ -561,6 +660,7 @@ static int ramoops_probe(struct platform_device *pdev)
>  		cxt->size, (unsigned long long)cxt->phys_addr,
>  		cxt->ecc_info.ecc_size, cxt->ecc_info.block_size);
> =20
> +	platform_set_drvdata(pdev, pdata);
>  	return 0;
> =20
>  fail_buf:
> @@ -596,11 +696,17 @@ static int ramoops_remove(struct platform_device *p=
dev)
>  	return 0;
>  }
> =20
> +static const struct of_device_id dt_match[] =3D {
> +	{ .compatible =3D "ramoops" },
> +	{}
> +};
> +
>  static struct platform_driver ramoops_driver =3D {
>  	.probe		=3D ramoops_probe,
>  	.remove		=3D ramoops_remove,
>  	.driver		=3D {
> -		.name	=3D "ramoops",
> +		.name		=3D "ramoops",
> +		.of_match_table	=3D dt_match,
>  	},
>  };
> =20
> --=20
> 2.6.0.rc2.230.g3dd15c0
>=20
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>=20

--=20
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--azLHFNyN32YCQGCU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWqJ+YAAoJEEpcgKtcEGQQMm4QAJboAp+U9F0CMmtoVJAASOGy
UsK1uN5csqJnOh+1BxEauzj1JmyIeoH2/N2JtuDyQggkd7r9jyrrBCjMgeRMnff+
NPJmVMLcb4bzShhWF35waQ0Ojmu1OMND+rrLQGZtOQzkiExUi1wT53V8307+QrOg
TGPxhVetI4rKuFo/T+DVdWPEYrFuizu7H6B/kCbbx4LUZcGjedJqkFjQ2sbBENz9
mohBKJBIlt9NDDVBGYersEwo/Hqn16MoxPGL4fHa/N8/2Fa6IaUsRe+m0qPCZCIx
252AuSzfAivuBq8BAk0pDJDTThEC0Ti9fcEmOnK4FSNT5HXjc1AfOUQ/+fP/s09o
hBVPsrZHqZBCbhnHvjGTXk0UZDYmODn8aFp/kHl0uUMXOYoLhOPOGb5A1tamzedN
QIWItztvfXlS31VkDrCEW80fLgjTvolmZhEAvifyK5OshcZv3Oe+tUgEyUZ62by8
3i1tbIYeSdsln6rEBj7guq9xd6JHxce4obw8oQxMWKT21OfUoRii/Zv96zb7dImM
fAl92+nahIyA7zEhrciWDA79Sfg0rmwJeGVgM60wan0ZupSpfob5av+lP8wNf2/y
DuA7mbNYAyPnStEZUsTUKq2LqM7SAsQBPhjLR+CULauAq+rV5QUuon1ql7BMzrnH
+fFHSyoRTDvowEcdQzls
=QqfU
-----END PGP SIGNATURE-----

--azLHFNyN32YCQGCU--
