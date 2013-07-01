From: Sean Cross <xobs@kosagi.com>
Subject: [PATCH 2/4] ARM: Enable PCI Express on ARM
Date: Mon,  1 Jul 2013 07:15:45 +0000
Message-ID: <1372662947-27160-3-git-send-email-xobs@kosagi.com>
References: <1372662947-27160-1-git-send-email-xobs@kosagi.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1372662947-27160-1-git-send-email-xobs@kosagi.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: devicetree-discuss@lists.ozlabs.org, linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Sean Cross <xobs@kosagi.com>
List-Id: devicetree@vger.kernel.org

Some ARM devices have PCI Express hardware, and should be able to take
advantage of PCI Express code present in the common driver files.  Enable
PCI Express on ARM, when PCI is available.

Signed-off-by: Sean Cross <xobs@kosagi.com>
---
 arch/arm/Kconfig |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 136f263..2f51f13 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -1418,6 +1418,8 @@ config PCI_HOST_ITE8152
 
 source "drivers/pci/Kconfig"
 
+source "drivers/pci/pcie/Kconfig"
+
 source "drivers/pcmcia/Kconfig"
 
 endmenu
-- 
1.7.9.5
