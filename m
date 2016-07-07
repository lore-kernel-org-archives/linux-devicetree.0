From: Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>
Subject: Re: [RFC/PATCH] dt: Add of_device_compatible_match()
Date: Thu, 07 Jul 2016 16:29:22 +1000
Message-ID: <1467872962.20157.1.camel@ellerman.id.au>
References: <1466981246.20278.27.camel@kernel.crashing.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1466981246.20278.27.camel-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, 2016-06-27 at 08:47 +1000, Benjamin Herrenschmidt wrote:
> This provides an equivalent of of_fdt_match() for non-flat trees.
>=C2=A0
> This is more practical than matching an array of of_device_id structs
> when converting a bunch of existing users of of_fdt_match().
>=C2=A0
> Signed-off-by: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
> ---
>=C2=A0
> This is a pre-requisite for some work I'm doing to move the platform
> identification in arch/powerpc until after we have unflattened the
> device-tree. Rewriting all those lists as of_device_id's would be
> significantly cumbersome.
>=C2=A0
> Note: untested other than it compiles. I want an agreement on the
> interface ASAP since the conversion of all the platforms is a burden
> I'd like to avoid doing twice.


Any comments on this?

We need it as a pre-req for a powerpc series, so unless anyone yells I'=
ll merge
it via there.

cheers

>=C2=A0
> diff --git a/drivers/of/base.c b/drivers/of/base.c
> index ebf84e3..429c594 100644
> --- a/drivers/of/base.c
> +++ b/drivers/of/base.c
> @@ -493,6 +493,28 @@ int of_device_is_compatible(const struct device_=
node *device,
> =C2=A0}
> =C2=A0EXPORT_SYMBOL(of_device_is_compatible);
> =C2=A0
> +/** Checks if the device is compatible with any of the entries in
> + *=C2=A0=C2=A0a NULL terminated array of strings. Returns the best m=
atch
> + *=C2=A0=C2=A0score or 0.
> + */
> +int of_device_compatible_match(struct device_node *device,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0const char *const *comp=
at)
> +{
> +	unsigned int tmp, score =3D 0;
> +
> +	if (!compat)
> +		return 0;
> +
> +	while (*compat) {
> +		tmp =3D of_device_is_compatible(device, *compat);
> +		if (tmp && (score =3D=3D 0 || (tmp < score)))
> +			score =3D tmp;
> +		compat++;
> +	}
> +
> +	return score;
> +}
> +
> =C2=A0/**
> =C2=A0 * of_machine_is_compatible - Test root of device tree for a gi=
ven compatible value
> =C2=A0 * @compat: compatible string to look for in root node's compat=
ible property.
> diff --git a/include/linux/of.h b/include/linux/of.h
> index 74eb28c..33c184d 100644
> --- a/include/linux/of.h
> +++ b/include/linux/of.h
> @@ -324,6 +324,8 @@ extern int of_property_read_string_helper(const s=
truct device_node *np,
> =C2=A0					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0const char **out_strs,=
 size_t sz, int index);
> =C2=A0extern int of_device_is_compatible(const struct device_node *de=
vice,
> =C2=A0				=C2=A0=C2=A0=C2=A0const char *);
> +extern int of_device_compatible_match(struct device_node *device,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0const char *const *compat);
> =C2=A0extern bool of_device_is_available(const struct device_node *de=
vice);
> =C2=A0extern bool of_device_is_big_endian(const struct device_node *d=
evice);
> =C2=A0extern const void *of_get_property(const struct device_node *no=
de,
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree"=
 in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at=C2=A0=C2=A0http://vger.kernel.org/majordomo-in=
fo.html
>=C2=A0


--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
