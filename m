From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] scripts/dtc: dt_to_config - example 1
Date: Thu, 28 Apr 2016 14:52:37 -0700
Message-ID: <57228625.7000302@gmail.com>
References: <572284AB.102@gmail.com>
Reply-To: frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <572284AB.102-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Gaurav Minocha <gaurav.minocha.os-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org, pavel-+ZI9xUNit7I@public.gmane.org, alison_chaiken-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org


Example 1 -- show only the nodes that have complications.  Things like multiple
compatible values, multiple matching drivers, etc.

$ scripts/dtc/dt_to_config --include-suspect arch/arm/boot/dts/qcom-apq8074-dragonboard.dts
-dDc--------- : sleep_clk : fixed-clock : arch/powerpc/platforms/512x/clock-commonclk.c : CONFIG_COMMON_CLK : none
-dDc--------- : sleep_clk : fixed-clock : drivers/clk/clk-fixed-rate.c : CONFIG_COMMON_CLK : none
-dDc--------- : sleep_clk : fixed-clock : drivers/clk/clk-u300.c : CONFIG_ARCH_U300 : none
-dDc--------- : sleep_clk : fixed-clock : drivers/clk/imx/clk-imx27.c : CONFIG_SOC_IMX27 : none
-dDc--------- : sleep_clk : fixed-clock : drivers/clk/imx/clk-imx31.c : CONFIG_SOC_IMX31 : none

-dDc--------- : xo_board : fixed-clock : arch/powerpc/platforms/512x/clock-commonclk.c : CONFIG_COMMON_CLK : none
-dDc--------- : xo_board : fixed-clock : drivers/clk/clk-fixed-rate.c : CONFIG_COMMON_CLK : none
-dDc--------- : xo_board : fixed-clock : drivers/clk/clk-u300.c : CONFIG_ARCH_U300 : none
-dDc--------- : xo_board : fixed-clock : drivers/clk/imx/clk-imx27.c : CONFIG_SOC_IMX27 : none
-dDc--------- : xo_board : fixed-clock : drivers/clk/imx/clk-imx31.c : CONFIG_SOC_IMX31 : none

Md-c--------- : spc : qcom,idle-state-spc : drivers/soc/qcom/spm.c : CONFIG_QCOM_PM : none
MdDc--------- : spc : arm,idle-state : drivers/cpuidle/cpuidle-arm.c : CONFIG_ARM_CPUIDLE : none
MdDc--------- : spc : arm,idle-state : drivers/cpuidle/cpuidle-big_little.c : CONFIG_ARM_BIG_LITTLE_CPUIDLE : none

-------H----- : l2-cache : cache : hardcoded_no_driver : no_config : none

-dDc--------- : smem : qcom,smem : drivers/soc/qcom/smem.c : CONFIG_QCOM_SMEM : none
-dDc--------- : smem : qcom,smem : drivers/soc/qcom/smp2p.c : CONFIG_QCOM_SMP2P : none

------W------ : soc : simple-bus : no_driver : no_config : none

-dDc--------- : clock-controller@f9088000 : qcom,kpss-acc-v2 : arch/arm/mach-qcom/platsmp.c : CONFIG_SMP : none
-dDc--------- : clock-controller@f9088000 : qcom,kpss-acc-v2 : drivers/soc/qcom/spm.c : CONFIG_QCOM_PM : none

-dDc--------- : clock-controller@f9098000 : qcom,kpss-acc-v2 : arch/arm/mach-qcom/platsmp.c : CONFIG_SMP : none
-dDc--------- : clock-controller@f9098000 : qcom,kpss-acc-v2 : drivers/soc/qcom/spm.c : CONFIG_QCOM_PM : none

-dDc--------- : clock-controller@f90a8000 : qcom,kpss-acc-v2 : arch/arm/mach-qcom/platsmp.c : CONFIG_SMP : none
-dDc--------- : clock-controller@f90a8000 : qcom,kpss-acc-v2 : drivers/soc/qcom/spm.c : CONFIG_QCOM_PM : none

-dDc--------- : clock-controller@f90b8000 : qcom,kpss-acc-v2 : arch/arm/mach-qcom/platsmp.c : CONFIG_SMP : none
-dDc--------- : clock-controller@f90b8000 : qcom,kpss-acc-v2 : drivers/soc/qcom/spm.c : CONFIG_QCOM_PM : none

-d-c-E------- : i2c@f9964000 : qcom,i2c-qup-v2.1.1 : drivers/i2c/busses/i2c-qup.c : CONFIG_I2C_QUP : none

Md-c--------- : power-controller@f9089000 : qcom,msm8974-saw2-v2.1-cpu : drivers/soc/qcom/spm.c : CONFIG_QCOM_PM : none
M------------ : power-controller@f9089000 : qcom,saw2 : no_driver : no_config : none

