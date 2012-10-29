From: Pratyush Anand <pratyush.anand@st.com>
Subject: [PATCH 14/15] SPEAR13xx: Update makefile for PCIe inclusion
Date: Mon, 29 Oct 2012 12:31:28 +0530
Message-ID: <a52b6d280831df4d8a4e4fe3d72f3caaf985a88f.1351492562.git.pratyush.anand@st.com>
References: <cover.1351492562.git.pratyush.anand@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <cover.1351492562.git.pratyush.anand@st.com>
Sender: linux-pci-owner@vger.kernel.org
To: arnd@arndb.de, shiraz.hashim@st.com, viresh.linux@gmail.com
Cc: spear-devel@list.st.com, linux-pci@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, olof@lixom.net, Pratyush Anand <pratyush.anand@st.com>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Pratyush Anand <pratyush.anand@st.com>
---
 arch/arm/mach-spear13xx/Makefile |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-spear13xx/Makefile b/arch/arm/mach-spear13xx/Makefile
index b721566..f7a42fb 100644
--- a/arch/arm/mach-spear13xx/Makefile
+++ b/arch/arm/mach-spear13xx/Makefile
@@ -9,3 +9,4 @@ obj-$(CONFIG_ARCH_SPEAR13XX)	+= spear13xx.o
 obj-$(CONFIG_SUSPEND)		+= pm.o wakeup.o sleep_1340.o sleep_1310.o
 obj-$(CONFIG_MACH_SPEAR1310)	+= spear1310.o
 obj-$(CONFIG_MACH_SPEAR1340)	+= spear1340.o
+obj-$(CONFIG_SPEAR13XX_PCI)	+= pcie.o
-- 
1.7.5.4
