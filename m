From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2] scripts/dtc: dt_to_config - example 2: nodes with
 complications
Date: Fri, 10 Jun 2016 16:06:02 -0700
Message-ID: <575B47DA.9030908@gmail.com>
References: <575B46CE.6080903@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <575B46CE.6080903-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, gaurav.minocha.os-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org, pavel-+ZI9xUNit7I@public.gmane.org
List-Id: devicetree@vger.kernel.org

Example 2 -- show only the nodes that have complications, with white list.

Complications are things like multiple compatible values, multiple
matching drivers, node is not enabled, etc.

Use driver white list.  Entries that used the white list have the
'W' flag set.

$ scripts/dtc/dt_to_config \
   --include-suspect --white-list-driver \
   --config ${KBUILD_OUTPUT}/.config \
   arch/arm/boot/dts/qcom-apq8074-dragonboard.dts
-dDc-------y- : /clocks/sleep_clk : fixed-clock : arch/powerpc/platforms/512x/clock-commonclk.c : CONFIG_COMMON_CLK : y
-dDc-------y- : /clocks/sleep_clk : fixed-clock : drivers/clk/clk-fixed-rate.c : CONFIG_COMMON_CLK : y
-dDc-----n--F : /clocks/sleep_clk : fixed-clock : drivers/clk/clk-u300.c : CONFIG_ARCH_U300 : n
-dDc-----n--F : /clocks/sleep_clk : fixed-clock : drivers/clk/imx/clk-imx27.c : CONFIG_SOC_IMX27 : n
-dDc-----n--F : /clocks/sleep_clk : fixed-clock : drivers/clk/imx/clk-imx31.c : CONFIG_SOC_IMX31 : n

-dDc-------y- : /clocks/xo_board : fixed-clock : arch/powerpc/platforms/512x/clock-commonclk.c : CONFIG_COMMON_CLK : y
-dDc-------y- : /clocks/xo_board : fixed-clock : drivers/clk/clk-fixed-rate.c : CONFIG_COMMON_CLK : y
-dDc-----n--F : /clocks/xo_board : fixed-clock : drivers/clk/clk-u300.c : CONFIG_ARCH_U300 : n
-dDc-----n--F : /clocks/xo_board : fixed-clock : drivers/clk/imx/clk-imx27.c : CONFIG_SOC_IMX27 : n
-dDc-----n--F : /clocks/xo_board : fixed-clock : drivers/clk/imx/clk-imx31.c : CONFIG_SOC_IMX31 : n

Md-c-------y- : /cpus/idle-states/spc : qcom,idle-state-spc : drivers/soc/qcom/spm.c : CONFIG_QCOM_PM : y
MdDc-------y- : /cpus/idle-states/spc : arm,idle-state : drivers/cpuidle/cpuidle-arm.c : CONFIG_ARM_CPUIDLE : y
MdDc-----n--F : /cpus/idle-states/spc : arm,idle-state : drivers/cpuidle/cpuidle-big_little.c : CONFIG_ARM_BIG_LITTLE_CPUIDLE : n

-------H----- : /cpus/l2-cache : cache : hardcoded_no_driver : no_config : x

-dDc-------y- : /smem : qcom,smem : drivers/soc/qcom/smem.c : CONFIG_QCOM_SMEM : y
-dDc-----n--F : /smem : qcom,smem : drivers/soc/qcom/smp2p.c : CONFIG_QCOM_SMP2P : n

-d-c-----n--F : /smp2p-modem : qcom,smp2p : drivers/soc/qcom/smp2p.c : CONFIG_QCOM_SMP2P : n

-d-c-----n--F : /smp2p-wcnss : qcom,smp2p : drivers/soc/qcom/smp2p.c : CONFIG_QCOM_SMP2P : n

-d-c-----n--F : /smsm : qcom,smsm : drivers/soc/qcom/smsm.c : CONFIG_QCOM_SMSM : n

------W------ : /soc : simple-bus : no_driver : no_config : x

-dDc-------y- : /soc/clock-controller@f9088000 : qcom,kpss-acc-v2 : arch/arm/mach-qcom/platsmp.c : CONFIG_SMP : y
-dDc-------y- : /soc/clock-controller@f9088000 : qcom,kpss-acc-v2 : drivers/soc/qcom/spm.c : CONFIG_QCOM_PM : y

