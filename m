From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] scripts/dtc: dt_to_config - report kernel config options
 for a devicetree
Date: Thu, 28 Apr 2016 14:54:16 -0700
Message-ID: <57228688.5080901@gmail.com>
References: <572284AB.102@gmail.com>
Reply-To: frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <572284AB.102-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Gaurav Minocha <gaurav.minocha.os-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org, pavel-+ZI9xUNit7I@public.gmane.org, alison_chaiken-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org


Example 3 -- show all nodes.  Report the value of the kernel config options
in the kernel configuration file.

$ scripts/dtc/dt_to_config --config=$KBUILD_OUTPUT/.config arch/arm/boot/dts/qcom-apq8074-dragonboard.dts
-dDc-------y- : sleep_clk : fixed-clock : arch/powerpc/platforms/512x/clock-commonclk.c : CONFIG_COMMON_CLK : y
-dDc-------y- : sleep_clk : fixed-clock : drivers/clk/clk-fixed-rate.c : CONFIG_COMMON_CLK : y
-dDc-----n--F : sleep_clk : fixed-clock : drivers/clk/clk-u300.c : CONFIG_ARCH_U300 : n
-dDc-----n--F : sleep_clk : fixed-clock : drivers/clk/imx/clk-imx27.c : CONFIG_SOC_IMX27 : n
-dDc-----n--F : sleep_clk : fixed-clock : drivers/clk/imx/clk-imx31.c : CONFIG_SOC_IMX31 : n

-dDc-------y- : xo_board : fixed-clock : arch/powerpc/platforms/512x/clock-commonclk.c : CONFIG_COMMON_CLK : y
-dDc-------y- : xo_board : fixed-clock : drivers/clk/clk-fixed-rate.c : CONFIG_COMMON_CLK : y
-dDc-----n--F : xo_board : fixed-clock : drivers/clk/clk-u300.c : CONFIG_ARCH_U300 : n
-dDc-----n--F : xo_board : fixed-clock : drivers/clk/imx/clk-imx27.c : CONFIG_SOC_IMX27 : n
-dDc-----n--F : xo_board : fixed-clock : drivers/clk/imx/clk-imx31.c : CONFIG_SOC_IMX31 : n

-d-c-------y- : cpu-pmu : qcom,krait-pmu : arch/arm/kernel/perf_event_v7.c : CONFIG_HW_PERF_EVENTS : y

------------- : cpu@0 : qcom,krait : no_driver : no_config : n

------------- : cpu@1 : qcom,krait : no_driver : no_config : n

------------- : cpu@2 : qcom,krait : no_driver : no_config : n

------------- : cpu@3 : qcom,krait : no_driver : no_config : n

Md-c-------y- : spc : qcom,idle-state-spc : drivers/soc/qcom/spm.c : CONFIG_QCOM_PM : y
MdDc-------y- : spc : arm,idle-state : drivers/cpuidle/cpuidle-arm.c : CONFIG_ARM_CPUIDLE : y
MdDc-----n--F : spc : arm,idle-state : drivers/cpuidle/cpuidle-big_little.c : CONFIG_ARM_BIG_LITTLE_CPUIDLE : n

-------H----- : l2-cache : cache : hardcoded_no_driver : no_config : n

-d-c-------y- : smd : qcom,smd : drivers/soc/qcom/smd.c : CONFIG_QCOM_SMD : y

-d-c-------y- : rpm_requests : qcom,rpm-msm8974 : drivers/soc/qcom/smd-rpm.c : CONFIG_QCOM_SMD_RPM : y

-d-c-------y- : pm8841-regulators : qcom,rpm-pm8841-regulators : drivers/regulator/qcom_smd-regulator.c : CONFIG_REGULATOR_QCOM_SMD_RPM : y

-d-c-------y- : pm8941-regulators : qcom,rpm-pm8941-regulators : drivers/regulator/qcom_smd-regulator.c : CONFIG_REGULATOR_QCOM_SMD_RPM : y

-dDc-------y- : smem : qcom,smem : drivers/soc/qcom/smem.c : CONFIG_QCOM_SMEM : y
-dDc-----n--F : smem : qcom,smem : drivers/soc/qcom/smp2p.c : CONFIG_QCOM_SMP2P : n

-d-c-----n--F : smp2p-wcnss : qcom,smp2p : drivers/soc/qcom/smp2p.c : CONFIG_QCOM_SMP2P : n

-d-c-----n--F : smsm : qcom,smsm : drivers/soc/qcom/smsm.c : CONFIG_QCOM_SMSM : n

------W------ : soc : simple-bus : no_driver : no_config : n

-dDc-------y- : clock-controller@f9088000 : qcom,kpss-acc-v2 : arch/arm/mach-qcom/platsmp.c : CONFIG_SMP : y
-dDc-------y- : clock-controller@f9088000 : qcom,kpss-acc-v2 : drivers/soc/qcom/spm.c : CONFIG_QCOM_PM : y

