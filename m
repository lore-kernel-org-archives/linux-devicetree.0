From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH v4 3/3] Documentation: of: Document graph bindings
Date: Wed, 26 Feb 2014 15:57:03 +0100
Message-ID: <1393426623.3248.70.camel@paszta.hi.pengutronix.de>
References: <1393340304-19005-1-git-send-email-p.zabel@pengutronix.de>
	 <1393340304-19005-4-git-send-email-p.zabel@pengutronix.de>
	 <530DE8A9.9050809@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <530DE8A9.9050809@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc: Russell King - ARM Linux <linux@arm.linux.org.uk>, Mauro Carvalho Chehab <m.chehab@samsung.com>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Kyungmin Park <kyungmin.park@samsung.com>, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, Guennadi Liakhovetski <g.liakhovetski@gmx.de>
List-Id: devicetree@vger.kernel.org

Hi Tomi,

Am Mittwoch, den 26.02.2014, 15:14 +0200 schrieb Tomi Valkeinen:
> On 25/02/14 16:58, Philipp Zabel wrote:
>=20
> > +Optional endpoint properties
> > +----------------------------
> > +
> > +- remote-endpoint: phandle to an 'endpoint' subnode of a remote de=
vice node.
>=20
> Why is that optional? What use is an endpoint, if it's not connected =
to
> something?

This allows to include the an empty endpoint template in a SoC dtsi for
the convenience of board dts writers. Also, the same property is
currently listed as optional in video-interfaces.txt.

  soc.dtsi:
	display-controller {
		port {
			disp0: endpoint { };
		};
	};

  board.dts:
	#include "soc.dtsi"
	&disp0 {
		remote-endpoint =3D <&panel_input>;
	};
	panel {
		port {
			panel_in: endpoint {
				remote-endpoint =3D <&disp0>;
			};
		};
	};

Any board not using that port can just leave the endpoint disconnected.

On the other hand, the same could be achieved with Heiko St=C3=BCbner's
conditional nodes dtc patch:

  soc.dtsi:
	display-controller {
		port {
			/delete-unreferenced/ disp0: endpoint { };
		};
	};

> Also, if this is being worked on, I'd like to propose the addition of
> simpler single-endpoint cases which I've been using with OMAP DSS. So=
 if
> there's just a single endpoint for the device, which is very common, =
you
> can have just:
>=20
> device {
> 	...
> 	endpoint { ... };
> };
>=20
> However, I guess that the patch just keeps growing and growing, so ma=
ybe
> it's better to add such things later =3D).

Yes, that looks good. I'd be happy if we could add this in a second ste=
p
as a backwards compatible simplification.

regards
Philipp
