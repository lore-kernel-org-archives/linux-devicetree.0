From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH v4] power: bq20z75: devicetree init support
Date: Wed, 14 Sep 2011 13:14:08 -0600
Message-ID: <CACxGe6uWvWz-8rFVv4HPs_DgoJabV2N0aUQTx7xJ8Zr6thkSMA@mail.gmail.com>
References: <1316023462-3287-1-git-send-email-rklein@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1316023462-3287-1-git-send-email-rklein@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rhyland Klein <rklein@nvidia.com>
Cc: Anton Vorontsov <cbouatmailru@gmail.com>, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Wed, Sep 14, 2011 at 12:04 PM, Rhyland Klein <rklein@nvidia.com> wro=
te:
> Adding support to generate platform data when kernel is configured
> through device tree.
>
> Also adding the binding for the TI bq20z75 fuel gadge and the
> bq20z75 driver.
>
> Signed-off-by: Rhyland Klein <rklein@nvidia.com>
> ---
> =A0 =A0 =A0 =A0v2: Fixed typo in binding description
> =A0 =A0 =A0 =A0v3: Changed to use "ti," for properties
> =A0 =A0 =A0 =A0 =A0 =A0Changed to use single gpio entry for battery d=
etect info.
> =A0 =A0 =A0 =A0 =A0 =A0Removed unnecessary call to of_match_device.
> =A0 =A0 =A0 =A0v4: squashed bindings and drivers changes together.
> =A0 =A0 =A0 =A0 =A0 =A0fixed case where CONFIG_OF is not selected, to=
 return existing
> =A0 =A0 =A0 =A0 =A0 =A0pdata pointer if it exists.

Nit: Personally, I'm much happier when the revision list is above the
--- line so it appears in the linux commit text.  That helps when
trying to figure out exactly which posting of a patch got merged.

>
> diff --git a/drivers/power/bq20z75.c b/drivers/power/bq20z75.c
> index 9c5e5be..4c4669e 100644
> --- a/drivers/power/bq20z75.c
> +++ b/drivers/power/bq20z75.c
> @@ -613,6 +613,78 @@ static void bq20z75_delayed_work(struct work_str=
uct *work)
> =A0 =A0 =A0 =A0}
> =A0}
>
> +#if defined(CONFIG_OF)
> +#include <linux/of_device.h>
> +static const struct of_device_id bq20z75_dt_ids[] =3D {
> + =A0 =A0 =A0 { .compatible =3D "ti,bq20z75" },
> + =A0 =A0 =A0 { }
> +};
> +MODULE_DEVICE_TABLE(platform, bq20z75_dt_ids);

MODULE_DEVICE_TABLE(of, ...)

It's not a platform_device_id table.

Otherwise:

Acked-by: Grant Likely <grant.likely@secretlab.ca>
