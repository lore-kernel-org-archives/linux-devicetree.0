From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH] gpio: stmpe: Add DT support for stmpe gpio
Date: Fri, 23 Nov 2012 10:41:40 +0000
Message-ID: <20121123104140.GP17471@gmail.com>
References: <912d88b8906ce87cf5459cf3d5798e03bfce34c7.1353649737.git.viresh.kumar@linaro.org>
 <20121123103400.GO17471@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20121123103400.GO17471@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: linus.walleij@linaro.org, grant.likely@secretlab.ca, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, spear-devel@list.st.com, Vipul Kumar Samar <vipulkumar.samar@st.com>
List-Id: devicetree@vger.kernel.org

> >  static struct mfd_cell stmpe_gpio_cell =3D {
> >  	.name		=3D "stmpe-gpio",
> > +	.of_compatible	=3D "st,stmpe-gpio",
>=20
> There's no need for any of the STMPE to have their own compatible
> string, as they are MFD devices. They are registered as platform
> devices from the MFD subsystem.

Whoops, I've written this in the wrong place.=20

Sorry, for the confusion. It does need to be here.

> >  	.resources	=3D stmpe_gpio_resources,
> >  	.num_resources	=3D ARRAY_SIZE(stmpe_gpio_resources),
> >  };
> > =20
> >  static struct mfd_cell stmpe_gpio_cell_noirq =3D {
> >  	.name		=3D "stmpe-gpio",
> > +	.of_compatible	=3D "st,stmpe-gpio",

=2E.. and here.

> > +++ b/Documentation/devicetree/bindings/gpio/gpio-stmpe.txt
> > @@ -0,0 +1,18 @@
> > +STMPE gpio
> > +----------
> > +
> > +Required properties:
> > + - compatible: "st,stmpe-gpio"

=2E.. but this is wrong.

> > +Example:
> > +	stmpe_gpio {
> > +		compatible =3D "st,stmpe-gpio";
> > +		st,norequest-mask =3D <0x20>;	//gpio 5 can't be used
> > +	};

As is the example.

So will be the the DT - if you've already written it.

--=20
Lee Jones
Linaro ST-Ericsson Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
