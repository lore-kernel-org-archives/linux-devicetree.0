From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Example 1 -- show only the nodes that have complications.
Date: Fri, 10 Jun 2016 16:05:04 -0700
Message-ID: <575B47A0.4050906@gmail.com>
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

Complications are things like multiple compatible values, multiple
matching drivers, node is not enabled, etc.

Upper case flags indicate what the complications are for each entry.

$ scripts/dtc/dt_to_config \
   --include-suspect \
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

-dDc---Hx---- : /cpus/l2-cache : cache : arch/avr32/kernel/setup.c : obj-y : x
-dDc---Hx---- : /cpus/l2-cache : cache : arch/ia64/kernel/perfmon.c : obj-y : x
-dDc---Hx---- : /cpus/l2-cache : cache : arch/ia64/kernel/topology.c : obj-y : x
-dDc---Hx---- : /cpus/l2-cache : cache : arch/mips/fw/arc/tree.c : lib-y : x
-dDc---Hx---- : /cpus/l2-cache : cache : arch/mips/kvm/mips.c : kvm-objs : x
-dDc---Hx---- : /cpus/l2-cache : cache : arch/powerpc/kernel/cacheinfo.c : obj-y : x
-dDc---Hx---- : /cpus/l2-cache : cache : arch/powerpc/platforms/powermac/setup.c : obj-y : x
-dDc---Hx---- : /cpus/l2-cache : cache : arch/sh/kernel/cpu/proc.c : obj-y : x
-dDc---H-n--F : /cpus/l2-cache : cache : arch/sparc/kernel/mdesc.c : CONFIG_SPARC64 : n
-dDc---H-n--F : /cpus/l2-cache : cache : drivers/atm/horizon.c : CONFIG_ATM_HORIZON : n
-dDc---Hx---- : /cpus/l2-cache : cache : drivers/base/cacheinfo.c : obj-y : x
-dDc---H-n--F : /cpus/l2-cache : cache : drivers/edac/octeon_edac-pc.c : CONFIG_EDAC_OCTEON_PC : n
-dDc---H-n--F : /cpus/l2-cache : cache : drivers/hwmon/adm1029.c : CONFIG_SENSORS_ADM1029 : n
-dDc---Hxn--F : /cpus/l2-cache : cache : drivers/ide/ide-disk_proc.c : CONFIG_IDE_PROC_FS && CONFIG_IDE_GD_ATA && ide-gd_mod-y : n, n, x
-dDc---Hx---- : /cpus/l2-cache : cache : drivers/md/bcache/super.c : bcache-y : x
-dDc---Hx---- : /cpus/l2-cache : cache : drivers/md/dm-cache-target.c : dm-cache-y : x
-dDc---Hx---- : /cpus/l2-cache : cache : drivers/of/base.c : obj-y : x
-dDc---Hx---- : /cpus/l2-cache : cache : drivers/staging/lustre/lustre/osc/osc_cache.c : osc-y : x
-dDc---Hx---- : /cpus/l2-cache : cache : fs/btrfs/disk-io.c : btrfs-y : x
-dDc---Hx---- : /cpus/l2-cache : cache : fs/cachefiles/bind.c : cachefiles-y : x
-dDc---H-n--F : /cpus/l2-cache : cache : fs/nfs/cache_lib.c : CONFIG_NFS_USE_LEGACY_DNS : n
-dDc---H-n--F : /cpus/l2-cache : cache : mm/memcontrol.c : CONFIG_MEMCG : n
-dDc---Hx---- : /cpus/l2-cache : cache : net/sunrpc/rpc_pipe.c : sunrpc-y : x
-dD----H----- : /cpus/l2-cache : cache : tools/perf/builtin-list.c : no_config : x
-dD----H----- : /cpus/l2-cache : cache : tools/perf/builtin-record.c : no_config : x

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

