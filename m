From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH RESEND 1/5] mfd: arizona: Add registers for ADC
 microphone detection
Date: Wed, 12 Aug 2015 09:23:04 +0100
Message-ID: <20150812082304.GY18282@x1>
References: <1439280844-9808-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1439280844-9808-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Cc: cw00.choi@samsung.com, patches@opensource.wolfsonmicro.com, devicetree@vger.kernel.org, myungjoo.ham@samsung.com, sameo@linux.intel.com, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, 11 Aug 2015, Charles Keepax wrote:

> The newer devices support using a software comparison to determine
> whether a 3/4 pole jack is present. Add the registers necessary for
> this.
>=20
> Signed-off-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
> ---
>=20
> Hi,
>=20
> The first two MFD patches and the two extcon patches need to
> go through together as there are build dependencies. However
> the last documentation update can be treated seperately.
>=20
> The patches are based of the extcon/extcon-next tree because
> that is where most of the changes are but let me know if an
> MFD based version would be preferred.
>=20
> Thanks,
> Charles
>=20
>  drivers/mfd/wm5110-tables.c           |    2 ++
>  include/dt-bindings/mfd/arizona.h     |    2 ++
>  include/linux/mfd/arizona/pdata.h     |    3 +++
>  include/linux/mfd/arizona/registers.h |   17 ++++++++++++++---
>  4 files changed, 21 insertions(+), 3 deletions(-)

Acked-by: Lee Jones <lee.jones@linaro.org>

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

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
