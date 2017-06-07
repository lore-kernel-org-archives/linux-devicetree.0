From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 03/11] drm: sun4i: ignore swapped mixer<->tcon
 connection for DE2
Date: Wed, 7 Jun 2017 11:35:12 +0200
Message-ID: <20170607093512.rfvpefmyskgjw3ik@flea.lan>
References: <20170604160149.30230-1-icenowy@aosc.io>
 <20170604160149.30230-4-icenowy@aosc.io>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="ibbxel3q6tzagnbt"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170604160149.30230-4-icenowy-h8G6r0blFSE@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--ibbxel3q6tzagnbt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 05, 2017 at 12:01:41AM +0800, Icenowy Zheng wrote:
> Some SoC's DE2 has two mixers. Defaultly the mixer0 is connected to
> tcon0 and mixer1 is connected to tcon1; however by setting a bit
> the connection can be swapped.
>=20
> As we now hardcode the default connection, ignore the bonus endpoint for
> the mixer's output and the TCON's input, as they stands for the swapped
> connection.
>=20
> Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>

So, I'm still not quite sure what this patch exactly is supposed to be
doing.

You mention that the routing between the mixers and tcons can be
changed, and that we need to ignore the TCON input...

> ---
> Changes in v2:
> - Change to use new endpoint reg definition.
>=20
>  drivers/gpu/drm/sun4i/sun4i_drv.c  | 45 ++++++++++++++++++++++++++++
>  drivers/gpu/drm/sun4i/sun4i_tcon.c | 61 ++++++++++++++++++++++++++++++++=
------
>  drivers/gpu/drm/sun4i/sun4i_tcon.h |  2 ++
>  3 files changed, 99 insertions(+), 9 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/sun4i/sun4i_drv.c b/drivers/gpu/drm/sun4i/su=
n4i_drv.c
> index f19100c91c2b..775eee82d8a9 100644
> --- a/drivers/gpu/drm/sun4i/sun4i_drv.c
> +++ b/drivers/gpu/drm/sun4i/sun4i_drv.c
> @@ -178,6 +178,13 @@ static bool sun4i_drv_node_is_frontend(struct device=
_node *node)
>  		of_device_is_compatible(node, "allwinner,sun8i-a33-display-frontend");
>  }
> =20
> +static bool sun4i_drv_node_is_swappable_de2_mixer(struct device_node *no=
de)
> +{
> +	/* The V3s has only one mixer-tcon pair, so it's not listed here. */
> +	return of_device_is_compatible(node, "allwinner,sun8i-h3-de2-mixer0") ||
> +		of_device_is_compatible(node, "allwinner,sun8i-h3-de2-mixer1");
> +}
> +
>  static bool sun4i_drv_node_is_tcon(struct device_node *node)
>  {
>  	return of_device_is_compatible(node, "allwinner,sun5i-a13-tcon") ||
> @@ -261,6 +268,44 @@ static int sun4i_drv_add_endpoints(struct device *de=
v,
>  			}
>  		}
> =20
> +		/*
> +		 * The second endpoint of the output of a swappable DE2 mixer
> +		 * is the TCON after connection swapping.
> +		 * Ignore it now, as we now hardcode mixer0->tcon0,
> +		 * mixer1->tcon1 connection.
> +		 */
> +		if (sun4i_drv_node_is_swappable_de2_mixer(node)) {
> +			struct device_node *remote_ep_node;
> +			struct of_endpoint local_endpoint, remote_endpoint;
> +
> +			remote_ep_node =3D of_graph_get_remote_endpoint(ep);
> +			if (!remote_ep_node) {
> +				DRM_DEBUG_DRIVER("Couldn't get remote endpoint\n");
> +				continue;
> +			}
> +
> +			if (of_graph_parse_endpoint(ep, &local_endpoint)) {
> +				DRM_DEBUG_DRIVER("Couldn't parse local endpoint\n");
> +				of_node_put(remote_ep_node);
> +				continue;
> +			}
> +
> +			if (of_graph_parse_endpoint(remote_ep_node,
> +						    &remote_endpoint)) {
> +				DRM_DEBUG_DRIVER("Couldn't parse remote endpoint\n");
> +				of_node_put(remote_ep_node);
> +				continue;
> +			}
> +
> +			if (local_endpoint.id !=3D remote_endpoint.id) {
> +				DRM_DEBUG_DRIVER("Endpoint is an unused connection for DE2 mixer... =
skipping\n");
> +				of_node_put(remote_ep_node);
> +				continue;
> +			}
> +
> +			of_node_put(remote_ep_node);
> +		}
> +
>  		/* Walk down our tree */
>  		count +=3D sun4i_drv_add_endpoints(dev, match, remote);

=2E.. yet this is not parsing the input at all, but only the output nodes.


> diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c b/drivers/gpu/drm/sun4i/s=
un4i_tcon.c
> index d9791292553e..568cea0e5f8f 100644
> --- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
> +++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
> @@ -464,7 +464,8 @@ static int sun4i_tcon_init_regmap(struct device *dev,
>   * requested via the get_id function of the engine.
>   */
>  static struct sunxi_engine *sun4i_tcon_find_engine(struct sun4i_drv *drv,
> -						   struct device_node *node)
> +						   struct device_node *node,
> +						   bool skip_bonus_ep)
>  {
>  	struct device_node *port, *ep, *remote;
>  	struct sunxi_engine *engine;
> @@ -478,6 +479,42 @@ static struct sunxi_engine *sun4i_tcon_find_engine(s=
truct sun4i_drv *drv,
>  		if (!remote)
>  			continue;
> =20
> +		if (skip_bonus_ep) {
> +			struct device_node *remote_ep_node;
> +			struct of_endpoint local_endpoint, remote_endpoint;
> +
> +			remote_ep_node =3D of_graph_get_remote_endpoint(ep);
> +			if (!remote_ep_node) {
> +				DRM_DEBUG_DRIVER("Couldn't get remote endpoint\n");
> +				of_node_put(remote);
> +				continue;
> +			}
> +
> +			if (of_graph_parse_endpoint(ep, &local_endpoint)) {
> +				DRM_DEBUG_DRIVER("Couldn't parse local endpoint\n");
> +				of_node_put(remote);
> +				of_node_put(remote_ep_node);
> +				continue;
> +			}
> +
> +			if (of_graph_parse_endpoint(remote_ep_node,
> +						    &remote_endpoint)) {
> +				DRM_DEBUG_DRIVER("Couldn't parse remote endpoint\n");
> +				of_node_put(remote);
> +				of_node_put(remote_ep_node);
> +				continue;
> +			}
> +
> +			if (local_endpoint.id !=3D remote_endpoint.id) {
> +				DRM_DEBUG_DRIVER("Skipping bonus mixer->TCON connection when searchi=
ng engine\n");
> +				of_node_put(remote);
> +				of_node_put(remote_ep_node);
> +				continue;
> +			}
> +
> +			of_node_put(remote_ep_node);
> +		}
> +

I have no idea what this is supposed to be doing either.

I might be wrong, but I really feel like there's a big mismatch
between your commit log, and what you actually implement.

In your commit log, you should state:

A) What is the current behaviour
B) Why that is a problem
C) How do you address it

And you don't.

However, after discussing it with Chen-Yu, it seems like you're trying
to have all the mixers probed before the TCONs. If that is so, there's
nothing specific to the H3 here, and we also have the same issue on
dual-pipeline DE1 (A10, A20, A31). Chen-Yu worked on that a bit, but
the easiest solution would be to move from a DFS algorithm to walk
down the graph to a BFS one.

That way, we would add all mixers first, then the TCONs, then the
encoders, and the component framework will probe them in order.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--ibbxel3q6tzagnbt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZN8jQAAoJEBx+YmzsjxAg97oQAKB8UJuyLxiJclFF5F7HafQv
fpBw4D0iap4HuC8md9SKy9AnoR20Ov0GHRyj9GEizDCnZuIJNTBu1Jt8ClCUcgWY
VCj0hyi/NhnFlr9ehkEae9ZlOikljO681abk728QZgxWYt9X1ALai/ucDTjYQG00
CrUrgNXwFl7idvz4ANAF3mKj8VWnbeEg75JrfaiQUdENpEFUN4KhB9tXKYNmFFnJ
/YdUryL5JHMlRTxqfPHkW9rav1PoZVFSWrNXACO53c2ZYGLBqRbU7i5ZfNHLcafE
mMl5deg5WsxQ7K3cbGH6LTaGqS2WfM7inNKNW0ykdPmsb9PiU1WyOR4hglrGW1e4
vbevq5pb6oNIwosGqaKQFLYIUYLqsAZ4WkNS4685RmoYMA2MCF/Hx+JjKBJ6QoQP
eW7vCLtRTaK6Td9ESFapWdCTOIlv5EKZEd5lP2yRJjjaysmYIgwwGBmzj/qmxhDn
3S41tybd547rskMJVUT9aqYA5aKXXhfu/L/T6umL+MlG38ZdvRwMLd8beoAY9KoP
YGlHZAnGcnajrEKo9HmOuO6Xn9DylRAyJDyd+hhs0nQfG+xk3XizHpoeG6f1VJs0
VknixIxLuAih/D53bDXiZ+mmSXF7uBh3EWSC2lHwmvuuO1dAdiKW8TcRkicSGIFE
gA+5VXwD9hVmLB/YMtup
=owa/
-----END PGP SIGNATURE-----

--ibbxel3q6tzagnbt--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