Md-c--------- : power-controller@f9099000 : qcom,msm8974-saw2-v2.1-cpu : drivers/soc/qcom/spm.c : CONFIG_QCOM_PM : none
M------------ : power-controller@f9099000 : qcom,saw2 : no_driver : no_config : none

Md-c--------- : power-controller@f90a9000 : qcom,msm8974-saw2-v2.1-cpu : drivers/soc/qcom/spm.c : CONFIG_QCOM_PM : none
M------------ : power-controller@f90a9000 : qcom,saw2 : no_driver : no_config : none

Md-c--------- : power-controller@f90b9000 : qcom,msm8974-saw2-v2.1-cpu : drivers/soc/qcom/spm.c : CONFIG_QCOM_PM : none
M------------ : power-controller@f90b9000 : qcom,saw2 : no_driver : no_config : none

-d-c-E------- : sdhci@f98a4900 : qcom,sdhci-msm-v4 : drivers/mmc/host/sdhci-msm.c : CONFIG_MMC_SDHCI_MSM : none

Md-c--------- : serial@f991e000 : qcom,msm-uartdm-v1.4 : drivers/tty/serial/msm_serial.c : CONFIG_SERIAL_MSM : none
Md-c--------- : serial@f991e000 : qcom,msm-uartdm : drivers/tty/serial/msm_serial.c : CONFIG_SERIAL_MSM : none

Md-c--------- : pm8841@4 : qcom,pm8841 : drivers/mfd/qcom-spmi-pmic.c : CONFIG_MFD_SPMI_PMIC : none
Md-c--------- : pm8841@4 : qcom,spmi-pmic : drivers/mfd/qcom-spmi-pmic.c : CONFIG_MFD_SPMI_PMIC : none

Md-c--------- : mpps@a000 : qcom,pm8841-mpp : drivers/pinctrl/qcom/pinctrl-spmi-mpp.c : CONFIG_PINCTRL_QCOM_SPMI_PMIC : none
M------------ : mpps@a000 : qcom,spmi-mpp : no_driver : no_config : none

Md-c--------- : pm8841@5 : qcom,pm8841 : drivers/mfd/qcom-spmi-pmic.c : CONFIG_MFD_SPMI_PMIC : none
Md-c--------- : pm8841@5 : qcom,spmi-pmic : drivers/mfd/qcom-spmi-pmic.c : CONFIG_MFD_SPMI_PMIC : none

Md-c--------- : pm8941@0 : qcom,pm8941 : drivers/mfd/qcom-spmi-pmic.c : CONFIG_MFD_SPMI_PMIC : none
Md-c--------- : pm8941@0 : qcom,spmi-pmic : drivers/mfd/qcom-spmi-pmic.c : CONFIG_MFD_SPMI_PMIC : none

-d-c-E------- : coincell@2800 : qcom,pm8941-coincell : drivers/misc/qcom-coincell.c : CONFIG_QCOM_COINCELL : none

Md-c--------- : gpios@c000 : qcom,pm8941-gpio : drivers/pinctrl/qcom/pinctrl-spmi-gpio.c : CONFIG_PINCTRL_QCOM_SPMI_PMIC : none
M------------ : gpios@c000 : qcom,spmi-gpio : no_driver : no_config : none

M------------ : iadc@3600 : qcom,pm8941-iadc : no_driver : no_config : none
Md-c--------- : iadc@3600 : qcom,spmi-iadc : drivers/iio/adc/qcom-spmi-iadc.c : CONFIG_QCOM_SPMI_IADC : none

Md-c--------- : mpps@a000 : qcom,pm8941-mpp : drivers/pinctrl/qcom/pinctrl-spmi-mpp.c : CONFIG_PINCTRL_QCOM_SPMI_PMIC : none
M------------ : mpps@a000 : qcom,spmi-mpp : no_driver : no_config : none

Md-c--------- : pm8941@1 : qcom,pm8941 : drivers/mfd/qcom-spmi-pmic.c : CONFIG_MFD_SPMI_PMIC : none
Md-c--------- : pm8941@1 : qcom,spmi-pmic : drivers/mfd/qcom-spmi-pmic.c : CONFIG_MFD_SPMI_PMIC : none

-d-c-E------- : wled@d800 : qcom,pm8941-wled : drivers/video/backlight/pm8941-wled.c : CONFIG_BACKLIGHT_PM8941_WLED : none

-d-c---H----- : syscon@f9011000 : syscon : drivers/mfd/syscon.c : CONFIG_MFD_SYSCON : none

-d-c---H----- : syscon@fd484000 : syscon : drivers/mfd/syscon.c : CONFIG_MFD_SYSCON : none

-dDc--------- : timer : arm,armv7-timer : arch/arm/kernel/vdso.c : CONFIG_VDSO : none
-dDc--------- : timer : arm,armv7-timer : drivers/clocksource/arm_arch_timer.c : CONFIG_ARM_ARCH_TIMER : none

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
