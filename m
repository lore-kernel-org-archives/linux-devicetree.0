From: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH RESEND 1/5] mfd: arizona: Add registers for ADC microphone
 detection
Date: Fri, 11 Sep 2015 16:57:41 +0900
Message-ID: <55F28975.2070907@samsung.com>
References: <1441787690-30148-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1441787690-30148-1-git-send-email-ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Charles Keepax <ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: myungjoo.ham-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, patches-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Lee, Charles,

I make the temporary branch[1] and then apply patch1-patch4 without pat=
ch5
because of patch5 may need the ack message by DT maintainer. If Lee wan=
t to
make the immutable branch and send the pull request, I'll make the immu=
table
branch based on Linux-4.3-rcX and send it to MFD maintainer (Lee Jones)=
=2E
[1] branch name : extcon-next-v4.4-for-arizona=20
- git.kernel.org/cgit/linux/kernel/git/chanwoo/extcon.git/log/?h=3Dextc=
on-next-v4.4-for-arizona

I need the your opinion.

Thanks,
Chanwoo Choi

On 2015=EB=85=84 09=EC=9B=94 09=EC=9D=BC 17:34, Charles Keepax wrote:
> The newer devices support using a software comparison to determine
> whether a 3/4 pole jack is present. Add the registers necessary for
> this.
>=20
> Signed-off-by: Charles Keepax <ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
> Acked-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>  drivers/mfd/wm5110-tables.c           |    2 ++
>  include/dt-bindings/mfd/arizona.h     |    2 ++
>  include/linux/mfd/arizona/pdata.h     |    3 +++
>  include/linux/mfd/arizona/registers.h |   17 ++++++++++++++---
>  4 files changed, 21 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/mfd/wm5110-tables.c b/drivers/mfd/wm5110-tables.=
c
> index 12cad94..dd27872 100644
> --- a/drivers/mfd/wm5110-tables.c
> +++ b/drivers/mfd/wm5110-tables.c
> @@ -1807,6 +1807,7 @@ static bool wm5110_readable_register(struct dev=
ice *dev, unsigned int reg)
>  	case ARIZONA_MIC_DETECT_1:
>  	case ARIZONA_MIC_DETECT_2:
>  	case ARIZONA_MIC_DETECT_3:
> +	case ARIZONA_MIC_DETECT_4:
>  	case ARIZONA_MIC_DETECT_LEVEL_1:
>  	case ARIZONA_MIC_DETECT_LEVEL_2:
>  	case ARIZONA_MIC_DETECT_LEVEL_3:
> @@ -2843,6 +2844,7 @@ static bool wm5110_volatile_register(struct dev=
ice *dev, unsigned int reg)
>  	case ARIZONA_ASYNC_SAMPLE_RATE_1_STATUS:
>  	case ARIZONA_ASYNC_SAMPLE_RATE_2_STATUS:
>  	case ARIZONA_MIC_DETECT_3:
> +	case ARIZONA_MIC_DETECT_4:
>  	case ARIZONA_HP_CTRL_1L:
>  	case ARIZONA_HP_CTRL_1R:
>  	case ARIZONA_HEADPHONE_DETECT_2:
> diff --git a/include/dt-bindings/mfd/arizona.h b/include/dt-bindings/=
mfd/arizona.h
> index 7b2000c..c40f665 100644
> --- a/include/dt-bindings/mfd/arizona.h
> +++ b/include/dt-bindings/mfd/arizona.h
> @@ -107,5 +107,7 @@
>  #define ARIZONA_ACCDET_MODE_MIC 0
>  #define ARIZONA_ACCDET_MODE_HPL 1
>  #define ARIZONA_ACCDET_MODE_HPR 2
> +#define ARIZONA_ACCDET_MODE_HPM 4
> +#define ARIZONA_ACCDET_MODE_ADC 7
> =20
>  #endif
> diff --git a/include/linux/mfd/arizona/pdata.h b/include/linux/mfd/ar=
izona/pdata.h
> index 43db4fa..f030a32 100644
> --- a/include/linux/mfd/arizona/pdata.h
> +++ b/include/linux/mfd/arizona/pdata.h
> @@ -124,6 +124,9 @@ struct arizona_pdata {
>  	/** Channel to use for headphone detection */
>  	unsigned int hpdet_channel;
> =20
> +	/** Use software comparison to determine mic presence */
> +	bool micd_software_compare;
> +
>  	/** Extra debounce timeout used during initial mic detection (ms) *=
/
>  	int micd_detect_debounce;
> =20
> diff --git a/include/linux/mfd/arizona/registers.h b/include/linux/mf=
d/arizona/registers.h
> index 3499d36..3f3bb2b 100644
> --- a/include/linux/mfd/arizona/registers.h
> +++ b/include/linux/mfd/arizona/registers.h
> @@ -139,6 +139,7 @@
>  #define ARIZONA_MIC_DETECT_LEVEL_2		 0x2A7
>  #define ARIZONA_MIC_DETECT_LEVEL_3		 0x2A8
>  #define ARIZONA_MIC_DETECT_LEVEL_4		 0x2A9
> +#define ARIZONA_MIC_DETECT_4                     0x2AB
>  #define ARIZONA_MIC_NOISE_MIX_CONTROL_1          0x2C3
>  #define ARIZONA_ISOLATION_CONTROL                0x2CB
>  #define ARIZONA_JACK_DETECT_ANALOGUE             0x2D3
> @@ -2301,9 +2302,9 @@
>  #define ARIZONA_ACCDET_SRC_MASK                  0x2000  /* ACCDET_S=
RC */
>  #define ARIZONA_ACCDET_SRC_SHIFT                     13  /* ACCDET_S=
RC */
>  #define ARIZONA_ACCDET_SRC_WIDTH                      1  /* ACCDET_S=
RC */
> -#define ARIZONA_ACCDET_MODE_MASK                 0x0003  /* ACCDET_M=
ODE - [1:0] */
> -#define ARIZONA_ACCDET_MODE_SHIFT                     0  /* ACCDET_M=
ODE - [1:0] */
> -#define ARIZONA_ACCDET_MODE_WIDTH                     2  /* ACCDET_M=
ODE - [1:0] */
> +#define ARIZONA_ACCDET_MODE_MASK                 0x0007  /* ACCDET_M=
ODE - [2:0] */
> +#define ARIZONA_ACCDET_MODE_SHIFT                     0  /* ACCDET_M=
ODE - [2:0] */
> +#define ARIZONA_ACCDET_MODE_WIDTH                     3  /* ACCDET_M=
ODE - [2:0] */
> =20
>  /*
>   * R667 (0x29B) - Headphone Detect 1
> @@ -2413,6 +2414,16 @@
>  #define ARIZONA_MICD_STS_WIDTH                        1  /* MICD_STS=
 */
> =20
>  /*
> + * R683 (0x2AB) - Mic Detect 4
> + */
> +#define ARIZONA_MICDET_ADCVAL_DIFF_MASK          0xFF00  /* MICDET_A=
DCVAL_DIFF - [15:8] */
> +#define ARIZONA_MICDET_ADCVAL_DIFF_SHIFT              8  /* MICDET_A=
DCVAL_DIFF - [15:8] */
> +#define ARIZONA_MICDET_ADCVAL_DIFF_WIDTH              8  /* MICDET_A=
DCVAL_DIFF - [15:8] */
> +#define ARIZONA_MICDET_ADCVAL_MASK               0x007F  /* MICDET_A=
DCVAL - [15:8] */
> +#define ARIZONA_MICDET_ADCVAL_SHIFT                   0  /* MICDET_A=
DCVAL - [15:8] */
> +#define ARIZONA_MICDET_ADCVAL_WIDTH                   7  /* MICDET_A=
DCVAL - [15:8] */
> +
> +/*
>   * R707 (0x2C3) - Mic noise mix control 1
>   */
>  #define ARIZONA_MICMUTE_RATE_MASK                0x7800  /* MICMUTE_=
RATE - [14:11] */
>=20

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
