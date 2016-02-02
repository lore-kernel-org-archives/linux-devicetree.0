From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 2/2] dt-bindings: Add TPO TPG110 binding
Date: Tue, 2 Feb 2016 17:28:33 +0100
Message-ID: <20160202162833.GB4918@ulmo>
References: <1454316643-3931-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1763199281=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1454316643-3931-1-git-send-email-linus.walleij@linaro.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--===============1763199281==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="6sX45UoQRIJXqkqR"
Content-Disposition: inline


--6sX45UoQRIJXqkqR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 01, 2016 at 09:50:43AM +0100, Linus Walleij wrote:
> This adds device tree bindings for the TPO TPG110 panel found
> mounted in the Nomadik NHK8815.
>=20
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  .../bindings/display/panel/tpo,tpg110.txt          | 47 ++++++++++++++++=
++++++
>  1 file changed, 47 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/tpo,t=
pg110.txt
>=20
> diff --git a/Documentation/devicetree/bindings/display/panel/tpo,tpg110.t=
xt b/Documentation/devicetree/bindings/display/panel/tpo,tpg110.txt
> new file mode 100644
> index 000000000000..acbc6bef3593
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/tpo,tpg110.txt
> @@ -0,0 +1,47 @@
> +TPO TPG110 Panel
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +This binding builds on the DPI bindings, adding a few properties
> +as a superset of a DPI. See panel-dpi.txt for the required DPI
> +bindings.

It is unfortunate that we have these two types of bindings, one used by
some of the legacy fbdev drivers and the other by DRM/KMS drivers. There
isn't really much we can do about it, though, as far as I can see.

This panel is used with an fbdev driver, right?

Thierry

--6sX45UoQRIJXqkqR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJWsNkxAAoJEN0jrNd/PrOhJEAQAIoWQJxOymoNSitqfyI/9bKf
YxtsXuMzLB7DVExaXQq1gOBe0hn8+kLo6q2WhhStXtpFelK+Bi/P/whCo5j0lrQ0
oCdU3e1t+beQgeq/sBgWsodye3ni1RZVzTe4ZYt3v4PUHCBnbDxF/YTfvkPV5o3e
q27HW3YAp0wnKv7/clAU0S9OI0g0KLaZogCXmEHGNryb4B/QoK5dQhKNj4TQELyP
ASEqyjim62O4hKyapXqWGh/zHp43JM7heDHXxSfrN1x/hQOo5rvwtzIB6ZVU+tc/
Pp07ikpoyCMKRt91otOAFIqhPc8fF/kENvesrJGBOklhxlVV6YfMtR6Qrw50noYS
pOpKmZH9pH1kKutr7Bae5dfyHVPFnZYk3jjcTwHN72K0cs+kBfd3kq5UDYMSSeQX
vYz2vkRnbNYKq4sQTERzvi9dUip9DBBVM+jMFss/sOrSRc8K3FAedrQWjX8Hvx31
mgE/ayODg2FRV7uEB8AhB4c/NIa/KIL8eYKvE1QL8gU0HWqjpH4o7UlvThq8tY8q
TVDLF4GMWitQJWz1X7PWXv8FYzZg3Dv1QUdQHm71t8qWvm125aAWMVKnQn32SkF0
wYxcJuXDiA/GEmQTW6l5IM2aKoh2xLrC/+ninKGEbC7aA6tv4J1lEPkF3N7vdIVy
SQW73l17ajeqx/RFpBM2
=KL81
-----END PGP SIGNATURE-----

--6sX45UoQRIJXqkqR--

--===============1763199281==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

--===============1763199281==--
