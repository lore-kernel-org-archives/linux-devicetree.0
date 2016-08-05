From: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH 0/4] arm64: marvell: add support for the PIC and PMU
Date: Fri,  5 Aug 2016 16:55:17 +0200
Message-ID: <1470408921-447-1-git-send-email-thomas.petazzoni@free-electrons.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Shadi Ammouri <shadi-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Yehuda Yitschak <yehuday-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Omri Itach <omrii-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Hanna Hawa <hannah-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Nadav Haklai <nadavh-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Neta Zur Hershkovits <neta-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello,

This small patch series intends to add support for the PMU of the
Cortex-A72 cores found in the Marvell Armada 7K/8K SoCs.

However, the interrupt of the PMU is not directly connected to the
GIC, but goes through a secondary interrupt controller called the
PIC. Therefore, this series starts by adding a small driver for this
interrupt controller, before enabling the PIC and the PMU in the
Device Tree.

Thanks!

Thomas

Thomas Petazzoni (4):
  dt-bindings: interrupt-controller: add DT binding for Marvell 7K/8K
    PIC
  irqchip: irq-mvebu-pic: new driver for Marvell Armada 7K/8K PIC
  arm64: marvell: enable the Marvell PIC driver
  arm64: dts: marvell: describe the PIC and PMU on Armada 7K/8K

 .../interrupt-controller/marvell,armada-8k-pic.txt |  25 +++
 arch/arm64/Kconfig.platforms                       |   1 +
 arch/arm64/boot/dts/marvell/armada-ap806.dtsi      |  14 ++
 drivers/irqchip/Kconfig                            |   3 +
 drivers/irqchip/Makefile                           |   1 +
 drivers/irqchip/irq-mvebu-pic.c                    | 195 +++++++++++++++++++++
 6 files changed, 239 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/marvell,armada-8k-pic.txt
 create mode 100644 drivers/irqchip/irq-mvebu-pic.c

-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
