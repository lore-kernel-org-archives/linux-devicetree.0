From: Rhyland Klein <rklein@nvidia.com>
Subject: Re: [PATCH v5] power: bq20z75: devicetree init support
Date: Mon, 28 Nov 2011 11:13:21 -0800
Message-ID: <1322507601.3888.2.camel@rklein-linux2>
References: <1316031547-18281-1-git-send-email-rklein@nvidia.com>
	 <20111124184215.GA29135@oksana.dev.rtsoft.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20111124184215.GA29135@oksana.dev.rtsoft.ru>
Sender: linux-kernel-owner@vger.kernel.org
To: Anton Vorontsov <cbouatmailru@gmail.com>
Cc: Grant Likely <grant.likely@secretlab.ca>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Thu, 2011-11-24 at 10:42 -0800, Anton Vorontsov wrote:
> Hello Rhyland,
>=20
> Got this:
>=20
>   CC [M]  drivers/power/bq20z75.o
> drivers/power/bq20z75.c: In function =E2=80=98bq20z75_of_populate_pda=
ta=E2=80=99:
> drivers/power/bq20z75.c:630:21: error: storage size of =E2=80=98gpio_=
flags=E2=80=99 isn=E2=80=99t known
> drivers/power/bq20z75.c:668:2: error: implicit declaration of functio=
n =E2=80=98of_get_named_gpio_flags=E2=80=99 [-Werror=3Dimplicit-functio=
n-declaration]
> drivers/power/bq20z75.c:671:19: error: =E2=80=98OF_GPIO_ACTIVE_LOW=E2=
=80=99 undeclared (first use in this function)
> drivers/power/bq20z75.c:671:19: note: each undeclared identifier is r=
eported only once for each function it appears in
> drivers/power/bq20z75.c:630:21: warning: unused variable =E2=80=98gpi=
o_flags=E2=80=99 [-Wunused-variable]
> drivers/power/bq20z75.c:627:29: warning: unused variable =E2=80=98dti=
d=E2=80=99 [-Wunused-variable]
>=20
> I fixed this by...
>=20
> On Wed, Sep 14, 2011 at 01:19:07PM -0700, Rhyland Klein wrote:
>=20
> > +#if defined(CONFIG_OF)
> > +#include <linux/of_device.h>
>=20
> Adding linux/of_gpio.h
>=20
> > +static const struct of_device_id bq20z75_dt_ids[] =3D {
> > +	{ .compatible =3D "ti,bq20z75" },
> > +	{ }
> > +};
> > +MODULE_DEVICE_TABLE(i2c, bq20z75_dt_ids);
> > +
> > +static struct bq20z75_platform_data *bq20z75_of_populate_pdata(
> > +	struct i2c_client *client)
> > +{
> > +	const struct of_device_id *dtid;
>=20
> And deleting that line.
>=20
>=20
> Applied to battery-2.6.git, but please double check if everything
> is OK.
>=20
> Thanks,
>=20

Yah, sorry about that. Seems things have changed a bit since I
originally sent out the patch. I synced battery-2.6 and everything look=
s
great.

thanks,
rhyland
