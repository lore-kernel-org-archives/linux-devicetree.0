From: Pratyush Anand <pratyush.anand@st.com>
Subject: [PATCH 01/15] arm: source drivers/pci/pcie/kconfig
Date: Mon, 29 Oct 2012 12:31:15 +0530
Message-ID: <aa6170ffb74697ac58dd4cbba9c82c2049e92cd3.1351492562.git.pratyush.anand@st.com>
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
 arch/arm/Kconfig |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 170e215..a644454 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -1434,6 +1434,7 @@ config PCI_HOST_ITE8152
 	select DMABOUNCE
 
 source "drivers/pci/Kconfig"
+source "drivers/pci/pcie/Kconfig"
 
 source "drivers/pcmcia/Kconfig"
 
-- 
1.7.5.4
