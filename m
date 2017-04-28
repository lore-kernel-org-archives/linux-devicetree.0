MIME-Version: 1.0
In-Reply-To: <878tmvooif.wl%kuninori.morimoto.gx@renesas.com>
References: <87fuh3oon8.wl%kuninori.morimoto.gx@renesas.com>
	<878tmvooif.wl%kuninori.morimoto.gx@renesas.com>
Date: Fri, 28 Apr 2017 14:34:22 -0500
Message-ID: <CAL_JsqJUXTrMKxjKhm9BNk2R7mMhGaJFc_bo7PQOYaPXMi9cbA@mail.gmail.com>
Subject: Re: [PATCH v7 5/9] ASoC: soc-core: enable "dai-format" on snd_soc_of_parse_daifmt()
From: Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset=UTF-8
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Mark Brown <broonie@kernel.org>, Linux-ALSA <alsa-devel@alsa-project.org>, Simon <horms@verge.net.au>, Linux-DT <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

On Wed, Apr 19, 2017 at 8:33 PM, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com> wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>
> Current snd_soc_of_parse_daifmt() detects [prefix]format, but
> "format" was unclear in some case. This patch checks "dai-format"
> first, and try to check "[prefix]format" if "dai-format" was not
> exist.
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
> v6 -> v7
>
>  - no change
>
>  sound/soc/soc-core.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
>
> diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
> index 8be2ce1..e84a820 100644
> --- a/sound/soc/soc-core.c
> +++ b/sound/soc/soc-core.c
> @@ -3955,11 +3955,15 @@ unsigned int snd_soc_of_parse_daifmt(struct device_node *np,
>                 prefix = "";
>
>         /*
> -        * check "[prefix]format = xxx"
> +        * check "dai-format = xxx"
> +        * or    "[prefix]format = xxx"
>          * SND_SOC_DAIFMT_FORMAT_MASK area
>          */
> -       snprintf(prop, sizeof(prop), "%sformat", prefix);
> -       ret = of_property_read_string(np, prop, &str);
> +       ret = of_property_read_string(np, "dai-format", &str);
> +       if (ret < 0) {
> +               snprintf(prop, sizeof(prop), "%sformat", prefix);
> +               ret = of_property_read_string(np, prop, &str);
> +       }
>         if (ret == 0) {
>                 for (i = 0; i < ARRAY_SIZE(of_fmt_table); i++) {
>                         if (strcmp(str, of_fmt_table[i].name) == 0) {
> --
> 1.9.1
>
