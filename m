From: Anton Vorontsov <cbouatmailru@gmail.com>
Subject: Re: [PATCH v5] power: bq20z75: devicetree init support
Date: Thu, 24 Nov 2011 22:42:15 +0400
Message-ID: <20111124184215.GA29135@oksana.dev.rtsoft.ru>
References: <1316031547-18281-1-git-send-email-rklein@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1316031547-18281-1-git-send-email-rklein@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rhyland Klein <rklein@nvidia.com>
Cc: Grant Likely <grant.likely@secretlab.ca>, linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hello Rhyland,

Got this:

  CC [M]  drivers/power/bq20z75.o
drivers/power/bq20z75.c: In function =E2=80=98bq20z75_of_populate_pdata=
=E2=80=99:
drivers/power/bq20z75.c:630:21: error: storage size of =E2=80=98gpio_fl=
ags=E2=80=99 isn=E2=80=99t known
drivers/power/bq20z75.c:668:2: error: implicit declaration of function =
=E2=80=98of_get_named_gpio_flags=E2=80=99 [-Werror=3Dimplicit-function-=
declaration]
drivers/power/bq20z75.c:671:19: error: =E2=80=98OF_GPIO_ACTIVE_LOW=E2=80=
=99 undeclared (first use in this function)
drivers/power/bq20z75.c:671:19: note: each undeclared identifier is rep=
orted only once for each function it appears in
drivers/power/bq20z75.c:630:21: warning: unused variable =E2=80=98gpio_=
flags=E2=80=99 [-Wunused-variable]
drivers/power/bq20z75.c:627:29: warning: unused variable =E2=80=98dtid=E2=
=80=99 [-Wunused-variable]

I fixed this by...

On Wed, Sep 14, 2011 at 01:19:07PM -0700, Rhyland Klein wrote:

> +#if defined(CONFIG_OF)
> +#include <linux/of_device.h>

Adding linux/of_gpio.h

> +static const struct of_device_id bq20z75_dt_ids[] =3D {
> +	{ .compatible =3D "ti,bq20z75" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(i2c, bq20z75_dt_ids);
> +
> +static struct bq20z75_platform_data *bq20z75_of_populate_pdata(
> +	struct i2c_client *client)
> +{
> +	const struct of_device_id *dtid;

And deleting that line.


Applied to battery-2.6.git, but please double check if everything
is OK.

Thanks,

--=20
Anton Vorontsov
Email: cbouatmailru@gmail.com
