From: Jianqun <xjq-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: Re: [PATCH 1/2] ASoC: rockchip-max98090: add driver for rockchip
 board using a max98090
Date: Tue, 21 Oct 2014 14:02:34 +0800
Message-ID: <5445F6FA.3000706@rock-chips.com>
References: <1412646237-9369-1-git-send-email-jay.xu@rock-chips.com> <1412646237-9369-2-git-send-email-jay.xu@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1412646237-9369-2-git-send-email-jay.xu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jianqun <jay.xu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, perex-/Fr2/VpizcU@public.gmane.org, tiwai-l3A5Bk7waGM@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi , could someone help to review my patch ?

=E5=9C=A8 10/07/2014 09:43 AM, Jianqun =E5=86=99=E9=81=93:
> The driver is used for rockchip board using a max98090.
> Test on RK3288 board with max98090.
>
> Signed-off-by: Jianqun Xu <jay.xu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> ---
>  sound/soc/rockchip/Kconfig             |   9 +
>  sound/soc/rockchip/Makefile            |   5 +-
>  sound/soc/rockchip/rockchip_max98090.c | 346 +++++++++++++++++++++++=
++++++++++
>  3 files changed, 359 insertions(+), 1 deletion(-)
>  create mode 100644 sound/soc/rockchip/rockchip_max98090.c
>
> diff --git a/sound/soc/rockchip/Kconfig b/sound/soc/rockchip/Kconfig
> index 78fc159..f82fbf5 100644
> --- a/sound/soc/rockchip/Kconfig
> +++ b/sound/soc/rockchip/Kconfig
> @@ -9,3 +9,12 @@ config SND_SOC_ROCKCHIP
> =20
>  config SND_SOC_ROCKCHIP_I2S
>  	tristate
> +
> +config SND_SOC_ROCKCHIP_MAX98090
> +	tristate "ASoC support for Rockchip boards using a MAX98090 codec"
> +	depends on SND_SOC_ROCKCHIP && I2C && GPIOLIB
> +	select SND_SOC_ROCKCHIP_I2S
> +	select SND_SOC_MAX98090
> +	help
> +	  Say Y or M here if you want to add support for SoC audio on Rockc=
hip
> +	  boards using the MAX98090 codec, such as Veyron.
> diff --git a/sound/soc/rockchip/Makefile b/sound/soc/rockchip/Makefil=
e
> index b921909..c324411 100644
> --- a/sound/soc/rockchip/Makefile
> +++ b/sound/soc/rockchip/Makefile
> @@ -1,4 +1,7 @@
>  # ROCKCHIP Platform Support
>  snd-soc-i2s-objs :=3D rockchip_i2s.o
> -
>  obj-$(CONFIG_SND_SOC_ROCKCHIP_I2S) +=3D snd-soc-i2s.o
> +
> +# ROCKCHIP Machine Support
> +snd-soc-rockchip-max98090-objs :=3D rockchip_max98090.o
> +obj-$(CONFIG_SND_SOC_ROCKCHIP_MAX98090) +=3D snd-soc-rockchip-max980=
90.o
> diff --git a/sound/soc/rockchip/rockchip_max98090.c b/sound/soc/rockc=
hip/rockchip_max98090.c
> new file mode 100644
> index 0000000..928b161
> --- /dev/null
> +++ b/sound/soc/rockchip/rockchip_max98090.c
> @@ -0,0 +1,346 @@
> +/*
> + * Rockchip machine ASoC driver for boards using a MAX90809 CODEC.
> + *
> + * Copyright (c) 2014, ROCKCHIP CORPORATION.  All rights reserved.
> + *
> + * This program is free software; you can redistribute it and/or mod=
ify it
> + * under the terms and conditions of the GNU General Public License,
> + * version 2, as published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope it will be useful, but WI=
THOUT
> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILIT=
Y or
> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public Lic=
ense for
> + * more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program.  If not, see <http://www.gnu.org/license=
s/>.
> + *
> + */
> +
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/slab.h>
> +#include <linux/gpio.h>
> +#include <linux/of_gpio.h>
> +#include <sound/core.h>
> +#include <sound/jack.h>
> +#include <sound/pcm.h>
> +#include <sound/pcm_params.h>
> +#include <sound/soc.h>
> +#include "rockchip_i2s.h"
> +
> +#define DRV_NAME "rockchip-snd-max98090"
> +
> +struct rk_mc_private {
> +	struct snd_soc_jack hp_jack;
> +	struct snd_soc_jack mic_jack;
> +};
> +
> +static const struct snd_soc_dapm_widget rk_dapm_widgets[] =3D {
> +	SND_SOC_DAPM_HP("Headphone", NULL),
> +	SND_SOC_DAPM_MIC("Headset Mic", NULL),
> +	SND_SOC_DAPM_MIC("Int Mic", NULL),
> +	SND_SOC_DAPM_SPK("Ext Spk", NULL),
> +};
> +
> +static const struct snd_soc_dapm_route rk_audio_map[] =3D {
> +	{"IN34", NULL, "Headset Mic"},
> +	{"IN34", NULL, "MICBIAS"},
> +	{"MICBIAS", NULL, "Headset Mic"},
> +	{"DMICL", NULL, "Int Mic"},
> +	{"Headphone", NULL, "HPL"},
> +	{"Headphone", NULL, "HPR"},
> +	{"Ext Spk", NULL, "SPKL"},
> +	{"Ext Spk", NULL, "SPKR"},
> +};
> +
> +static const struct snd_kcontrol_new rk_mc_controls[] =3D {
> +	SOC_DAPM_PIN_SWITCH("Headphone"),
> +	SOC_DAPM_PIN_SWITCH("Headset Mic"),
> +	SOC_DAPM_PIN_SWITCH("Int Mic"),
> +	SOC_DAPM_PIN_SWITCH("Ext Spk"),
> +};
> +
> +static int rk_aif1_hw_params(struct snd_pcm_substream *substream,
> +			     struct snd_pcm_hw_params *params)
> +{
> +	int ret =3D 0;
> +	struct snd_soc_pcm_runtime *rtd =3D substream->private_data;
> +	struct snd_soc_dai *cpu_dai =3D rtd->cpu_dai;
> +	struct snd_soc_dai *codec_dai =3D rtd->codec_dai;
> +	int srate, mclk;
> +
> +	srate =3D params_rate(params);
> +	switch (srate) {
> +	case 8000:
> +	case 16000:
> +	case 24000:
> +	case 32000:
> +	case 48000:
> +	case 64000:
> +	case 96000:
> +		mclk =3D 12288000;
> +		break;
> +	case 11025:
> +	case 22050:
> +	case 44100:
> +	case 88200:
> +		mclk =3D 11289600;
> +		break;
> +	default:
> +		mclk =3D 12000000;
> +		break;
> +	}
> +
> +	ret =3D snd_soc_dai_set_sysclk(cpu_dai, 0,
> +				     mclk,
> +				     SND_SOC_CLOCK_OUT);
> +	if (ret < 0) {
> +		dev_err(codec_dai->dev, "Can't set codec clock %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret =3D snd_soc_dai_set_sysclk(codec_dai, 0,
> +				     mclk,
> +				     SND_SOC_CLOCK_IN);
> +	if (ret < 0) {
> +		dev_err(codec_dai->dev, "Can't set codec clock %d\n", ret);
> +		return ret;
> +	}
> +
> +	return ret;
> +}
> +
> +static struct snd_soc_jack_pin hp_jack_pin =3D {
> +	.pin	=3D "Headphone",
> +	.mask	=3D SND_JACK_HEADPHONE,
> +};
> +
> +static struct snd_soc_jack_pin mic_jack_pin =3D {
> +	.pin	=3D "Headset Mic",
> +	.mask	=3D SND_JACK_MICROPHONE,
> +};
> +
> +static struct snd_soc_jack_gpio hp_jack_gpio =3D {
> +	.name			=3D "hp-gpio",
> +	.report			=3D SND_JACK_HEADPHONE,
> +	.debounce_time		=3D 200,
> +	.invert			=3D 1,
> +};
> +
> +static struct snd_soc_jack_gpio mic_jack_gpio =3D {
> +	.name			=3D "mic-gpio",
> +	.report			=3D SND_JACK_MICROPHONE,
> +	.debounce_time		=3D 200,
> +	.invert			=3D 1,
> +};
> +
> +static int rk_init(struct snd_soc_pcm_runtime *runtime)
> +{
> +	int ret =3D 0;
> +	struct snd_soc_codec *codec =3D runtime->codec;
> +	struct snd_soc_dapm_context *dapm =3D &codec->dapm;
> +	struct snd_soc_card *card =3D runtime->card;
> +	struct rk_mc_private *drv =3D snd_soc_card_get_drvdata(card);
> +	struct snd_soc_jack *hp_jack =3D &drv->hp_jack;
> +	struct snd_soc_jack *mic_jack =3D &drv->mic_jack;
> +
> +	card->dapm.idle_bias_off =3D true;
> +
> +	ret =3D snd_soc_add_card_controls(card, rk_mc_controls,
> +					ARRAY_SIZE(rk_mc_controls));
> +	if (ret) {
> +		pr_err("unable to add card->controls\n");
> +		return ret;
> +	}
> +
> +	snd_soc_dapm_enable_pin(dapm, "Headset Mic");
> +	snd_soc_dapm_enable_pin(dapm, "Headphone");
> +	snd_soc_dapm_enable_pin(dapm, "Ext Spk");
> +	snd_soc_dapm_enable_pin(dapm, "Int Mic");
> +
> +	/* Enable headphone jack detection */
> +	ret =3D snd_soc_jack_new(codec, "Headphone Jack", SND_JACK_HEADPHON=
E,
> +			       hp_jack);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D snd_soc_jack_add_pins(hp_jack, 1, &hp_jack_pin);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D snd_soc_jack_add_gpios(hp_jack, 1, &hp_jack_gpio);
> +	if (ret)
> +		return ret;
> +
> +	/* Enable mic jack detection */
> +	ret =3D snd_soc_jack_new(codec, "Mic Jack", SND_JACK_MICROPHONE,
> +			       mic_jack);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D snd_soc_jack_add_pins(mic_jack, 1, &mic_jack_pin);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D snd_soc_jack_add_gpios(mic_jack, 1, &mic_jack_gpio);
> +	if (ret)
> +		return ret;
> +
> +	return ret;
> +}
> +
> +static struct snd_soc_ops rk_aif1_ops =3D {
> +	.hw_params =3D rk_aif1_hw_params,
> +};
> +
> +static struct snd_soc_dai_link rk_dailink =3D {
> +	.name =3D "max98090",
> +	.stream_name =3D "Audio",
> +	.codec_dai_name =3D "HiFi",
> +	.init =3D rk_init,
> +	.ops =3D &rk_aif1_ops,
> +	.dai_fmt =3D SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF |
> +		SND_SOC_DAIFMT_CBM_CFM,
> +};
> +
> +static struct snd_soc_card snd_soc_card_rk =3D {
> +	.name =3D "ROCKCHIP-I2S",
> +	.dai_link =3D &rk_dailink,
> +	.num_links =3D 1,
> +	.dapm_widgets =3D rk_dapm_widgets,
> +	.num_dapm_widgets =3D ARRAY_SIZE(rk_dapm_widgets),
> +	.dapm_routes =3D rk_audio_map,
> +	.num_dapm_routes =3D ARRAY_SIZE(rk_audio_map),
> +	.controls =3D rk_mc_controls,
> +	.num_controls =3D ARRAY_SIZE(rk_mc_controls),
> +};
> +
> +#ifdef CONFIG_PM_SLEEP
> +static int snd_rk_prepare(struct device *dev)
> +{
> +	struct snd_soc_card *card =3D dev_get_drvdata(dev);
> +	struct rk_mc_private *drv =3D snd_soc_card_get_drvdata(card);
> +
> +	snd_soc_jack_free_gpios(&drv->hp_jack, 1, &hp_jack_gpio);
> +	snd_soc_jack_free_gpios(&drv->mic_jack, 1, &mic_jack_gpio);
> +
> +	return snd_soc_suspend(dev);
> +}
> +
> +static void snd_rk_complete(struct device *dev)
> +{
> +	struct snd_soc_card *card =3D dev_get_drvdata(dev);
> +	struct rk_mc_private *drv =3D snd_soc_card_get_drvdata(card);
> +
> +	snd_soc_jack_add_gpios(&drv->hp_jack, 1, &hp_jack_gpio);
> +	snd_soc_jack_add_gpios(&drv->mic_jack, 1, &mic_jack_gpio);
> +
> +	snd_soc_resume(dev);
> +}
> +
> +static const struct dev_pm_ops rk_max98090_pm_ops =3D {
> +	.prepare =3D snd_rk_prepare,
> +	.complete =3D snd_rk_complete,
> +};
> +
> +#define RK_MAX98090_PM_OPS	(&rk_max98090_pm_ops)
> +#else
> +#define RK_MAX98090_PM_OPS	NULL
> +#endif
> +
> +static int snd_rk_mc_probe(struct platform_device *pdev)
> +{
> +	int ret =3D 0;
> +	struct rk_mc_private *drv;
> +	struct snd_soc_card *card =3D &snd_soc_card_rk;
> +	struct device_node *np =3D pdev->dev.of_node;
> +
> +	drv =3D devm_kzalloc(&pdev->dev, sizeof(*drv), GFP_KERNEL);
> +	if (!drv)
> +		return -ENOMEM;
> +
> +	hp_jack_gpio.gpio =3D of_get_named_gpio(np, "rockchip,hp-det-gpios"=
, 0);
> +	if (gpio_is_valid(hp_jack_gpio.gpio))
> +		dev_warn(&pdev->dev,
> +			 "Property 'rockchip,hp-det-gpios' missing or invalid\n");
> +
> +	mic_jack_gpio.gpio =3D of_get_named_gpio(np, "rockchip,mic-det-gpio=
s", 0);
> +	if (gpio_is_valid(mic_jack_gpio.gpio))
> +		dev_warn(&pdev->dev,
> +			 "Property 'rockchip,mic-det-gpios' missing or invalid\n");
> +
> +	/* register the soc card */
> +	card->dev =3D &pdev->dev;
> +	platform_set_drvdata(pdev, card);
> +	snd_soc_card_set_drvdata(card, drv);
> +
> +	rk_dailink.codec_of_node =3D of_parse_phandle(np,
> +			"rockchip,audio-codec", 0);
> +	if (!rk_dailink.codec_of_node) {
> +		dev_err(&pdev->dev,
> +			"Property 'rockchip,audio-codec' missing or invalid\n");
> +		return -EINVAL;
> +	}
> +
> +	rk_dailink.cpu_of_node =3D of_parse_phandle(np,
> +			"rockchip,i2s-controller", 0);
> +	if (!rk_dailink.cpu_of_node) {
> +		dev_err(&pdev->dev,
> +			"Property 'rockchip,i2s-controller' missing or invalid\n");
> +		return -EINVAL;
> +	}
> +
> +	rk_dailink.platform_of_node =3D rk_dailink.cpu_of_node;
> +
> +	ret =3D snd_soc_of_parse_card_name(card, "rockchip,model");
> +	if (ret)
> +		return ret;
> +
> +	ret =3D snd_soc_register_card(card);
> +	if (ret) {
> +		pr_err("snd_soc_register_card failed %d\n", ret);
> +		return ret;
> +	}
> +
> +	platform_set_drvdata(pdev, &card);
> +
> +	return ret;
> +}
> +
> +static int snd_rk_mc_remove(struct platform_device *pdev)
> +{
> +	struct snd_soc_card *soc_card =3D platform_get_drvdata(pdev);
> +	struct rk_mc_private *drv =3D snd_soc_card_get_drvdata(soc_card);
> +
> +	snd_soc_jack_free_gpios(&drv->hp_jack, 1, &hp_jack_gpio);
> +	snd_soc_jack_free_gpios(&drv->mic_jack, 1, &mic_jack_gpio);
> +
> +	snd_soc_unregister_card(soc_card);
> +	platform_set_drvdata(pdev, NULL);
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id rockchip_max98090_of_match[] =3D {
> +	{ .compatible =3D "rockchip,rockchip-audio-max98090", },
> +	{},
> +};
> +
> +static struct platform_driver snd_rk_mc_driver =3D {
> +	.probe =3D snd_rk_mc_probe,
> +	.remove =3D snd_rk_mc_remove,
> +	.driver =3D {
> +		.name =3D DRV_NAME,
> +		.owner =3D THIS_MODULE,
> +		.pm =3D RK_MAX98090_PM_OPS,
> +		.of_match_table =3D rockchip_max98090_of_match,
> +	},
> +};
> +
> +module_platform_driver(snd_rk_mc_driver);
> +MODULE_AUTHOR("jianqun <jay.xu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>");
> +MODULE_DESCRIPTION("Rockchip max98090 machine ASoC driver");
> +MODULE_LICENSE("GPL v2");
> +MODULE_ALIAS("platform:" DRV_NAME);
> +MODULE_DEVICE_TABLE(of, rockchip_max98090_of_match);

--=20
Jianqun Xu

***********************************************************************=
*****
*IMPORTANT NOTICE:*This email is from Fuzhou Rockchip Electronics Co.,
Ltd .The contents of this email and any attachments may contain
information that is privileged, confidential and/or exempt from
disclosure under applicable law and relevant NDA. If you are not the
intended recipient, you are hereby notified that any disclosure,
copying, distribution, or use of the information is STRICTLY PROHIBITED=
=2E
Please immediately contact the sender as soon as possible and destroy
the material in its entirety in any format. Thank you.
***********************************************************************=
*****


--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
