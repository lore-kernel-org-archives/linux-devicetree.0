From: Shameerali Kolothum Thodi <shameerali.kolothum.thodi-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Subject: [RFC 0/4] irqchip, gicv3-its: Workaround for hisilicon 161010801
 erratum(bypass SMMU for MSI)
Date: Tue, 24 Jan 2017 13:40:10 +0000
Message-ID: <5887593A.201@huawei.com>
References: <588625CB.5060303@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <588625CB.5060303-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: marc.zyngier-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linuxarm-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, john.garry-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, guohanjun-hv44wF8Li93QT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On certain HiSilicon platforms (Hip05/Hip07) the GIC ITS and
PCIe RC deviates from the standard implementation and this breaks
PCIe MSI functionality when SMMU is enabled.

The HiSilicon erratum 161010801 describes this limitation of certain
HiSilicon platforms to support the SMMU mappings for MSI transactions.
On these platforms GICv3 ITS translator is presented with the deviceID
by extending the MSI payload data to 64 bits to include the deviceID.
Hence, the PCIe controller on this platforms has to differentiate the
MSI payload against other DMA payload and has to modify the MSI payload.
This basically makes it difficult for this platforms to have a SMMU
translation for MSI.

This patch implements a quirk to bypass the SMMU MSI transactions
on these platforms.The quirk is implemented in GICv3 ITS driver.

On top of this, the GICv3 ITS IIDR register is not populated correctly
on these platforms and this makes it difficult to use the existing
IIDR based quirk implementation in the GICv3 ITS driver.
This patch series adds a quirk mechanism based on device tree binding
or ACPI OEM information.

shameer (4):
  irqchip, gicv3-its: Add device tree binding for hisilicon 161010801
    erratum
  irqchip, gicv3-its:Workaround for HiSilicon erratum 161010801
  irqchip, gicv3-its: Introduce ACPI generic quirk framework
  irqchip, gicv3-its: Add HiSilicon acpi based erratum data.

 .../bindings/interrupt-controller/arm,gic-v3.txt   |   6 ++
 arch/arm64/Kconfig                                 |  15 +++
 drivers/irqchip/irq-gic-common.h                   |   1 +
 drivers/irqchip/irq-gic-v3-its.c                   | 117 ++++++++++++++++++++-
 4 files changed, 138 insertions(+), 1 deletion(-)

-- 
1.9.1








--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