-dDc-------y- : clock-controller@f9098000 : qcom,kpss-acc-v2 : arch/arm/mach-qcom/platsmp.c : CONFIG_SMP : y
-dDc-------y- : clock-controller@f9098000 : qcom,kpss-acc-v2 : drivers/soc/qcom/spm.c : CONFIG_QCOM_PM : y

-dDc-------y- : clock-controller@f90a8000 : qcom,kpss-acc-v2 : arch/arm/mach-qcom/platsmp.c : CONFIG_SMP : y
-dDc-------y- : clock-controller@f90a8000 : qcom,kpss-acc-v2 : drivers/soc/qcom/spm.c : CONFIG_QCOM_PM : y

-dDc-------y- : clock-controller@f90b8000 : qcom,kpss-acc-v2 : arch/arm/mach-qcom/platsmp.c : CONFIG_SMP : y
-dDc-------y- : clock-controller@f90b8000 : qcom,kpss-acc-v2 : drivers/soc/qcom/spm.c : CONFIG_QCOM_PM : y

-d-c-------y- : clock-controller@fc400000 : qcom,gcc-msm8974 : drivers/clk/qcom/gcc-msm8974.c : CONFIG_MSM_GCC_8974 : y

-d-c-------y- : clock-controller@fd8c0000 : qcom,mmcc-msm8974 : drivers/clk/qcom/mmcc-msm8974.c : CONFIG_MSM_MMCC_8974 : y

-d-c-------y- : dma-controller@f9944000 : qcom,bam-v1.4.0 : drivers/dma/qcom/bam_dma.c : CONFIG_QCOM_BAM_DMA : y

-d-c-E-----y- : i2c@f9964000 : qcom,i2c-qup-v2.1.1 : drivers/i2c/busses/i2c-qup.c : CONFIG_I2C_QUP : y

-d-c-------y- : i2c@f9967000 : qcom,i2c-qup-v2.1.1 : drivers/i2c/busses/i2c-qup.c : CONFIG_I2C_QUP : y

------------- : eeprom@52 : atmel,24c128 : no_driver : no_config : n

-d-c-------y- : interrupt-controller@f9000000 : qcom,msm-qgic2 : drivers/irqchip/irq-gic.c : CONFIG_ARM_GIC : y

-d-c-------y- : memory@fc428000 : qcom,rpm-msg-ram : drivers/soc/qcom/smem.c : CONFIG_QCOM_SMEM : y

-d-c-------y- : pinctrl@fd510000 : qcom,msm8974-pinctrl : drivers/pinctrl/qcom/pinctrl-msm8x74.c : CONFIG_PINCTRL_MSM8X74 : y

------------- : power-controller@f9012000 : qcom,saw2 : no_driver : no_config : n

Md-c-------y- : power-controller@f9089000 : qcom,msm8974-saw2-v2.1-cpu : drivers/soc/qcom/spm.c : CONFIG_QCOM_PM : y
M------------ : power-controller@f9089000 : qcom,saw2 : no_driver : no_config : n

Md-c-------y- : power-controller@f9099000 : qcom,msm8974-saw2-v2.1-cpu : drivers/soc/qcom/spm.c : CONFIG_QCOM_PM : y
M------------ : power-controller@f9099000 : qcom,saw2 : no_driver : no_config : n

Md-c-------y- : power-controller@f90a9000 : qcom,msm8974-saw2-v2.1-cpu : drivers/soc/qcom/spm.c : CONFIG_QCOM_PM : y
M------------ : power-controller@f90a9000 : qcom,saw2 : no_driver : no_config : n

Md-c-------y- : power-controller@f90b9000 : qcom,msm8974-saw2-v2.1-cpu : drivers/soc/qcom/spm.c : CONFIG_QCOM_PM : y
M------------ : power-controller@f90b9000 : qcom,saw2 : no_driver : no_config : n

-d-c-------y- : restart@fc4ab000 : qcom,pshold : drivers/power/reset/msm-poweroff.c : CONFIG_POWER_RESET_MSM : y

-d-c-------y- : rng@f9bff000 : qcom,prng : drivers/char/hw_random/msm-rng.c : CONFIG_HW_RANDOM_MSM : y

-d-c-------y- : sdhci@f9824900 : qcom,sdhci-msm-v4 : drivers/mmc/host/sdhci-msm.c : CONFIG_MMC_SDHCI_MSM : y

-d-c-E-----y- : sdhci@f98a4900 : qcom,sdhci-msm-v4 : drivers/mmc/host/sdhci-msm.c : CONFIG_MMC_SDHCI_MSM : y

Md-c-------y- : serial@f991e000 : qcom,msm-uartdm-v1.4 : drivers/tty/serial/msm_serial.c : CONFIG_SERIAL_MSM : y
Md-c-------y- : serial@f991e000 : qcom,msm-uartdm : drivers/tty/serial/msm_serial.c : CONFIG_SERIAL_MSM : y

-d-c-------y- : spmi@fc4cf000 : qcom,spmi-pmic-arb : drivers/spmi/spmi-pmic-arb.c : CONFIG_SPMI_MSM_PMIC_ARB : y

