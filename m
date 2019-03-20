From: Leo Yan <leo.yan@linaro.org>
Subject: [PATCH] arm64: dts: juno: Enable smmu_pcie for Juno r1/r2
Date: Wed, 20 Mar 2019 16:31:05 +0800
Message-ID: <20190320083105.8954-1-leo.yan@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Leo Yan <leo.yan@linaro.org>
List-Id: devicetree@vger.kernel.org

Though PCIe controller has been enabled on Juno r1/r2, but it misses to
enable its connected SMMU.  From the testing, even without set this SMMU
status property to 'okay', the PCIe NIC device still works well.  Since
the SMMU is not enabled in DT binding and its iommu_groups is not
created properly, finally this prevents to enable vfio-pci for NIC
device with KVM.

After reviewing the code in dts, Juno r1/r2 both have enabled PCIe
controller but Juno r0 board (in juno.dts) doesn't contain PCIe
controller; hence this patch only change SMMU status property to 'okay'
for Juno r1/r2 dts files for the sake of only enabling it for Juno r1/r2
and avoiding touching Juno r0.

Committer testing on Juno r2:

Before:

  root@debian:~# tree /sys/kernel/iommu_groups/
  /sys/kernel/iommu_groups/
  ├── 0
  │   ├── devices
  │   │   ├── 7ffb0000.ohci -> ../../../../devices/platform/7ffb0000.ohci
  │   │   └── 7ffc0000.ehci -> ../../../../devices/platform/7ffc0000.ehci
  │   ├── reserved_regions
  │   └── type
  └── 1
      ├── devices
      │   └── 20070000.etr -> ../../../../devices/platform/20070000.etr
      ├── reserved_regions
      └── type

  7 directories, 4 files

After:

  root@debian:~# tree /sys/kernel/iommu_groups/
  /sys/kernel/iommu_groups/
  ├── 0
  │   ├── devices
  │   │   ├── 0000:00:00.0 -> ../../../../devices/platform/40000000.pcie/pci0000:00/0000:00:00.0
  │   │   ├── 0000:01:00.0 -> ../../../../devices/platform/40000000.pcie/pci0000:00/0000:00:00.0/0000:01:00.0
  │   │   ├── 0000:02:01.0 -> ../../../../devices/platform/40000000.pcie/pci0000:00/0000:00:00.0/0000:01:00.0/0000:02:01.0
  │   │   ├── 0000:02:02.0 -> ../../../../devices/platform/40000000.pcie/pci0000:00/0000:00:00.0/0000:01:00.0/0000:02:02.0
  │   │   ├── 0000:02:03.0 -> ../../../../devices/platform/40000000.pcie/pci0000:00/0000:00:00.0/0000:01:00.0/0000:02:03.0
  │   │   ├── 0000:02:0c.0 -> ../../../../devices/platform/40000000.pcie/pci0000:00/0000:00:00.0/0000:01:00.0/0000:02:0c.0
  │   │   ├── 0000:02:10.0 -> ../../../../devices/platform/40000000.pcie/pci0000:00/0000:00:00.0/0000:01:00.0/0000:02:10.0
  │   │   ├── 0000:02:1f.0 -> ../../../../devices/platform/40000000.pcie/pci0000:00/0000:00:00.0/0000:01:00.0/0000:02:1f.0
  │   │   ├── 0000:03:00.0 -> ../../../../devices/platform/40000000.pcie/pci0000:00/0000:00:00.0/0000:01:00.0/0000:02:01.0/0000:03:00.0
  │   │   └── 0000:08:00.0 -> ../../../../devices/platform/40000000.pcie/pci0000:00/0000:00:00.0/0000:01:00.0/0000:02:1f.0/0000:08:00.0
  │   ├── reserved_regions
  │   └── type
  ├── 1
  │   ├── devices
  │   │   ├── 7ffb0000.ohci -> ../../../../devices/platform/7ffb0000.ohci
  │   │   └── 7ffc0000.ehci -> ../../../../devices/platform/7ffc0000.ehci
  │   ├── reserved_regions
  │   └── type
  └── 2
      ├── devices
      │   └── 20070000.etr -> ../../../../devices/platform/20070000.etr
      ├── reserved_regions
      └── type

  19 directories, 6 files

Signed-off-by: Leo Yan <leo.yan@linaro.org>
---
 arch/arm64/boot/dts/arm/juno-r1.dts | 4 ++++
 arch/arm64/boot/dts/arm/juno-r2.dts | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/arm/juno-r1.dts b/arch/arm64/boot/dts/arm/juno-r1.dts
index b2b7ced633cf..67e161a6272a 100644
--- a/arch/arm64/boot/dts/arm/juno-r1.dts
+++ b/arch/arm64/boot/dts/arm/juno-r1.dts
@@ -226,6 +226,10 @@
 	status = "okay";
 };
 
+&smmu_pcie {
+	status = "okay";
+};
+
 &pcie_ctlr {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/arm/juno-r2.dts b/arch/arm64/boot/dts/arm/juno-r2.dts
index ab77adb4f3c2..0e1c5c814b01 100644
--- a/arch/arm64/boot/dts/arm/juno-r2.dts
+++ b/arch/arm64/boot/dts/arm/juno-r2.dts
@@ -226,6 +226,10 @@
 	status = "okay";
 };
 
+&smmu_pcie {
+	status = "okay";
+};
+
 &pcie_ctlr {
 	status = "okay";
 };
-- 
2.17.1
