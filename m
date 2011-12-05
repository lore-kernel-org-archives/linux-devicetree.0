From: Thomas Abraham <thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 2/4] regulator: pass device_node to
 of_get_regulator_init_data()
Date: Mon, 5 Dec 2011 23:52:45 +0530
Message-ID: <CAJuYYwShCJ5kWRNuQRCFsGptfXwKA9ogVD8=3WO-N9FFSFca1g@mail.gmail.com>
References: <1322731268-12158-1-git-send-email-shawn.guo@linaro.org>
 <1322731268-12158-3-git-send-email-shawn.guo@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1322731268-12158-3-git-send-email-shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>, =?ISO-8859-1?Q?Uwe_Kleine=2DK=F6nig?= <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 1 December 2011 14:51, Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> It's not always true that the device_node of regulator can be found
> at dev->of_node at the time when of_get_regulator_init_data() is being
> called, because in some cases the regulator nodes in device tree do
> not have 'struct device' behind them until regulator_dev gets created
> for it by core function regulator_register().
>
> The patch adds device_node as a new parameter to
> of_get_regulator_init_data(), so that caller can pass in the node of
> regulator directly.
>
> Signed-off-by: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Cc: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
> Cc: Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>
> ---
> =A0drivers/regulator/fixed.c =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0 =A02 +-
> =A0drivers/regulator/of_regulator.c =A0 =A0 =A0 | =A0 =A07 ++++---
> =A0include/linux/regulator/of_regulator.h | =A0 =A06 ++++--
> =A03 files changed, 9 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/regulator/fixed.c b/drivers/regulator/fixed.c
> index 72abbf5..a44a017 100644
> --- a/drivers/regulator/fixed.c
> +++ b/drivers/regulator/fixed.c
> @@ -64,7 +64,7 @@ of_get_fixed_voltage_config(struct device *dev)
> =A0 =A0 =A0 =A0if (!config)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return NULL;
>
> - =A0 =A0 =A0 config->init_data =3D of_get_regulator_init_data(dev);
> + =A0 =A0 =A0 config->init_data =3D of_get_regulator_init_data(dev, dev->=
of_node);
> =A0 =A0 =A0 =A0if (!config->init_data)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return NULL;
>
> diff --git a/drivers/regulator/of_regulator.c b/drivers/regulator/of_regu=
lator.c
> index acd7045..6caf641 100644
> --- a/drivers/regulator/of_regulator.c
> +++ b/drivers/regulator/of_regulator.c
> @@ -66,18 +66,19 @@ static void of_get_regulation_constraints(struct devi=
ce_node *np,
> =A0* tree node, returns a pointer to the populated struture or NULL if me=
mory
> =A0* alloc fails.
> =A0*/
> -struct regulator_init_data *of_get_regulator_init_data(struct device *de=
v)
> +struct regulator_init_data *of_get_regulator_init_data(struct device *de=
v,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 struct device_node *node)

The new parameter 'node' should be added in the documentation which is
above this function.

> =A0{
> =A0 =A0 =A0 =A0struct regulator_init_data *init_data;
>
> - =A0 =A0 =A0 if (!dev->of_node)
> + =A0 =A0 =A0 if (!node)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return NULL;
>
> =A0 =A0 =A0 =A0init_data =3D devm_kzalloc(dev, sizeof(*init_data), GFP_KE=
RNEL);
> =A0 =A0 =A0 =A0if (!init_data)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return NULL; /* Out of memory? */
>
> - =A0 =A0 =A0 of_get_regulation_constraints(dev->of_node, &init_data);
> + =A0 =A0 =A0 of_get_regulation_constraints(node, &init_data);
> =A0 =A0 =A0 =A0return init_data;
> =A0}
> =A0EXPORT_SYMBOL_GPL(of_get_regulator_init_data);
> diff --git a/include/linux/regulator/of_regulator.h b/include/linux/regul=
ator/of_regulator.h
> index d83a98d..769704f 100644
> --- a/include/linux/regulator/of_regulator.h
> +++ b/include/linux/regulator/of_regulator.h
> @@ -8,10 +8,12 @@
>
> =A0#if defined(CONFIG_OF)
> =A0extern struct regulator_init_data
> - =A0 =A0 =A0 *of_get_regulator_init_data(struct device *dev);
> + =A0 =A0 =A0 *of_get_regulator_init_data(struct device *dev,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 str=
uct device_node *node);
> =A0#else
> =A0static inline struct regulator_init_data
> - =A0 =A0 =A0 *of_get_regulator_init_data(struct device *dev)
> + =A0 =A0 =A0 *of_get_regulator_init_data(struct device *dev,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 str=
uct device_node *node)
> =A0{
> =A0 =A0 =A0 =A0return NULL;
> =A0}

This was useful while adding regulator DT support for Origen board.
Acked-by: Thomas Abraham <thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>


> --
> 1.7.4.1
>
> _______________________________________________
> devicetree-discuss mailing list
> devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> https://lists.ozlabs.org/listinfo/devicetree-discuss
>
