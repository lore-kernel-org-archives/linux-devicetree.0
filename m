From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH 1/2] extcon: arizona: Add device bindings for the micd
 configurations
Date: Mon, 14 Dec 2015 13:11:13 +0900
Message-ID: <566E4161.5070307@samsung.com>
References: <1449767299-29691-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1449767299-29691-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Cc: myungjoo.ham@samsung.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, patches@opensource.wolfsonmicro.com
List-Id: devicetree@vger.kernel.org

Hi Charles,

On 2015=EB=85=84 12=EC=9B=94 11=EC=9D=BC 02:08, Charles Keepax wrote:
> Add device bindings to support configuring the jack detection
> configurations. Each configuration needs to specify the connection of
> the mic det pins, which micbias should be used and the value of the
> micd polarity GPIO required to activate that configuration.
>=20
> Signed-off-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
> ---
>  drivers/extcon/extcon-arizona.c | 53 +++++++++++++++++++++++++++++++=
++++++++--
>  1 file changed, 51 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/extcon/extcon-arizona.c b/drivers/extcon/extcon-=
arizona.c
> index 8647533..edbf2e1 100644
> --- a/drivers/extcon/extcon-arizona.c
> +++ b/drivers/extcon/extcon-arizona.c
> @@ -1201,7 +1201,54 @@ static void arizona_micd_set_level(struct ariz=
ona *arizona, int index,
>  	regmap_update_bits(arizona->regmap, reg, mask, level);
>  }
> =20
> -static int arizona_extcon_device_get_pdata(struct arizona *arizona)
> +static int arizona_extcon_get_micd_configs(struct device *dev,
> +					   struct arizona *arizona)
> +{
> +	const char * const prop =3D "wlf,micd-configs";
> +	const int entries_per_config =3D 3;
> +	struct arizona_micd_config *micd_configs;
> +	int nconfs, ret;
> +	int i, j;
> +	u32 *vals;
> +
> +	nconfs =3D device_property_read_u32_array(arizona->dev, prop, NULL,=
 0);
> +	if (nconfs <=3D 0)
> +		return 0;
> +
> +	vals =3D kcalloc(nconfs, sizeof(u32), GFP_KERNEL);
> +	if (!vals)
> +		return -ENOMEM;
> +
> +	ret =3D device_property_read_u32_array(arizona->dev, prop, vals, nc=
onfs);
> +	if (ret < 0)
> +		goto out;
> +
> +	nconfs /=3D entries_per_config;
> +
> +	micd_configs =3D devm_kzalloc(dev,
> +				    nconfs * sizeof(struct arizona_micd_range),
> +				    GFP_KERNEL);
> +	if (!micd_configs) {
> +		ret =3D -ENOMEM;
> +		goto out;
> +	}
> +
> +	for (i =3D 0, j =3D 0; i < nconfs; ++i) {
> +		micd_configs[i].src =3D vals[j++] ? ARIZONA_ACCDET_SRC : 0;
> +		micd_configs[i].bias =3D vals[j++];
> +		micd_configs[i].gpio =3D vals[j++];
> +	}
> +
> +	arizona->pdata.micd_configs =3D micd_configs;
> +	arizona->pdata.num_micd_configs =3D nconfs;
> +
> +out:
> +	kfree(vals);
> +	return ret;
> +}
> +
> +static int arizona_extcon_device_get_pdata(struct device *dev,
> +					   struct arizona *arizona)
>  {
>  	struct arizona_pdata *pdata =3D &arizona->pdata;
>  	unsigned int val =3D ARIZONA_ACCDET_MODE_HPL;
> @@ -1249,6 +1296,8 @@ static int arizona_extcon_device_get_pdata(stru=
ct arizona *arizona)
>  	pdata->jd_gpio5_nopull =3D device_property_read_bool(arizona->dev,
>  						"wlf,use-jd2-nopull");
> =20
> +	arizona_extcon_get_micd_configs(dev, arizona);

You need to check out the return value of arizona_extcon_get_micd_confi=
gs().
If arizona_extcon_get_micd_configs() returns the error,=20
arizona_extcon_device_get_pdata() don't handle the error case.

> +
>  	return 0;
>  }
> =20
> @@ -1270,7 +1319,7 @@ static int arizona_extcon_probe(struct platform=
_device *pdev)
>  		return -ENOMEM;
> =20
>  	if (!dev_get_platdata(arizona->dev))
> -		arizona_extcon_device_get_pdata(arizona);
> +		arizona_extcon_device_get_pdata(&pdev->dev, arizona);
> =20
>  	info->micvdd =3D devm_regulator_get(&pdev->dev, "MICVDD");
>  	if (IS_ERR(info->micvdd)) {
>=20

Except for above comment, Looks good to me.
Acked-by: Chanwoo Choi <cw00.choi@samsung.com>

Thanks,
Chanwoo Choi