-dDc---Hx---- : /soc/syscon@f9011000 : syscon : arch/arm/mach-clps711x/devices.c : obj-y : x
-dDc---H-n--F : /soc/syscon@f9011000 : syscon : arch/arm/mach-u300/regulator.c : CONFIG_REGULATOR_AB3100 : n
-dDc---H-n--F : /soc/syscon@f9011000 : syscon : drivers/fpga/zynq-fpga.c : CONFIG_FPGA_MGR_ZYNQ_FPGA : n
-dDc---H---y- : /soc/syscon@f9011000 : syscon : drivers/hwspinlock/qcom_hwspinlock.c : CONFIG_HWSPINLOCK_QCOM : y
-dDc---H-n--F : /soc/syscon@f9011000 : syscon : drivers/input/touchscreen/ts4800-ts.c : CONFIG_TOUCHSCREEN_TS4800 : n
-dDc---H-n--F : /soc/syscon@f9011000 : syscon : drivers/irqchip/irq-digicolor.c : CONFIG_ARCH_DIGICOLOR : n
-dDcC--Hx---- : /soc/syscon@f9011000 : syscon : drivers/media/platform/omap3isp/isp.c : omap3-isp-objs : x
-dDcC--H-n--F : /soc/syscon@f9011000 : syscon : drivers/media/platform/omap3isp/isp.c : CONFIG_VIDEO_OMAP3 : n
-dDc---H---y- : /soc/syscon@f9011000 : syscon : drivers/mfd/syscon.c : CONFIG_MFD_SYSCON : y
-dDc---H-n--F : /soc/syscon@f9011000 : syscon : drivers/mfd/vexpress-sysreg.c : CONFIG_MFD_VEXPRESS_SYSREG : n
-dDcC--H-n--F : /soc/syscon@f9011000 : syscon : drivers/net/ethernet/ti/cpsw-common.c : CONFIG_TI_CPSW : n
-dDcC--H-n--F : /soc/syscon@f9011000 : syscon : drivers/net/ethernet/ti/cpsw-common.c : CONFIG_TI_DAVINCI_EMAC : n
-dDc---H-n--F : /soc/syscon@f9011000 : syscon : drivers/phy/phy-dm816x-usb.c : CONFIG_PHY_DM816X_USB : n
-dDc---H-n--F : /soc/syscon@f9011000 : syscon : drivers/phy/phy-exynos-mipi-video.c : CONFIG_PHY_EXYNOS_MIPI_VIDEO : n
-dDc---H-n--F : /soc/syscon@f9011000 : syscon : drivers/pinctrl/pinctrl-zynq.c : CONFIG_PINCTRL_ZYNQ : n
-dDc---H-n--F : /soc/syscon@f9011000 : syscon : drivers/power/reset/axxia-reset.c : CONFIG_POWER_RESET_AXXIA : n
-dDc---H-n--F : /soc/syscon@f9011000 : syscon : drivers/power/reset/brcmstb-reboot.c : CONFIG_POWER_RESET_BRCMSTB : n
-dDc---H-n--F : /soc/syscon@f9011000 : syscon : drivers/regulator/pbias-regulator.c : CONFIG_REGULATOR_PBIAS : n
-dDc---H-n--F : /soc/syscon@f9011000 : syscon : drivers/reset/reset-zynq.c : CONFIG_ARCH_ZYNQ : n
-dDcC--Hx---- : /soc/syscon@f9011000 : syscon : drivers/staging/media/omap4iss/iss.c : omap4-iss-objs : x
-dDcC--H-n--F : /soc/syscon@f9011000 : syscon : drivers/staging/media/omap4iss/iss.c : CONFIG_VIDEO_OMAP4 : n
-dDc---H-n--F : /soc/syscon@f9011000 : syscon : drivers/tty/serial/clps711x.c : CONFIG_SERIAL_CLPS711X : n
-dDc---H-n--F : /soc/syscon@f9011000 : syscon : drivers/watchdog/ts4800_wdt.c : CONFIG_TS4800_WATCHDOG : n

