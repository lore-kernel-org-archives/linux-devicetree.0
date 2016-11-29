From: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Subject: Re: [PATCH v7 2/8] drm/sun8i: Add DT bindings
 documentation of Allwinner DE2
Date: Tue, 29 Nov 2016 20:41:30 +0200
Message-ID: <36111311.d8ul9hQ2CU@avalon>
References: <cover.1480414715.git.moinejf@free.fr> <92fc53084274d5ab04fe28f2dc0b16cf5d94481e.1480414715.git.moinejf@free.fr>
Reply-To: laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDKM3GOS4YHBBTEX67AQKGQEFL62VTA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <92fc53084274d5ab04fe28f2dc0b16cf5d94481e.1480414715.git.moinejf-GANU6spQydw@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: Jean-Francois Moine <moinejf-GANU6spQydw@public.gmane.org>, Dave Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Jean-Fran=C3=A7ois,

Thank you for the patch.

On Monday 28 Nov 2016 19:02:39 Jean-Francois Moine wrote:
> Signed-off-by: Jean-Francois Moine <moinejf-GANU6spQydw@public.gmane.org>
> ---
>  .../bindings/display/sunxi/sun8i-de2.txt           | 121 +++++++++++++++=
+++
>  1 file changed, 121 insertions(+)
>  create mode 100644
> Documentation/devicetree/bindings/display/sunxi/sun8i-de2.txt
>=20
> diff --git a/Documentation/devicetree/bindings/display/sunxi/sun8i-de2.tx=
t
> b/Documentation/devicetree/bindings/display/sunxi/sun8i-de2.txt new file
> mode 100644
> index 0000000..edf38b8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/sunxi/sun8i-de2.txt
> @@ -0,0 +1,121 @@
> +Allwinner sun8i Display Engine 2 subsystem
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +The Allwinner DE2 subsystem contains a display controller (DE2),
> +one or two LCD controllers (Timing CONtrollers) and their external
> +interfaces (encoders/connectors).
> +
> +          +-----------+
> +          | DE2       |
> +          |           |
> +          | +-------+ |
> +  plane --->|       | |   +------+
> +          | | mixer |---->| TCON |---> encoder  ---> display
> +  plane --->|       | |   +------+     connector     device
> +          | +-------+ |
> +          |           |
> +          | +-------+ |
> +  plane --->|       | |   +------+
> +          | | mixer |---->| TCON |---> encoder  ---> display
> +  plane --->|       | |   +------+     connector     device
> +          | +-------+ |
> +          +-----------+
> +
> +The DE2 contains a processor which mixes the input planes and creates
> +the images which are sent to the TCONs.
> +From the software point of vue, there are 2 independent real-time
> +mixers, each one being statically associated to one TCON.
> +
> +The TCONs adjust the image format to the one of the display device.
> +
> +Display controller (DE2)
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Required properties:
> +
> +- compatible: value should be one of the following
> +		"allwinner,sun8i-a83t-display-engine"
> +		"allwinner,sun8i-h3-display-engine"
> +
> +- reg: base address and size of the I/O memory
> +
> +- clocks: must include clock specifiers corresponding to entries in the
> +		clock-names property.
> +
> +- clock-names: must contain
> +		"bus": bus gate
> +		"clock": clock
> +
> +- resets: phandle to the reset of the device
> +
> +- ports: must contain a list of 2 phandles, indexed by mixer number,
> +	and pointing to display interface ports of TCONs
> +
> +LCD controller (TCON)
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Required properties:
> +
> +- compatible: should be
> +		"allwinner,sun8i-a83t-tcon"
> +
> +- reg: base address and size of the I/O memory
> +
> +- clocks: must include clock specifiers corresponding to entries in the
> +		clock-names property.
> +
> +- clock-names: must contain
> +		"bus": bus gate
> +		"clock": pixel clock
> +
> +- resets: phandle to the reset of the device
> +
> +- interrupts: interrupt number for the TCON
> +
> +- port: port node with endpoint definitions as defined in
> +	Documentation/devicetree/bindings/media/video-interfaces.txt
> +
> +Example:
> +
> +	de: de-controller@01000000 {
> +		compatible =3D "allwinner,sun8i-h3-display-engine";
> +		reg =3D <0x01000000 0x400000>;
> +		clocks =3D <&ccu CLK_BUS_DE>, <&ccu CLK_DE>;
> +		clock-names =3D "bus", "clock";
> +		resets =3D <&ccu RST_BUS_DE>;
> +		ports =3D <&tcon0_p>, <&tcon1_p>;

This isn't how the OF graph DT bindings are used. You should instead have

	ports {
		#address-cells =3D <1>;
		#size-cells =3D <0>;
		port@0 {
			de_out_0: endpoint {
				remote_endpoint =3D <&tcon0_hdmi>;
			};
		};
		port@1 {
			/* No endpoint as the port is not connected */
		};
	};

> +	};
> +
> +	tcon0: lcd-controller@01c0c000 {
> +		compatible =3D "allwinner,sun8i-a83t-tcon";
> +		reg =3D <0x01c0c000 0x400>;
> +		clocks =3D <&ccu CLK_BUS_TCON0>, <&ccu CLK_TCON0>;
> +		clock-names =3D "bus", "clock";
> +		resets =3D <&ccu RST_BUS_TCON0>;
> +		interrupts =3D <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +		tcon0_p: port {
> +			tcon0_hdmi: endpoint {
> +				remote-endpoint =3D <&hdmi_tcon0>;
> +			};
> +		};

and here

	port {
		tcon0_hdmi: endpoint {
			remote-endpoint =3D <&de_out_0>;
		};
	};

> +	};
> +
> +	/* not used */
> +	tcon1: lcd-controller@01c0d000 {
> +		compatible =3D "allwinner,sun8i-h3-tcon";
> +		reg =3D <0x01c0d000 0x400>;
> +		clocks =3D <&ccu CLK_BUS_TCON1>,
> +			 <&ccu CLK_TCON0>;	/* no clock */
> +		clock-names =3D "bus", "clock";
> +		interrupts =3D <GIC_SPI 87 IRQ_TYPE_LEVEL_HIGH>;
> +		status =3D "disabled";
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +		tcon1_p: port {
> +			endpoint {
> +				/* empty */
> +			};
> +		};

and here

	port {
		/* No endpoint as the port is not connected */
	};

(although I'm not sure why you don't connect it)

> +	};

--=20
Regards,

Laurent Pinchart

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