-dDc-------y- : /soc/clock-controller@f9098000 : qcom,kpss-acc-v2 : arch/arm/mach-qcom/platsmp.c : CONFIG_SMP : y
-dDc-------y- : /soc/clock-controller@f9098000 : qcom,kpss-acc-v2 : drivers/soc/qcom/spm.c : CONFIG_QCOM_PM : y

-dDc-------y- : /soc/clock-controller@f90a8000 : qcom,kpss-acc-v2 : arch/arm/mach-qcom/platsmp.c : CONFIG_SMP : y
-dDc-------y- : /soc/clock-controller@f90a8000 : qcom,kpss-acc-v2 : drivers/soc/qcom/spm.c : CONFIG_QCOM_PM : y

-dDc-------y- : /soc/clock-controller@f90b8000 : qcom,kpss-acc-v2 : arch/arm/mach-qcom/platsmp.c : CONFIG_SMP : y
-dDc-------y- : /soc/clock-controller@f90b8000 : qcom,kpss-acc-v2 : drivers/soc/qcom/spm.c : CONFIG_QCOM_PM : y

-d-c-E-----y- : /soc/i2c@f9924000 : qcom,i2c-qup-v2.1.1 : drivers/i2c/busses/i2c-qup.c : CONFIG_I2C_QUP : y

-d-c-E-----y- : /soc/i2c@f9964000 : qcom,i2c-qup-v2.1.1 : drivers/i2c/busses/i2c-qup.c : CONFIG_I2C_QUP : y

Md-c-------y- : /soc/power-controller@f9089000 : qcom,msm8974-saw2-v2.1-cpu : drivers/soc/qcom/spm.c : CONFIG_QCOM_PM : y
M------------ : /soc/power-controller@f9089000 : qcom,saw2 : no_driver : no_makefile : x

Md-c-------y- : /soc/power-controller@f9099000 : qcom,msm8974-saw2-v2.1-cpu : drivers/soc/qcom/spm.c : CONFIG_QCOM_PM : y
M------------ : /soc/power-controller@f9099000 : qcom,saw2 : no_driver : no_makefile : x

Md-c-------y- : /soc/power-controller@f90a9000 : qcom,msm8974-saw2-v2.1-cpu : drivers/soc/qcom/spm.c : CONFIG_QCOM_PM : y
M------------ : /soc/power-controller@f90a9000 : qcom,saw2 : no_driver : no_makefile : x

Md-c-------y- : /soc/power-controller@f90b9000 : qcom,msm8974-saw2-v2.1-cpu : drivers/soc/qcom/spm.c : CONFIG_QCOM_PM : y
M------------ : /soc/power-controller@f90b9000 : qcom,saw2 : no_driver : no_makefile : x

-d-c-E-----y- : /soc/sdhci@f98a4900 : qcom,sdhci-msm-v4 : drivers/mmc/host/sdhci-msm.c : CONFIG_MMC_SDHCI_MSM : y

Md-c-------y- : /soc/serial@f991e000 : qcom,msm-uartdm-v1.4 : drivers/tty/serial/msm_serial.c : CONFIG_SERIAL_MSM : y
Md-c-------y- : /soc/serial@f991e000 : qcom,msm-uartdm : drivers/tty/serial/msm_serial.c : CONFIG_SERIAL_MSM : y

Md-c-------y- : /soc/spmi@fc4cf000/pm8841@4 : qcom,pm8841 : drivers/mfd/qcom-spmi-pmic.c : CONFIG_MFD_SPMI_PMIC : y
Md-c-------y- : /soc/spmi@fc4cf000/pm8841@4 : qcom,spmi-pmic : drivers/mfd/qcom-spmi-pmic.c : CONFIG_MFD_SPMI_PMIC : y

Md-c-------y- : /soc/spmi@fc4cf000/pm8841@4/mpps@a000 : qcom,pm8841-mpp : drivers/pinctrl/qcom/pinctrl-spmi-mpp.c : CONFIG_PINCTRL_QCOM_SPMI_PMIC : y
M------------ : /soc/spmi@fc4cf000/pm8841@4/mpps@a000 : qcom,spmi-mpp : no_driver : no_config : x

-d-c-----n--F : /soc/spmi@fc4cf000/pm8841@4/temp-alarm@2400 : qcom,spmi-temp-alarm : drivers/thermal/qcom-spmi-temp-alarm.c : CONFIG_QCOM_SPMI_TEMP_ALARM : n

