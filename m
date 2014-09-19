From: Kiran Padwal <kiran.padwal@smartplayin.com>
Subject: Re: [PATCH] iio: iadc: Qualcomm SPMI PMIC current ADC driver
Date: Fri, 19 Sep 2014 15:49:27 +0530
Message-ID: <541C032F.3080206@smartplayin.com>
References: <1411046123-30625-1-git-send-email-iivanov@mm-sol.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1411046123-30625-1-git-send-email-iivanov@mm-sol.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: "Ivan T. Ivanov" <iivanov@mm-sol.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Jonathan Cameron <jic23@kernel.org>, Grant Likely <grant.likely@linaro.org>, Lars-Peter Clausen <lars@metafoo.de>, Hartmut Knaack <knaack.h@gmx.de>, Lee Jones <lee.jones@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Ivan,

On Thursday 18 September 2014 06:45 PM, Ivan T. Ivanov wrote:
> The current ADC is peripheral of Qualcomm SPMI PMIC chips. It has
> 16 bits resolution and register space inside PMIC accessible across
> SPMI bus.
>=20
> The driver registers itself through IIO interface.
>=20
> Signed-off-by: Ivan T. Ivanov <iivanov@mm-sol.com>
> ---
>  .../devicetree/bindings/iio/adc/qcom,spmi-iadc.txt |  61 ++

<snip>

> diff --git a/drivers/iio/adc/Kconfig b/drivers/iio/adc/Kconfig
> index 11b048a..77274e4 100644
> --- a/drivers/iio/adc/Kconfig
> +++ b/drivers/iio/adc/Kconfig
> @@ -279,4 +279,15 @@ config XILINX_XADC
>  	  The driver can also be build as a module. If so, the module will =
be called
>  	  xilinx-xadc.
> =20
> +config QCOM_SPMI_IADC
> +	tristate "Qualcomm SPMI PMIC current ADC"
> +	select REGMAP_SPMI
> +	depends on IIO

May be you need to add "SPMI" in depends on because without enabling th=
at it breaks.

> +	help
> +	  This is the IIO Current ADC driver for Qualcomm QPNP IADC Chip.
> +
> +	  The driver supports single mode operation to read from upto seven=
 channel
> +	  configuration that include reading the external/internal Rsense, =
CSP_EX,
> +	  CSN_EX pair along with the gain and offset calibration.
> +
>  endmenu

<snip>

> +
> +	return iadc_write(iadc, IADC_EN_CTL1, data);
> +}
> +
> +static void iadc_status_show(struct iadc_chip *iadc)
> +{
> +	u8 mode, sta1, chan, dig, en, req;

During compilation, getting a waring as below for all variables,

rivers/iio/adc/qcom-spmi-iadc.c: In function =91iadc_poll_wait_eoc=92:
drivers/iio/adc/qcom-spmi-iadc.c:227:10: warning: =91en=92 may be used =
uninitialized in this function [-Wmaybe-uninitialized]
  dev_warn(iadc->dev,
          ^

> +	int ret;
> +
> +	ret =3D iadc_read(iadc, IADC_MODE_CTL, &mode);
> +	if (ret < 0)
> +		return;
> +
> +	ret =3D iadc_read(iadc, IADC_DIG_PARAM, &dig);

Thanks,
--Kiran
