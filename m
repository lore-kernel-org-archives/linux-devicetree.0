From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 04/10] of/i2c: Add support for I2C_CLIENT_WAKE when
 booting with Device Tree
Date: Mon, 8 Oct 2012 08:32:58 +0100
Message-ID: <20121008073258.GA9707@gmail.com>
References: <1349451107-8009-1-git-send-email-lee.jones@linaro.org>
 <1349451107-8009-5-git-send-email-lee.jones@linaro.org>
 <506F2334.1040009@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <506F2334.1040009@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, arnd@arndb.de, linus.walleij@stericsson.com, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

On Fri, 05 Oct 2012, Rob Herring wrote:

> On 10/05/2012 10:31 AM, Lee Jones wrote:
> > It's important for wakeup sources such as keyboards, power buttons
> > and the like to identify themselves as wakeup devices. Until now
> > this has not been possible when platforms are booting via Device
> > Tree.
>=20
> A similar feature from Olof already went in for 3.7.

Ah yes, I see it. Thanks Rob.

> > Cc: Rob Herring <rob.herring@calxeda.com>
> > Cc: devicetree-discuss@lists.ozlabs.org
> > Acked-by: Linus Walleij <linus.walleij@linaro.org>
> > Signed-off-by: Lee Jones <lee.jones@linaro.org>
> > ---
> >  drivers/of/of_i2c.c |    3 +++
> >  1 file changed, 3 insertions(+)
> >=20
> > diff --git a/drivers/of/of_i2c.c b/drivers/of/of_i2c.c
> > index 1e173f3..2f20019 100644
> > --- a/drivers/of/of_i2c.c
> > +++ b/drivers/of/of_i2c.c
> > @@ -61,6 +61,9 @@ void of_i2c_register_devices(struct i2c_adapter *=
adap)
> >  		info.of_node =3D of_node_get(node);
> >  		info.archdata =3D &dev_ad;
> > =20
> > +		if (of_get_property(node, "i2c-client-wake", NULL))
> > +			info.flags |=3D I2C_CLIENT_WAKE;
> > +
> >  		request_module("%s%s", I2C_MODULE_PREFIX, info.type);
> > =20
> >  		result =3D i2c_new_device(adap, &info);
> >=20

--=20
Lee Jones
Linaro ST-Ericsson Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
