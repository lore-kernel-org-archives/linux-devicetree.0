From: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: [PATCH v3 0/7] i.MX6 PU power domain support
Date: Mon, 17 Feb 2014 11:04:56 +0100
Message-ID: <1392631503-17283-1-git-send-email-p.zabel@pengutronix.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The i.MX6Q can gate off the CPU and PU (GPU/VPU) power domains using the
Power Gating Controller (PGC) in the GPC register space. The CPU power
domain is already handled by wait state code, but the PU power domain can
be controlled using the generic power domain framework and power off the PU
supply regulator if all devices in the power domain are (runtime) suspended.

This patchset adds a GPC platform device initialized at subsys_initcall time
(after anatop regulators) that binds to the gpc device tree node and sets up
the PU power domain:

	gpc: gpc@020dc000 {
		#address-cells = <1>;
		#size-cells = <1>;
		compatible = "fsl,imx6q-gpc";
		reg = <0x020dc000 0x4000>;
		interrupts = <0 89 0x04 0 90 0x04>;
		pu-supply = <&reg_pu>;

		pd_pu: pu-power-domain@020dc260 {
			compatible = "fsl,imx6q-power-domain";
			reg = <0x020dc260 0x10>;
		};

		pd_arm: cpu-power-domain@020dc2a0 {
			compatible = "fsl,imx6q-power-domain";
			reg = <0x020dc2a0 0x10>;
		};
	};

The cpu-power-domain node is included for completeness' sake, it is not
currently used by the code.
It registers a platform bus notifier so that it can add GPU and VPU devices
to the power domain when they are bound. If finds devices to be added to the
power domain by scanning the device tree for nodes that contain a
	power-domain = <&pd_pu>;
property.

For i.MX6QDL there is only one power domain that can be disabled at runtime,
on i.MX6SL there is an additional DISPLAY power domain, which is not yet
handled by the code.

Changes since v2:
 - Only disable PU power domain on boot if CONFIG_PM_RUNTIME is enabled
 - Removed superfluous second assignment of imx6q_pu_domain.of_node

regards
Philipp

Philipp Zabel (7):
  Documentation: Add device tree bindings for Freescale i.MX GPC
  ARM: imx6: gpc: Add PU power domain for GPU/VPU
  ARM: imx6: gpc: Add pm clock support to PU power domain
  ARM: imx6: gpc: Add observed worst case latencies
  ARM: dts: imx6qdl: Allow disabling the PU regulator, add a enable ramp
    delay
  ARM: dts: imx6qdl: Add power-domain information to gpc node
  ARM: dts: imx6sl: Add power-domain information to gpc node

 .../devicetree/bindings/power/fsl,imx-gpc.txt      |  61 +++++
 arch/arm/boot/dts/imx6qdl.dtsi                     |  16 +-
 arch/arm/boot/dts/imx6sl.dtsi                      |  18 ++
 arch/arm/mach-imx/Kconfig                          |   2 +
 arch/arm/mach-imx/gpc.c                            | 256 +++++++++++++++++++++
 5 files changed, 352 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/power/fsl,imx-gpc.txt

-- 
1.8.5.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
