From: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Subject: Re: [PATCH v1 1/3] drm/stm: ltdc: Add bridge support
Date: Thu, 18 May 2017 11:31:20 -0700
Message-ID: <87y3tuj9tz.fsf@eliezer.anholt.net>
References: <1494600989-13507-1-git-send-email-philippe.cornu@st.com> <1494600989-13507-2-git-send-email-philippe.cornu@st.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1494600989-13507-2-git-send-email-philippe.cornu-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Benjamin Gaignard <benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Yannick Fertre <yannick.fertre-qxv4g6HH51o@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org, Philippe Cornu <philippe.cornu-qxv4g6HH51o@public.gmane.org>, Fabien Dessenne <fabien.dessenne-qxv4g6HH51o@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Mickael Reulier <mickael.reulier-qxv4g6HH51o@public.gmane.org>, Vincent Abriou <vincent.abriou-qxv4g6HH51o@public.gmane.org>, Gabriel Fernandez <gabriel.fernandez-qxv4g6HH51o@public.gmane.org>, Ludovic Barre <ludovic.barre-qxv4g6HH51o@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Philippe CORNU <philippe.cornu-qxv4g6HH51o@public.gmane.org> writes:

> Add the bridge support, used by DSI host and HDMI/LVDS bridges.
>
> Signed-off-by: Philippe CORNU <philippe.cornu-qxv4g6HH51o@public.gmane.org>

> @@ -987,19 +1024,36 @@ static struct drm_panel *ltdc_get_panel(struct drm=
_device *ddev)
>=20=20
>  		port =3D of_graph_get_remote_port_parent(entity);
>  		if (port) {
> +			struct drm_bridge *bridge;
> +			struct drm_panel *panel;
> +
> +			bridge =3D of_drm_find_bridge(port);
>  			panel =3D of_drm_find_panel(port);
> -			of_node_put(port);
> +			if (!bridge && !panel) {
> +				of_node_put(entity);
> +				return -EPROBE_DEFER;
> +			}
> +
> +			if (bridge) {
> +				if (!ldev->bridge) {
> +					ldev->bridge =3D bridge;
> +					DRM_INFO("remote bridge %s\n",
> +						 port->full_name);
> +				}
> +			}
> +
>  			if (panel) {
> -				DRM_DEBUG_DRIVER("remote panel %s\n",
> +				if (!ldev->panel) {
> +					ldev->panel =3D panel;
> +					DRM_INFO("remote panel %s\n",
>  						 port->full_name);
> -			} else {
> -				DRM_DEBUG_DRIVER("panel missing\n");
> -				of_node_put(entity);
> +				}
>  			}
> +			of_node_put(port);

Is it possible to use drm_of_find_panel_or_bridge() instead?  I don't
think it makes sense to have both a bridge and a panel for the same
node, does it?

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAlkd6HgACgkQtdYpNtH8
nuiIohAAr3E/v8Dqkmns/1sQG8L6or+3XC3Cvf8qXTkqGEIbeXLS2EcF3ijvZyTb
/yho2s9URl0BsQaA/kCt2JtPWI0Bwkybd6NeVLaX1G0hBahU1uZs5nhIF37Zg65X
C9mpeU0HVEAj3Eyjr3OuF636a+Q/CALZj3y473HYzcgvYcpMNBU8LuagAjd8IxW7
82WwhCxl8/IPeHkq0Gm6JwVUMIcFvKkVGRkRTKGctfPDMQ8cr1Ezf52lRxBJW7ra
uxc+YU/zz6OanXNVcpKV7KwXxrtjGDxkLvjG8ZMSDAHB6+WzZDpn3dUTh//6nWcB
s0j7u4XT2S6NuHvS1cQ0+x1ujkMzcHWy9G8b+VUcgZ07cZVq+xWRcbJIKXAlypvv
WZqcVEF6MoOjRdgdtLYw4BkwxhjaJxc0FdcQx9RO4Pzb2Lnc9vkpwkQb2S4HHPxA
VTj9rdkHEJ/3k364wYISpTMJhD7yR05dTzJVczrJj6LbuTsdsU5tfRcKCKW8iCJU
Q2qyZzk8jIv8TTBUVR40KYZeeuYO1wSol2ts6sim3qoID7EBIhV8j4yhEC+arshF
uMvTLj1Hr7pJnTeRAicafMkC2LLGYujtylNZzRdjc/Rli5Q21J8bOThmtTZElDnm
aNYYaDBDFswzIaG+RerbeK01kCeODG4XLv+32ByOh7DUzcgP/Vo=
=9hWP
-----END PGP SIGNATURE-----
--=-=-=--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
