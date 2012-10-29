From: Pratyush Anand <pratyush.anand@st.com>
Subject: [PATCH 15/15] SPEAR13xx: update defconfig for PCIe compilation
Date: Mon, 29 Oct 2012 12:31:29 +0530
Message-ID: <53de70245fabbcb671cdb10663bee3c4f4610b48.1351492562.git.pratyush.anand@st.com>
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
 arch/arm/configs/spear13xx_defconfig |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/arch/arm/configs/spear13xx_defconfig b/arch/arm/configs/spear13xx_defconfig
index 3b559b8..cd9a150 100644
--- a/arch/arm/configs/spear13xx_defconfig
+++ b/arch/arm/configs/spear13xx_defconfig
@@ -14,6 +14,7 @@ CONFIG_PLAT_SPEAR=y
 CONFIG_ARCH_SPEAR13XX=y
 CONFIG_MACH_SPEAR1310=y
 CONFIG_MACH_SPEAR1340=y
+CONFIG_SPEAR13XX_PCI=y
 # CONFIG_SWP_EMULATE is not set
 CONFIG_SMP=y
 # CONFIG_ARM_CPU_TOPOLOGY is not set
-- 
1.7.5.4