Md-c-------y- : /soc/spmi@fc4cf000/pm8841@5 : qcom,pm8841 : drivers/mfd/qcom-spmi-pmic.c : CONFIG_MFD_SPMI_PMIC : y
Md-c-------y- : /soc/spmi@fc4cf000/pm8841@5 : qcom,spmi-pmic : drivers/mfd/qcom-spmi-pmic.c : CONFIG_MFD_SPMI_PMIC : y

Md-c-------y- : /soc/spmi@fc4cf000/pm8941@0 : qcom,pm8941 : drivers/mfd/qcom-spmi-pmic.c : CONFIG_MFD_SPMI_PMIC : y
Md-c-------y- : /soc/spmi@fc4cf000/pm8941@0 : qcom,spmi-pmic : drivers/mfd/qcom-spmi-pmic.c : CONFIG_MFD_SPMI_PMIC : y

-d-c-E-----y- : /soc/spmi@fc4cf000/pm8941@0/coincell@2800 : qcom,pm8941-coincell : drivers/misc/qcom-coincell.c : CONFIG_QCOM_COINCELL : y

Md-c-------y- : /soc/spmi@fc4cf000/pm8941@0/gpios@c000 : qcom,pm8941-gpio : drivers/pinctrl/qcom/pinctrl-spmi-gpio.c : CONFIG_PINCTRL_QCOM_SPMI_PMIC : y
M------------ : /soc/spmi@fc4cf000/pm8941@0/gpios@c000 : qcom,spmi-gpio : no_driver : no_config : x

M------------ : /soc/spmi@fc4cf000/pm8941@0/iadc@3600 : qcom,pm8941-iadc : no_driver : no_config : x
Md-c-----n--F : /soc/spmi@fc4cf000/pm8941@0/iadc@3600 : qcom,spmi-iadc : drivers/iio/adc/qcom-spmi-iadc.c : CONFIG_QCOM_SPMI_IADC : n

Md-c-------y- : /soc/spmi@fc4cf000/pm8941@0/mpps@a000 : qcom,pm8941-mpp : drivers/pinctrl/qcom/pinctrl-spmi-mpp.c : CONFIG_PINCTRL_QCOM_SPMI_PMIC : y
M------------ : /soc/spmi@fc4cf000/pm8941@0/mpps@a000 : qcom,spmi-mpp : no_driver : no_makefile : x

-d-c-----n--F : /soc/spmi@fc4cf000/pm8941@0/pwrkey@800 : qcom,pm8941-pwrkey : drivers/input/misc/pm8941-pwrkey.c : CONFIG_INPUT_PM8941_PWRKEY : n

-d-c-----n--F : /soc/spmi@fc4cf000/pm8941@0/temp-alarm@2400 : qcom,spmi-temp-alarm : drivers/thermal/qcom-spmi-temp-alarm.c : CONFIG_QCOM_SPMI_TEMP_ALARM : n

-d-c-----n--F : /soc/spmi@fc4cf000/pm8941@0/vadc@3100 : qcom,spmi-vadc : drivers/iio/adc/qcom-spmi-vadc.c : CONFIG_QCOM_SPMI_VADC : n

Md-c-------y- : /soc/spmi@fc4cf000/pm8941@1 : qcom,pm8941 : drivers/mfd/qcom-spmi-pmic.c : CONFIG_MFD_SPMI_PMIC : y
Md-c-------y- : /soc/spmi@fc4cf000/pm8941@1 : qcom,spmi-pmic : drivers/mfd/qcom-spmi-pmic.c : CONFIG_MFD_SPMI_PMIC : y

-d-c-E---n--F : /soc/spmi@fc4cf000/pm8941@1/wled@d800 : qcom,pm8941-wled : drivers/video/backlight/pm8941-wled.c : CONFIG_BACKLIGHT_PM8941_WLED : n

-d-c---H---y- : /soc/syscon@f9011000 : syscon : drivers/mfd/syscon.c : CONFIG_MFD_SYSCON : y

-d-c---H---y- : /soc/syscon@fd484000 : syscon : drivers/mfd/syscon.c : CONFIG_MFD_SYSCON : y

-dDc-------y- : /timer : arm,armv7-timer : arch/arm/kernel/vdso.c : CONFIG_VDSO : y
-dDc-------y- : /timer : arm,armv7-timer : drivers/clocksource/arm_arch_timer.c : CONFIG_ARM_ARCH_TIMER : y


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
