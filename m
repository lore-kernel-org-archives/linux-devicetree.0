From: Xiaowei Song <songxiaowei@hisilicon.com>
Subject: [PATCH v8 4/4] defconfig: PCI: Enable  Kirin PCIe defconfig
Date: Fri, 26 May 2017 09:53:33 +0800
Message-ID: <20170526015333.92482-5-songxiaowei@hisilicon.com>
References: <20170526015333.92482-1-songxiaowei@hisilicon.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170526015333.92482-1-songxiaowei@hisilicon.com>
Sender: linux-kernel-owner@vger.kernel.org
To: bhelgaas@google.com, kishon@ti.com, jingoohan1@gmail.com, arnd@arndb.de, tn@semihalf.com, keith.busch@intel.com, niklas.cassel@axis.com, dhdang@apm.com, liudongdong3@huawei.com, gabriele.paoloni@huawei.com, robh+dt@kernel.org, mark.rutland@arm.com, catalin.marinas@arm.com, will.deacon@arm.com
Cc: chenyao11@huawei.com, puck.chen@hisilicon.com, songxiaowei@hisilicon.com, guodong.xu@linaro.org, wangbinghui@hisilicon.com, suzhuangluan@hisilicon.com, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Cc: Guodong Xu <guodong.xu@linaro.org>
Signed-off-by: Xiaowei Song <songxiaowei@hisilicon.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 7c48028ec64a..d56d8f1062ab 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -71,6 +71,7 @@ CONFIG_PCI_XGENE=y
 CONFIG_PCI_LAYERSCAPE=y
 CONFIG_PCI_HISI=y
 CONFIG_PCIE_QCOM=y
+CONFIG_PCIE_KIRIN=y
 CONFIG_PCIE_ARMADA_8K=y
 CONFIG_ARM64_VA_BITS_48=y
 CONFIG_SCHED_MC=y
-- 
2.11.GIT
