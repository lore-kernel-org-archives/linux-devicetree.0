From: Stephen Boyd <stephen.boyd-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 5/5] checks: Add bus checks for PCI buses
Date: Wed, 25 Jan 2017 14:37:28 -0800
Message-ID: <148538384894.3179.13621971850704403546@sboyd-linaro>
References: <20170124174534.3865-1-robh@kernel.org>
 <20170124174534.3865-6-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170124174534.3865-6-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Quoting Rob Herring (2017-01-24 09:45:34)
> @@ -587,7 +592,88 @@ static void fixup_path_references(struct check *c, s=
truct dt_info *dti,
>  }
>  ERROR(path_references, fixup_path_references, NULL, &duplicate_node_name=
s);
>  =

> +static bool is_pci_bridge(struct node *node)
> +{
> +       struct property *prop;
> +
> +       prop =3D get_property(node, "device_type");
> +       if (!prop)
> +               return false;
> +
> +       if (strcmp(prop->val.val, "pci") =3D=3D 0)
> +               return true;
> +
> +       return false;

This could be simplified?

	return strcmp(prop->val.val, "pci") =3D=3D 0;

> +}
> +
[...]
> +
> +struct bus_type pci_bus_type =3D {

static? const?

> +        .bridge_is_type =3D is_pci_bridge,
> +        .check_bridge =3D pci_check_bridge,
> +        .check_device =3D pci_check_device,
> +};
> +
>  struct bus_type *bus_types[] =3D {

static? const?

> +       &pci_bus_type,
>         NULL
>  };
> =20
