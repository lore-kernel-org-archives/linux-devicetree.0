From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [RFC PATCH 2/4] dt-bindings: display: Convert
 ampire,am-480272h3tmqw-t01h panel to DT schema
Date: Thu, 20 Jun 2019 11:04:33 +0200
Message-ID: <20190620090433.GC26689@ulmo>
References: <20190619215156.27795-1-robh@kernel.org>
 <20190619215156.27795-2-robh@kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ncSAzJYg3Aa9+CRW"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190619215156.27795-2-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>, Maxime Ripard <maxime.ripard@bootlin.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
List-Id: devicetree@vger.kernel.org


--ncSAzJYg3Aa9+CRW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 19, 2019 at 03:51:54PM -0600, Rob Herring wrote:
> Convert the ampire,am-480272h3tmqw-t01h panel binding to DT schema.
>=20
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Maxime Ripard <maxime.ripard@bootlin.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  .../panel/ampire,am-480272h3tmqw-t01h.txt     | 26 ------------
>  .../panel/ampire,am-480272h3tmqw-t01h.yaml    | 41 +++++++++++++++++++
>  2 files changed, 41 insertions(+), 26 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/ampir=
e,am-480272h3tmqw-t01h.txt
>  create mode 100644 Documentation/devicetree/bindings/display/panel/ampir=
e,am-480272h3tmqw-t01h.yaml

Acked-by: Thierry Reding <treding@nvidia.com>

--ncSAzJYg3Aa9+CRW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl0LTCEACgkQ3SOs138+
s6GvOQ//XxDI3X8EUQGi0NRcbq7IOM9paPnzNrYo2a4zkZMJ5ujAQrRoZiW1J2FI
toUoyxQG9LTUGhOVrWccCwZEvmpvzJANlJRfgPL4Cpa49w75eywf7t4ZLnckaz4S
xUdHR2OV8cSl5WnrqEVBXnPIuafBv3DRdjw8VtI3EIOXE5LwvuQML1avCPbD71uB
SOFGia2wXlGoDfu4G/RW9LuEFoRbY9mZFIJxFFXLi9RvuGwP0/bPOsPbML+i+BJI
hV4hh3fvX3FiS/vl8DSAaUC+SFehXKJX8ch9Nw4VO8S++sE6FmR8PHUSiRIGN6Z1
KktrzUsJFs1oe4N0gRm+xZZHKzAGXS7VgOSp3Vjva49ZpTl3rJuShhMpMoWWikQB
WUjsONmVfQyOuzwMPSdHbRVbOK3XG40V9WB7gqv5R9ofoW7hNbhqdPAXnRtY3z1x
3eEukFHYOKl0mAzAYBHp+Zhro/94H50l+lrx12n6nwXoBB7VOix32BtWb6DHEhvr
ZKuGSbzhyZr7VPpyMt2xpSQr0c0y/NOCRGrnSZQ4pa06p3pEej04PyzxOmmv0dqm
/vE5lK4+78h9mDJrIByuWU1iv/3J4KiqBEb+v8i17+VE2hu48BbvdxpJ1D99y1Ys
MKW1PyO0J9gyj2P/dOwi60W/MfcyR+IDzJRyBJ19pbElya/zs4A=
=cdt8
-----END PGP SIGNATURE-----

--ncSAzJYg3Aa9+CRW--
