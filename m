From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 09/11] mfd: altr_a10sr: Add Altera A10-SR power supply
 alarms
Date: Mon, 9 May 2016 16:53:53 +0100
Message-ID: <20160509155353.GD19473@dell>
References: <1461339219-15255-1-git-send-email-tthayer@opensource.altera.com>
 <1461339219-15255-10-git-send-email-tthayer@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1461339219-15255-10-git-send-email-tthayer@opensource.altera.com>
Sender: linux-gpio-owner@vger.kernel.org
To: tthayer@opensource.altera.com
Cc: linus.walleij@linaro.org, gnurou@gmail.com, jdelvare@suse.com, linux@roeck-us.net, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, dinguyen@opensource.altera.com, linux-gpio@vger.kernel.org, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, 22 Apr 2016, tthayer@opensource.altera.com wrote:

> From: Thor Thayer <tthayer@opensource.altera.com>
>=20
> Add support for power supply alarms to the Altera Arria10
> Development Kit System Resource chip.
>=20
> Signed-off-by: Thor Thayer <tthayer@opensource.altera.com>
> ---
>  drivers/mfd/altera-a10sr.c       |    4 ++++
>  include/linux/mfd/altera-a10sr.h |   24 ++++++++++++++++++++++++
>  2 files changed, 28 insertions(+)

=46or my own reference:
  Acked-by: Lee Jones <lee.jones@linaro.org>
 =20
> diff --git a/drivers/mfd/altera-a10sr.c b/drivers/mfd/altera-a10sr.c
> index 2ff08e3..2b2a90c 100644
> --- a/drivers/mfd/altera-a10sr.c
> +++ b/drivers/mfd/altera-a10sr.c
> @@ -31,6 +31,10 @@ static const struct mfd_cell altr_a10sr_subdev_inf=
o[] =3D {
>  		.name =3D "altr_a10sr_gpio",
>  		.of_compatible =3D "altr,a10sr-gpio",
>  	},
> +	{
> +		.name =3D "altr_a10sr_hwmon",
> +		.of_compatible =3D "altr,a10sr-hwmon",
> +	},
>  };
> =20
>  static bool altr_a10sr_reg_readable(struct device *dev, unsigned int=
 reg)
> diff --git a/include/linux/mfd/altera-a10sr.h b/include/linux/mfd/alt=
era-a10sr.h
> index c869fe7..22aa830 100644
> --- a/include/linux/mfd/altera-a10sr.h
> +++ b/include/linux/mfd/altera-a10sr.h
> @@ -62,8 +62,32 @@
>  #define ALTR_A10SR_IN_VALID_RANGE_HI      15
> =20
>  #define ALTR_A10SR_PWR_GOOD1_REG      0x08    /* Power Good1 Read */
> +/* Power Good #1 Register Bit Definitions */
> +#define ALTR_A10SR_PG1_OP_FLAG_SHIFT    7       /* Power On Complete=
 */
> +#define ALTR_A10SR_PG1_1V8_SHIFT        6       /* 1.8V Power Good *=
/
> +#define ALTR_A10SR_PG1_2V5_SHIFT        5       /* 2.5V Power Good *=
/
> +#define ALTR_A10SR_PG1_3V3_SHIFT        4       /* 3.3V Power Good *=
/
> +#define ALTR_A10SR_PG1_5V0_SHIFT        3       /* 5.0V Power Good *=
/
> +#define ALTR_A10SR_PG1_0V9_SHIFT        2       /* 0.9V Power Good *=
/
> +#define ALTR_A10SR_PG1_0V95_SHIFT       1       /* 0.95V Power Good =
*/
> +#define ALTR_A10SR_PG1_1V0_SHIFT        0       /* 1.0V Power Good *=
/
> +
>  #define ALTR_A10SR_PWR_GOOD2_REG      0x0A    /* Power Good2 Read */
> +/* Power Good #2 Register Bit Definitions */
> +#define ALTR_A10SR_PG2_HPS_SHIFT        7       /* HPS Power Good */
> +#define ALTR_A10SR_PG2_HL_HPS_SHIFT     6       /* HILOHPS_VDD Power=
 Good */
> +#define ALTR_A10SR_PG2_HL_VDD_SHIFT     5       /* HILO VDD Power Go=
od */
> +#define ALTR_A10SR_PG2_HL_VDDQ_SHIFT    4       /* HILO VDDQ Power G=
ood */
> +#define ALTR_A10SR_PG2_FMCAVADJ_SHIFT   3       /* FMCA VADJ Power G=
ood */
> +#define ALTR_A10SR_PG2_FMCBVADJ_SHIFT   2       /* FMCB VADJ Power G=
ood */
> +#define ALTR_A10SR_PG2_FAC2MP_SHIFT     1       /* FAC2MP Power Good=
 */
> +#define ALTR_A10SR_PG2_FBC2MP_SHIFT     0       /* FBC2MP Power Good=
 */
> +
>  #define ALTR_A10SR_PWR_GOOD3_REG      0x0C    /* Power Good3 Read */
> +/* Power Good #3 Register Bit Definitions */
> +#define ALTR_A10SR_PG3_FAM2C_SHIFT      7       /* FAM2C Power Good =
*/
> +#define ALTR_A10SR_PG3_10V_FAIL_SHIFT   6       /* 10V Fail n */
> +
>  #define ALTR_A10SR_FMCAB_REG          0x0E    /* FMCA/B & PCIe Pwr E=
nable */
>  #define ALTR_A10SR_HPS_RST_REG        0x10    /* HPS Reset */
>  #define ALTR_A10SR_USB_QSPI_REG       0x12    /* USB, BQSPI, FILE Re=
set */

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
