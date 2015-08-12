From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH RESEND 3/5] mfd: arizona: Add register bits for general
 purpose switch
Date: Wed, 12 Aug 2015 09:23:28 +0100
Message-ID: <20150812082328.GZ18282@x1>
References: <1439280844-9808-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
 <1439280844-9808-3-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1439280844-9808-3-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Cc: cw00.choi@samsung.com, patches@opensource.wolfsonmicro.com, devicetree@vger.kernel.org, myungjoo.ham@samsung.com, sameo@linux.intel.com, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, 11 Aug 2015, Charles Keepax wrote:

> The switch is typically used in conjunction with the MICDET clamp in
> order to suppress pops and clicks associated with jack insertion.
>=20
> Signed-off-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
> ---
>  drivers/mfd/wm5110-tables.c           |    2 ++
>  include/linux/mfd/arizona/pdata.h     |    3 +++
>  include/linux/mfd/arizona/registers.h |    8 ++++++++
>  3 files changed, 13 insertions(+), 0 deletions(-)

Acked-by: Lee Jones <lee.jones@linaro.org>

> diff --git a/drivers/mfd/wm5110-tables.c b/drivers/mfd/wm5110-tables.=
c
> index dd27872..acb3bb2 100644
> --- a/drivers/mfd/wm5110-tables.c
> +++ b/drivers/mfd/wm5110-tables.c
> @@ -1472,6 +1472,7 @@ static const struct reg_default wm5110_reg_defa=
ult[] =3D {
>  	{ 0x00000C04, 0xA101 },    /* R3076  - GPIO5 CTRL */
>  	{ 0x00000C0F, 0x0400 },    /* R3087  - IRQ CTRL 1 */
>  	{ 0x00000C10, 0x1000 },    /* R3088  - GPIO Debounce Config */
> +	{ 0x00000C18, 0x0000 },    /* R3096  - GP Switch 1 */
>  	{ 0x00000C20, 0x8002 },    /* R3104  - Misc Pad Ctrl 1 */
>  	{ 0x00000C21, 0x8001 },    /* R3105  - Misc Pad Ctrl 2 */
>  	{ 0x00000C22, 0x0000 },    /* R3106  - Misc Pad Ctrl 3 */
> @@ -2524,6 +2525,7 @@ static bool wm5110_readable_register(struct dev=
ice *dev, unsigned int reg)
>  	case ARIZONA_GPIO5_CTRL:
>  	case ARIZONA_IRQ_CTRL_1:
>  	case ARIZONA_GPIO_DEBOUNCE_CONFIG:
> +	case ARIZONA_GP_SWITCH_1:
>  	case ARIZONA_MISC_PAD_CTRL_1:
>  	case ARIZONA_MISC_PAD_CTRL_2:
>  	case ARIZONA_MISC_PAD_CTRL_3:
> diff --git a/include/linux/mfd/arizona/pdata.h b/include/linux/mfd/ar=
izona/pdata.h
> index f030a32..e76577b 100644
> --- a/include/linux/mfd/arizona/pdata.h
> +++ b/include/linux/mfd/arizona/pdata.h
> @@ -182,6 +182,9 @@ struct arizona_pdata {
> =20
>  	/** GPIO for primary IRQ (used for edge triggered emulation) */
>  	int irq_gpio;
> +
> +	/** General purpose switch control */
> +	unsigned int gpsw;
>  };
> =20
>  #endif
> diff --git a/include/linux/mfd/arizona/registers.h b/include/linux/mf=
d/arizona/registers.h
> index 3f3bb2b..e96644c 100644
> --- a/include/linux/mfd/arizona/registers.h
> +++ b/include/linux/mfd/arizona/registers.h
> @@ -869,6 +869,7 @@
>  #define ARIZONA_GPIO5_CTRL                       0xC04
>  #define ARIZONA_IRQ_CTRL_1                       0xC0F
>  #define ARIZONA_GPIO_DEBOUNCE_CONFIG             0xC10
> +#define ARIZONA_GP_SWITCH_1                      0xC18
>  #define ARIZONA_MISC_PAD_CTRL_1                  0xC20
>  #define ARIZONA_MISC_PAD_CTRL_2                  0xC21
>  #define ARIZONA_MISC_PAD_CTRL_3                  0xC22
> @@ -4573,6 +4574,13 @@
>  #define ARIZONA_GP_DBTIME_WIDTH                       4  /* GP_DBTIM=
E - [15:12] */
> =20
>  /*
> + * R3096 (0xC18) - GP Switch 1
> + */
> +#define ARIZONA_SW1_MODE_MASK                    0x0003  /* SW1_MODE=
 - [1:0] */
> +#define ARIZONA_SW1_MODE_SHIFT                        0  /* SW1_MODE=
 - [1:0] */
> +#define ARIZONA_SW1_MODE_WIDTH                        2  /* SW1_MODE=
 - [1:0] */
> +
> +/*
>   * R3104 (0xC20) - Misc Pad Ctrl 1
>   */
>  #define ARIZONA_LDO1ENA_PD                       0x8000  /* LDO1ENA_=
PD */

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
