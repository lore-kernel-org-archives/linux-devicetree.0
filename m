From: Liviu Dudau <Liviu.Dudau@arm.com>
Subject: [PATCH 1/4] pci: Add PLDA's XpressRICH3 PCIe host bridge PCI ID
Date: Fri,  9 Oct 2015 14:45:20 +0100
Message-ID: <1444398323-17354-2-git-send-email-Liviu.Dudau@arm.com>
References: <1444398323-17354-1-git-send-email-Liviu.Dudau@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1444398323-17354-1-git-send-email-Liviu.Dudau@arm.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Will Deacon <will.deacon@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Bjorn Helgaas <bhelgaas@google.com>, Mark Rutland <mark.rutland@arm.com>, Linus Walleij <linus.walleij@linaro.org>, Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh+dt@kernel.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Arnd Bergmann <arnd@arndb.de>, Jon Medhurst <tixy@linaro.org>
Cc: linux-pci <linux-pci@vger.kernel.org>, Andrew Murray <Andrew.Murray@arm.com>, LKML <linux-kernel@vger.kernel.org>, LAKML <linux-arm-kernel@lists.infradead.org>, device-tree <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

From: Andrew Murray <Andrew.Murray@arm.com>

Signed-off-by: Liviu Dudau <Liviu.Dudau@arm.com>
---
 include/linux/pci_ids.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/linux/pci_ids.h b/include/linux/pci_ids.h
index d9ba49c..1542b2b 100644
--- a/include/linux/pci_ids.h
+++ b/include/linux/pci_ids.h
@@ -1319,6 +1319,9 @@
 #define PCI_DEVICE_ID_NVIDIA_NFORCE_MCP79_SMBUS     0x0AA2
 #define PCI_DEVICE_ID_NVIDIA_NFORCE_MCP89_SATA	    0x0D85
 
+#define PCI_VENDOR_ID_PLDA		0x1556
+#define PCI_DEVICE_ID_XR3PCI		0x1100
+
 #define PCI_VENDOR_ID_IMS		0x10e0
 #define PCI_DEVICE_ID_IMS_TT128		0x9128
 #define PCI_DEVICE_ID_IMS_TT3D		0x9135
-- 
2.6.0
