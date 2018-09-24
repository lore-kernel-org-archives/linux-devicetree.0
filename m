From: Craig <ctatlor97@gmail.com>
Subject: Re: [PATCH v2] pinctrl: qcom: Add sdm660 pinctrl driver
Date: Mon, 24 Sep 2018 21:37:22 +0100
Message-ID: <E53FA3AA-422C-4504-AD67-99D219D39D77@gmail.com>
References: <20180812142413.20856-1-ctatlor97@gmail.com> <20180924185306.GO1367@tuxbook-pro>
Mime-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180924185306.GO1367@tuxbook-pro>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org



On 24 September 2018 19:53:06 BST, Bjorn Andersson <bjorn=2Eandersson@lina=
ro=2Eorg> wrote:
>On Sun 12 Aug 07:24 PDT 2018, Craig Tatlor wrote:
>
>> Add initial pinctrl driver to support pin configuration with
>> pinctrl framework for sdm660=2E
>> Based off CAF implementation=2E
>>=20
>> Signed-off-by: Craig Tatlor <ctatlor97@gmail=2Ecom>
>> ---
>>=20
>> Changes from v1:
>>   Adds gpio-ranges property to bindings
>>=20
>>=20
>>  =2E=2E=2E/bindings/pinctrl/qcom,sdm660-pinctrl=2Etxt  |  202 +++
>
>As the DT binding part of the patch is significant, please split it
>into
>its own patch=2E
>
Right
>>  drivers/pinctrl/qcom/Kconfig                  |   10 +
>>  drivers/pinctrl/qcom/Makefile                 |    1 +
>>  drivers/pinctrl/qcom/pinctrl-sdm660=2Ec         | 1451
>+++++++++++++++++
>>  4 files changed, 1663 insertions(+)
>>  create mode 100644
>Documentation/devicetree/bindings/pinctrl/qcom,sdm660-pinctrl=2Etxt
>>  create mode 100644 drivers/pinctrl/qcom/pinctrl-sdm660=2Ec
>>=20
>> diff --git
>a/Documentation/devicetree/bindings/pinctrl/qcom,sdm660-pinctrl=2Etxt
>b/Documentation/devicetree/bindings/pinctrl/qcom,sdm660-pinctrl=2Etxt
>[=2E=2E]
>> +- function:
>> +	Usage: required
>> +	Value type: <string>
>> +	Definition: Specify the alternative function to be configured for
>the
>> +		    specified pins=2E Functions are only valid for gpio pins=2E
>> +		    Valid values are:
>> +
>> +		    blsp_uart1, blsp_spi1, blsp_i2c1, blsp_uim1, atest_tsens,
>> +		    bimc_dte1, dac_calib0, blsp_spi8, blsp_uart8, blsp_uim8,
>> +		    qdss_cti_trig_out_b, bimc_dte0, dac_calib1,
>qdss_cti_trig_in_b,
>> +		    dac_calib2, atest_tsens2, atest_usb1, blsp_spi10, blsp_uart10,
>> +		    blsp_uim10, atest_bbrx1, atest_usb13, atest_bbrx0,
>atest_usb12,
>> +		    mdp_vsync, edp_lcd, blsp_i2c10, atest_gpsadc1, atest_usb11,
>> +		    atest_gpsadc0, edp_hot, atest_usb10, m_voc, dac_gpio,
>atest_char,
>> +		    cam_mclk, pll_bypassnl, qdss_stm7, blsp_i2c8,
>qdss_tracedata_b,
>> +		    pll_reset, qdss_stm6, qdss_stm5, qdss_stm4, atest_usb2,
>cci_i2c,
>> +		    qdss_stm3, dac_calib3, atest_usb23, atest_char3, dac_calib4,
>> +		    qdss_stm2, atest_usb22, atest_char2, qdss_stm1, dac_calib5,
>> +		    atest_usb21, atest_char1, dbg_out, qdss_stm0, dac_calib6,
>> +		    atest_usb20, atest_char0, dac_calib10, qdss_stm10,
>> +		    qdss_cti_trig_in_a, cci_timer4, blsp_spi6, blsp_uart6,
>blsp_uim6,
>> +		    blsp2_spi, qdss_stm9, qdss_cti_trig_out_a, dac_calib11,
>> +		    qdss_stm8, cci_timer0, qdss_stm13, dac_calib7, cci_timer1,
>> +		    qdss_stm12, dac_calib8, cci_timer2, blsp1_spi, qdss_stm11,
>> +		    dac_calib9, cci_timer3, cci_async, dac_calib12, blsp_i2c6,
>> +		    qdss_tracectl_a, dac_calib13, qdss_traceclk_a, dac_calib14,
>> +		    dac_calib15, hdmi_rcv, dac_calib16, hdmi_cec, pwr_modem,
>> +		    dac_calib17, hdmi_ddc, pwr_nav, dac_calib18, pwr_crypto,
>> +		    dac_calib19, hdmi_hot, dac_calib20, dac_calib21, pci_e0,
>> +		    dac_calib22, dac_calib23, dac_calib24, tsif1_sync,
>dac_calib25,
>> +		    sd_write, tsif1_error, blsp_spi2, blsp_uart2, blsp_uim2,
>> +		    qdss_cti, blsp_i2c2, blsp_spi3, blsp_uart3, blsp_uim3,
>blsp_i2c3,
>> +		    uim3, blsp_spi9, blsp_uart9, blsp_uim9, blsp10_spi, blsp_i2c9,
>> +		    blsp_spi7, blsp_uart7, blsp_uim7, qdss_tracedata_a, blsp_i2c7,
>> +		    qua_mi2s, gcc_gp1_clk_a, ssc_irq, uim4, blsp_spi11,
>blsp_uart11,
>> +		    blsp_uim11, gcc_gp2_clk_a, gcc_gp3_clk_a, blsp_i2c11,
>cri_trng0,
>> +		    cri_trng1, cri_trng, qdss_stm18, pri_mi2s, qdss_stm17,
>blsp_spi4,
>> +		    blsp_uart4, blsp_uim4, qdss_stm16, qdss_stm15, blsp_i2c4,
>> +		    qdss_stm14, dac_calib26, spkr_i2s, audio_ref, lpass_slimbus,
>> +		    isense_dbg, tsense_pwm1, tsense_pwm2, btfm_slimbus, ter_mi2s,
>> +		    qdss_stm22, qdss_stm21, qdss_stm20, qdss_stm19, gcc_gp1_clk_b,
>> +		    sec_mi2s, blsp_spi5, blsp_uart5, blsp_uim5, gcc_gp2_clk_b,
>> +		    gcc_gp3_clk_b, blsp_i2c5, blsp_spi12, blsp_uart12, blsp_uim12,
>> +		    qdss_stm25, qdss_stm31, blsp_i2c12, qdss_stm30, qdss_stm29,
>> +		    tsif1_clk, qdss_stm28, tsif1_en, tsif1_data, sdc4_cmd,
>qdss_stm27,
>> +		    qdss_traceclk_b, tsif2_error, sdc43, vfr_1, qdss_stm26,
>tsif2_clk,
>> +		    sdc4_clk, qdss_stm24, tsif2_en, sdc42, qdss_stm23,
>qdss_tracectl_b,
>> +		    sd_card, tsif2_data, sdc41, tsif2_sync, sdc40, mdp_vsync_p_b,
>> +		    ldo_en, mdp_vsync_s_b, ldo_update, blsp11_uart_tx_b,
>blsp11_uart_rx_b,
>> +		    blsp11_i2c_sda_b, prng_rosc, blsp11_i2c_scl_b, uim2, uim1,
>uim_batt,
>> +		    pci_e2, pa_indicator, adsp_ext, ddr_bist, qdss_tracedata_11,
>> +		    qdss_tracedata_12, modem_tsync, nav_dr, nav_pps, pci_e1,
>gsm_tx,
>> +		    qspi_cs, ssbi2, ssbi1, mss_lte, qspi_clk, qspi0, qspi1, qspi2,
>qspi3,
>> +		    gpio
>
>Please review this list, there are a few items in here that are not
>valid functions in your driver=2E
>
Okay, will do
>[=2E=2E]
>> +
>> +Example:
>> +
>> +	tlmm: pinctrl@1010000 {
>> +		compatible =3D "qcom,sdm660-pinctrl";
>> +		reg =3D <0x1010000 0x300000>;
>> +		interrupts =3D <0 208 0>;
>
>Replace the 0s in the interrupts specifier=2E
Okay
>
>> +		gpio-controller;
>> +		gpio-ranges =3D <&tlmm 0 0 114>;
>> +		#gpio-cells =3D <2>;
>> +		interrupt-controller;
>> +		#interrupt-cells =3D <2>;
>> +
>> +		uart_console_active: uart_console_active {
>> +			mux {
>> +				pins =3D "gpio4", "gpio5";
>> +				function =3D "blsp_uart8";
>> +			};
>> +
>> +			config {
>> +				pins =3D "gpio4", "gpio5";
>> +				drive-strength =3D <2>;
>> +				bias-disable;
>> +			};
>> +		};
>
>This example isn't valid=2E Please update it, or just drop the pinctrl
>state from the example=2E
>
Right, will drop it
>> +	};
>> diff --git a/drivers/pinctrl/qcom/Kconfig
>b/drivers/pinctrl/qcom/Kconfig
>> index 195492033075=2E=2E091beadb8a1c 100644
>> --- a/drivers/pinctrl/qcom/Kconfig
>> +++ b/drivers/pinctrl/qcom/Kconfig
>> @@ -147,6 +147,16 @@ config PINCTRL_QCOM_SSBI_PMIC
>>           which are using SSBI for communication with SoC=2E Example
>PMIC's
>>           devices are pm8058 and pm8921=2E
>> =20
>> +config PINCTRL_SDM660
>> +       tristate "Qualcomm Technologies Inc SDM660 pin controller
>driver"
>> +       depends on GPIOLIB && OF
>> +       select PINCTRL_MSM
>> +       help
>> +         This is the pinctrl, pinmux, pinconf and gpiolib driver for
>the
>> +         Qualcomm Technologies Inc TLMM block found on the Qualcomm
>> +         Technologies Inc SDM660 platform=2E
>> +
>> +
>
>Extra empty line
Yeah
>
>>  config PINCTRL_SDM845
>>         tristate "Qualcomm Technologies Inc SDM845 pin controller
>driver"
>>         depends on GPIOLIB && OF
>> diff --git a/drivers/pinctrl/qcom/Makefile
>b/drivers/pinctrl/qcom/Makefile
>> index 0c6f3ddc296d=2E=2E9b08808a2f1c 100644
>> --- a/drivers/pinctrl/qcom/Makefile
>> +++ b/drivers/pinctrl/qcom/Makefile
>> @@ -19,4 +19,5 @@ obj-$(CONFIG_PINCTRL_QCOM_SPMI_PMIC) +=3D
>pinctrl-spmi-gpio=2Eo
>>  obj-$(CONFIG_PINCTRL_QCOM_SPMI_PMIC) +=3D pinctrl-spmi-mpp=2Eo
>>  obj-$(CONFIG_PINCTRL_QCOM_SSBI_PMIC) +=3D pinctrl-ssbi-gpio=2Eo
>>  obj-$(CONFIG_PINCTRL_QCOM_SSBI_PMIC) +=3D pinctrl-ssbi-mpp=2Eo
>> +obj-$(CONFIG_PINCTRL_SDM660)   +=3D pinctrl-sdm660=2Eo
>>  obj-$(CONFIG_PINCTRL_SDM845) +=3D pinctrl-sdm845=2Eo
>> diff --git a/drivers/pinctrl/qcom/pinctrl-sdm660=2Ec
>b/drivers/pinctrl/qcom/pinctrl-sdm660=2Ec
>> new file mode 100644
>> index 000000000000=2E=2Eded56111f168
>> --- /dev/null
>> +++ b/drivers/pinctrl/qcom/pinctrl-sdm660=2Ec
>> @@ -0,0 +1,1451 @@
>> +// SPDX-License-Identifier: GPL-2=2E0
>> +/*
>> + * Copyright (c) 2016, The Linux Foundation=2E All rights reserved=2E
>> + * Copyright (c) 2018, Craig Tatlor=2E
>> + */
>> +
>> +#include <linux/module=2Eh>
>> +#include <linux/of=2Eh>
>> +#include <linux/platform_device=2Eh>
>> +#include <linux/pinctrl/pinctrl=2Eh>
>> +
>> +#include "pinctrl-msm=2Eh"
>> +
>> +#define NORTH	0x00900000
>> +#define CENTER	0x00500000
>> +#define SOUTH	0x00100000
>
>Please respin this on top of the QCS404 series, where we describe each
>tile explicitly in DT=2E
>
>The three regions are:
>
>South:  0x03100000 size 0x300000
>Center: 0x03500000 size 0x300000
>North:  0x03900000 size 0x300000
Right, will do
>
>[=2E=2E]
>> +static const unsigned int sdc1_clk_pins[] =3D { 114 };
>> +static const unsigned int sdc1_cmd_pins[] =3D { 115 };
>> +static const unsigned int sdc1_data_pins[] =3D { 116 };
>> +static const unsigned int sdc2_clk_pins[] =3D { 117 };
>> +static const unsigned int sdc2_cmd_pins[] =3D { 118 };
>> +static const unsigned int sdc2_data_pins[] =3D { 119 };
>> +static const unsigned int sdc1_rclk_pins[] =3D { 120 };
>
>The numbering of these "fake" pins isn't significant, so please reorder
>sdc1_rclk to follow the other sdc1 pins=2E
Yup
>
>> +
>> +enum sdm660_functions {
>> +	msm_mux_blsp_spi1,
>
>There's no harm in sorting this list, but it makes it easier to read=2E
>> +
Okay, will do, alphabetically I guess?
>> +static const struct msm_function sdm660_functions[] =3D {
>> +	FUNCTION(blsp_spi1),
>
>Ditto=2E
>
>[=2E=2E]
>> +static const struct msm_pingroup sdm660_groups[] =3D {
>[=2E=2E]
>> +	SDC_QDSD_PINGROUP(sdc1_clk, 0x99a000, 13, 6),
>> +	SDC_QDSD_PINGROUP(sdc1_cmd, 0x99a000, 11, 3),
>> +	SDC_QDSD_PINGROUP(sdc1_data, 0x99a000, 9, 0),
>> +	SDC_QDSD_PINGROUP(sdc2_clk, 0x99b000, 14, 6),
>> +	SDC_QDSD_PINGROUP(sdc2_cmd, 0x99b000, 11, 3),
>> +	SDC_QDSD_PINGROUP(sdc2_data, 0x99b000, 9, 0),
>> +	SDC_QDSD_PINGROUP(sdc1_rclk, 0x99a000, 15, 0),
>
>Move the sdc1_rclk up to the other sdc1 groups=2E
Right
>
>> +};
>
>Regards,
>Bjorn