-dDc---Hx---- : /soc/syscon@fd484000 : syscon : arch/arm/mach-clps711x/devices.c : obj-y : x
-dDc---H-n--F : /soc/syscon@fd484000 : syscon : arch/arm/mach-u300/regulator.c : CONFIG_REGULATOR_AB3100 : n
-dDc---H-n--F : /soc/syscon@fd484000 : syscon : drivers/fpga/zynq-fpga.c : CONFIG_FPGA_MGR_ZYNQ_FPGA : n
-dDc---H---y- : /soc/syscon@fd484000 : syscon : drivers/hwspinlock/qcom_hwspinlock.c : CONFIG_HWSPINLOCK_QCOM : y
-dDc---H-n--F : /soc/syscon@fd484000 : syscon : drivers/input/touchscreen/ts4800-ts.c : CONFIG_TOUCHSCREEN_TS4800 : n
-dDc---H-n--F : /soc/syscon@fd484000 : syscon : drivers/irqchip/irq-digicolor.c : CONFIG_ARCH_DIGICOLOR : n
-dDcC--Hx---- : /soc/syscon@fd484000 : syscon : drivers/media/platform/omap3isp/isp.c : omap3-isp-objs : x
-dDcC--H-n--F : /soc/syscon@fd484000 : syscon : drivers/media/platform/omap3isp/isp.c : CONFIG_VIDEO_OMAP3 : n
-dDc---H---y- : /soc/syscon@fd484000 : syscon : drivers/mfd/syscon.c : CONFIG_MFD_SYSCON : y
-dDc---H-n--F : /soc/syscon@fd484000 : syscon : drivers/mfd/vexpress-sysreg.c : CONFIG_MFD_VEXPRESS_SYSREG : n
-dDcC--H-n--F : /soc/syscon@fd484000 : syscon : drivers/net/ethernet/ti/cpsw-common.c : CONFIG_TI_CPSW : n
-dDcC--H-n--F : /soc/syscon@fd484000 : syscon : drivers/net/ethernet/ti/cpsw-common.c : CONFIG_TI_DAVINCI_EMAC : n
-dDc---H-n--F : /soc/syscon@fd484000 : syscon : drivers/phy/phy-dm816x-usb.c : CONFIG_PHY_DM816X_USB : n
-dDc---H-n--F : /soc/syscon@fd484000 : syscon : drivers/phy/phy-exynos-mipi-video.c : CONFIG_PHY_EXYNOS_MIPI_VIDEO : n
-dDc---H-n--F : /soc/syscon@fd484000 : syscon : drivers/pinctrl/pinctrl-zynq.c : CONFIG_PINCTRL_ZYNQ : n
-dDc---H-n--F : /soc/syscon@fd484000 : syscon : drivers/power/reset/axxia-reset.c : CONFIG_POWER_RESET_AXXIA : n
-dDc---H-n--F : /soc/syscon@fd484000 : syscon : drivers/power/reset/brcmstb-reboot.c : CONFIG_POWER_RESET_BRCMSTB : n
-dDc---H-n--F : /soc/syscon@fd484000 : syscon : drivers/regulator/pbias-regulator.c : CONFIG_REGULATOR_PBIAS : n
-dDc---H-n--F : /soc/syscon@fd484000 : syscon : drivers/reset/reset-zynq.c : CONFIG_ARCH_ZYNQ : n
-dDcC--Hx---- : /soc/syscon@fd484000 : syscon : drivers/staging/media/omap4iss/iss.c : omap4-iss-objs : x
-dDcC--H-n--F : /soc/syscon@fd484000 : syscon : drivers/staging/media/omap4iss/iss.c : CONFIG_VIDEO_OMAP4 : n
-dDc---H-n--F : /soc/syscon@fd484000 : syscon : drivers/tty/serial/clps711x.c : CONFIG_SERIAL_CLPS711X : n
-dDc---H-n--F : /soc/syscon@fd484000 : syscon : drivers/watchdog/ts4800_wdt.c : CONFIG_TS4800_WATCHDOG : n

-dDc-------y- : /timer : arm,armv7-timer : arch/arm/kernel/vdso.c : CONFIG_VDSO : y
-dDc-------y- : /timer : arm,armv7-timer : drivers/clocksource/arm_arch_timer.c : CONFIG_ARM_ARCH_TIMER : y


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
