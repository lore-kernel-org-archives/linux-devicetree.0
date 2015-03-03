From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/4] mfd: devicetree: bindings: Add Qualcomm RPM
 regulator subnodes
Date: Tue, 3 Mar 2015 12:47:00 +0000
Message-ID: <20150303124700.GN21293@sirena.org.uk>
References: <1425356740-26285-1-git-send-email-bjorn.andersson@sonymobile.com>
 <1425356740-26285-2-git-send-email-bjorn.andersson@sonymobile.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="nKOLaEIB3htjmFnT"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1425356740-26285-2-git-send-email-bjorn.andersson-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bjorn Andersson <bjorn.andersson-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
Cc: Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Andy Gross <agross-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--nKOLaEIB3htjmFnT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Mar 02, 2015 at 08:25:37PM -0800, Bjorn Andersson wrote:

> +- compatible:
> +	Usage: required
> +	Value type: <string>
> +	Definition: must be one of:
> +		    "qcom,rpm-pm8058-regulators"
> +		    "qcom,rpm-pm8901-regulators"
> +		    "qcom,rpm-pm8921-regulators"

Why do these subnodes have a compatible - do they ever appear except as
a child of a parent of the same type of device?

--nKOLaEIB3htjmFnT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJU9a1DAAoJECTWi3JdVIfQrXIH/3BPg2Kx0iQfq6PbrxxyIqEN
rPT9G2XL9nKb6HPOYoCx7Dg5hvu1//KOfWIADEO0hqFurr2MviZin4NWq7QXEE+L
FWqj98t8K8/+v0rTySZ2gYhDTytbrBoTWFVVVX18kfOo+gAwe1BpZQTlTAEMFfWr
mwYRDhKHyxMhS9skgcji/lVxE7dj4+LdZxBNxc4nDMiRut4p76N+6wrb4FHv4PNG
5pMMaHg/uY4kYZgoepAokNF3l79qdJs+sfeHPZfgBhsyck4LaM9lbLML6/n7sfel
g8LcrNjf9SRk0dKvHfEM/CTV9PlC8T1Xmx4zj8wvH3FscVJPQHPN3wnaQxl9MR8=
=FRZ2
-----END PGP SIGNATURE-----

--nKOLaEIB3htjmFnT--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
