From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/4] phy: miphy365x: Add Device Tree bindings for the
 MiPHY365x
Date: Wed, 5 Mar 2014 17:12:12 +0800
Message-ID: <20140305091212.GA10380@lee--X1>
References: <1392377036-12816-1-git-send-email-lee.jones@linaro.org>
 <20140305073422.GD20016@e106331-lin.cambridge.arm.com>
 <20140305084039.GB14902@lee--X1>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140305084039.GB14902@lee--X1>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "alexandre.torgue-qxv4g6HH51o@public.gmane.org" <alexandre.torgue-qxv4g6HH51o@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Srinivas Kandagatla <srinivas.kandagatla-qxv4g6HH51o@public.gmane.org>
List-Id: devicetree@vger.kernel.org

> > > +Specifying phy control of devices
> > > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > +
> > > +Device nodes should specify the configuration required in their =
"phys"
> > > +property, containing a phandle to the miphy device node, a port =
number
> > > +and a device type.
> > > +
> > > +Example:
> > > +
> > > +#include <dt-bindings/phy/phy-miphy365x.h>
> > > +
> > > +	sata0: sata@fe380000 {
> > > +		...
> > > +		phys	  =3D <&miphy365x_phy MIPHY_PORT_0 MIPHY_TYPE_SATA>;
> > > +		...
> > > +	};
> >=20
> > Is there not a generic phy binding we can point to? It seems a bit
> > redundant to do this in each phy binding.
>=20
> Sure, but that wouldn't make much of an example.
>=20
>   Documentation/devicetree/bindings/phy/phy-bindings.txt

Ah sorry, I see what you mean now.

No, not yet. That's the next thing to go up into Mainline.

I will replace this second example with a link when the other
documentation document has been accepted.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
