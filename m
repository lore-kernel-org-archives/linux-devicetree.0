From: Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH 3/9] ASoC: sun8i-codec-analog: add support
	for V3s SoC
Date: Sun, 26 Feb 2017 14:16:11 +0800
Message-ID: <CAGb2v67YfVo7RhkAPUZusfJiCW-_m6-d-=uq-DdgjEWNKYWVsQ@mail.gmail.com>
References: <20170225123029.55939-1-icenowy@aosc.xyz>
 <20170225123029.55939-3-icenowy@aosc.xyz>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <20170225123029.55939-3-icenowy@aosc.xyz>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: alsa-devel-bounces@alsa-project.org
To: Icenowy Zheng <icenowy@aosc.xyz>
Cc: devicetree <devicetree@vger.kernel.org>, Linux-ALSA <alsa-devel@alsa-project.org>, Vinod Koul <vinod.koul@intel.com>, Mark Brown <broonie@kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, dmaengine@vger.kernel.org, Maxime Ripard <maxime.ripard@free-electrons.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Sat, Feb 25, 2017 at 8:30 PM, Icenowy Zheng <icenowy@aosc.xyz> wrote:
> The V3s SoC features an analog codec with headphone support but without
> mic2 and linein.

It doesn't have MBIAS either. Please split it out as well.

ChenYu

>
> Add support for it.
>
> Signed-off-by: Icenowy Zheng <icenowy@aosc.xyz>
> ---
>  Documentation/devicetree/bindings/sound/sun8i-codec-analog.txt | 1 +
>  sound/soc/sunxi/sun8i-codec-analog.c                           | 9 +++++++++
>  2 files changed, 10 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/sound/sun8i-codec-analog.txt b/Documentation/devicetree/bindings/sound/sun8i-codec-analog.txt
> index 779b735781ba..1b6e7c4e50ab 100644
> --- a/Documentation/devicetree/bindings/sound/sun8i-codec-analog.txt
> +++ b/Documentation/devicetree/bindings/sound/sun8i-codec-analog.txt
> @@ -4,6 +4,7 @@ Required properties:
>  - compatible: must be one of the following compatibles:
>                 - "allwinner,sun8i-a23-codec-analog"
>                 - "allwinner,sun8i-h3-codec-analog"
> +               - "allwinner,sun8i-v3s-codec-analog"
>
>  Required properties if not a sub-node of the PRCM node:
>  - reg: must contain the registers location and length
> diff --git a/sound/soc/sunxi/sun8i-codec-analog.c b/sound/soc/sunxi/sun8i-codec-analog.c
> index 6c17c99c2c8d..6375932177a3 100644
> --- a/sound/soc/sunxi/sun8i-codec-analog.c
> +++ b/sound/soc/sunxi/sun8i-codec-analog.c
> @@ -695,6 +695,11 @@ static const struct sun8i_codec_analog_quirks sun8i_h3_quirks = {
>         .has_mic2       = true,
>  };
>
> +static const struct sun8i_codec_analog_quirks sun8i_v3s_quirks = {
> +       .has_headphone  = true,
> +       .has_hmic       = true,
> +};
> +
>  static int sun8i_codec_analog_cmpnt_probe(struct snd_soc_component *cmpnt)
>  {
>         struct device *dev = cmpnt->dev;
> @@ -762,6 +767,10 @@ static const struct of_device_id sun8i_codec_analog_of_match[] = {
>                 .compatible = "allwinner,sun8i-h3-codec-analog",
>                 .data = &sun8i_h3_quirks,
>         },
> +       {
> +               .compatible = "allwinner,sun8i-v3s-codec-analog",
> +               .data = &sun8i_v3s_quirks,
> +       },
>         {}
>  };
>  MODULE_DEVICE_TABLE(of, sun8i_codec_analog_of_match);
> --
> 2.11.1
>