Md-c-------y- : pm8841@4 : qcom,pm8841 : drivers/mfd/qcom-spmi-pmic.c : CONFIG_MFD_SPMI_PMIC : y
Md-c-------y- : pm8841@4 : qcom,spmi-pmic : drivers/mfd/qcom-spmi-pmic.c : CONFIG_MFD_SPMI_PMIC : y

Md-c-------y- : mpps@a000 : qcom,pm8841-mpp : drivers/pinctrl/qcom/pinctrl-spmi-mpp.c : CONFIG_PINCTRL_QCOM_SPMI_PMIC : y
M------------ : mpps@a000 : qcom,spmi-mpp : no_driver : no_config : n

-d-c-----n--F : temp-alarm@2400 : qcom,spmi-temp-alarm : drivers/thermal/qcom-spmi-temp-alarm.c : CONFIG_QCOM_SPMI_TEMP_ALARM : n

Md-c-------y- : pm8841@5 : qcom,pm8841 : drivers/mfd/qcom-spmi-pmic.c : CONFIG_MFD_SPMI_PMIC : y
Md-c-------y- : pm8841@5 : qcom,spmi-pmic : drivers/mfd/qcom-spmi-pmic.c : CONFIG_MFD_SPMI_PMIC : y

Md-c-------y- : pm8941@0 : qcom,pm8941 : drivers/mfd/qcom-spmi-pmic.c : CONFIG_MFD_SPMI_PMIC : y
Md-c-------y- : pm8941@0 : qcom,spmi-pmic : drivers/mfd/qcom-spmi-pmic.c : CONFIG_MFD_SPMI_PMIC : y

-d-c-------y- : charger@1000 : qcom,pm8941-charger : drivers/power/qcom_smbb.c : CONFIG_CHARGER_QCOM_SMBB : y

-d-c-E-----y- : coincell@2800 : qcom,pm8941-coincell : drivers/misc/qcom-coincell.c : CONFIG_QCOM_COINCELL : y

Md-c-------y- : gpios@c000 : qcom,pm8941-gpio : drivers/pinctrl/qcom/pinctrl-spmi-gpio.c : CONFIG_PINCTRL_QCOM_SPMI_PMIC : y
M------------ : gpios@c000 : qcom,spmi-gpio : no_driver : no_config : n

M------------ : iadc@3600 : qcom,pm8941-iadc : no_driver : no_config : n
Md-c-----n--F : iadc@3600 : qcom,spmi-iadc : drivers/iio/adc/qcom-spmi-iadc.c : CONFIG_QCOM_SPMI_IADC : n

Md-c-------y- : mpps@a000 : qcom,pm8941-mpp : drivers/pinctrl/qcom/pinctrl-spmi-mpp.c : CONFIG_PINCTRL_QCOM_SPMI_PMIC : y
M------------ : mpps@a000 : qcom,spmi-mpp : no_driver : no_config : n

-d-c-----n--F : pwrkey@800 : qcom,pm8941-pwrkey : drivers/input/misc/pm8941-pwrkey.c : CONFIG_INPUT_PM8941_PWRKEY : n

-d-c-------y- : rtc@6000 : qcom,pm8941-rtc : drivers/rtc/rtc-pm8xxx.c : CONFIG_RTC_DRV_PM8XXX : y

-d-c-----n--F : temp-alarm@2400 : qcom,spmi-temp-alarm : drivers/thermal/qcom-spmi-temp-alarm.c : CONFIG_QCOM_SPMI_TEMP_ALARM : n

-d-c-----n--F : vadc@3100 : qcom,spmi-vadc : drivers/iio/adc/qcom-spmi-vadc.c : CONFIG_QCOM_SPMI_VADC : n

Md-c-------y- : pm8941@1 : qcom,pm8941 : drivers/mfd/qcom-spmi-pmic.c : CONFIG_MFD_SPMI_PMIC : y
Md-c-------y- : pm8941@1 : qcom,spmi-pmic : drivers/mfd/qcom-spmi-pmic.c : CONFIG_MFD_SPMI_PMIC : y

-d-c-E---n--F : wled@d800 : qcom,pm8941-wled : drivers/video/backlight/pm8941-wled.c : CONFIG_BACKLIGHT_PM8941_WLED : n

-d-c---H---y- : syscon@f9011000 : syscon : drivers/mfd/syscon.c : CONFIG_MFD_SYSCON : y

-d-c---H---y- : syscon@fd484000 : syscon : drivers/mfd/syscon.c : CONFIG_MFD_SYSCON : y

-d-c-------y- : tcsr-mutex : qcom,tcsr-mutex : drivers/hwspinlock/qcom_hwspinlock.c : CONFIG_HWSPINLOCK_QCOM : y

-d-c-------y- : timer@f9020000 : arm,armv7-timer-mem : drivers/clocksource/arm_arch_timer.c : CONFIG_ARM_ARCH_TIMER : y

-dDc-------y- : timer : arm,armv7-timer : arch/arm/kernel/vdso.c : CONFIG_VDSO : y
-dDc-------y- : timer : arm,armv7-timer : drivers/clocksource/arm_arch_timer.c : CONFIG_ARM_ARCH_TIMER : y

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
