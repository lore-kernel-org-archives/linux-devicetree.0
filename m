From: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 4/6] dt-bindings: display: bridge: Add
 ICN6211 MIPI-DSI to RGB convertor bridge
Date: Fri, 15 Mar 2019 14:34:14 +0100
Message-ID: <20190315133414.5zwc5qtrivrbrzow@flea>
References: <20190315130825.9005-1-jagan@amarulasolutions.com>
 <20190315130825.9005-5-jagan@amarulasolutions.com>
Reply-To: maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ju6ym54ol55b4fyp"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBXGTV3SAKGQENM7JYSQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20190315130825.9005-5-jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
Cc: Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Laurent Pinchart <Laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Michael Trimarchi <michael-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-amarula-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org
List-Id: devicetree@vger.kernel.org


--ju6ym54ol55b4fyp
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline

On Fri, Mar 15, 2019 at 06:38:23PM +0530, Jagan Teki wrote:
> ICN6211 is MIPI-DSI/RGB converter bridge from chipone.
> It has a flexible configuration of MIPI DSI signal input
> and produce RGB565, RGB666, RGB888 output format.
> 
> Add dt-bingings for it.
> 
> Signed-off-by: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
> ---
>  .../display/bridge/chipone,icn6211.txt        | 36 +++++++++++++++++++
>  1 file changed, 36 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/chipone,icn6211.txt
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/chipone,icn6211.txt b/Documentation/devicetree/bindings/display/bridge/chipone,icn6211.txt
> new file mode 100644
> index 000000000000..7f13efd7ee7f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/chipone,icn6211.txt
> @@ -0,0 +1,36 @@
> +Chipone ICN6211 MIPI-DSI to RGB Convertor Bridge
> +
> +ICN6211 is MIPI-DSI/RGB converter bridge from chipone.
> +It has a flexible configuration of MIPI DSI signal input
> +and produce RGB565, RGB666, RGB888 output format.
> +
> +Required properties for RGB:
> +- compatible: must be "chipone,icn6211" and one of:
> +  * "bananapi,icn6211"

Why is that compatible needed?

> +- reg: the virtual channel number of a DSI peripheral
> +- reset-gpios: a GPIO phandle for the reset pin
> +
> +The device node can contain following 'port' child nodes,
> +according to the OF graph bindings defined in [1]:
> +  0: DSI Input, not required, if the bridge is DSI controlled
> +  1: RGB Output, mandatory

Your example doesn't have that input port

Maxime

-- 
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
--ju6ym54ol55b4fyp--
