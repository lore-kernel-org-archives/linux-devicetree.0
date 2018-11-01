From: Liming Sun <lsun@mellanox.com>
Subject: [PATCH v6 4/9] MAINTAINERS: Add entry for Mellanox Bluefield Soc
Date: Thu,  1 Nov 2018 12:25:33 -0400
Message-ID: <1541089538-175682-4-git-send-email-lsun@mellanox.com>
References: <1541089538-175682-1-git-send-email-lsun@mellanox.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1541089538-175682-1-git-send-email-lsun@mellanox.com>
In-Reply-To: <b143b40446c1870fb8d422b364ead95d54552be9.1527264077.git.lsun@mellanox.com>
References: <b143b40446c1870fb8d422b364ead95d54552be9.1527264077.git.lsun@mellanox.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, David Woods <dwoods@mellanox.com>, Robin Murphy <robin.murphy@arm.com>, arm-soc <arm@kernel.org>
Cc: devicetree@vger.kernel.org, Liming Sun <lsun@mellanox.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Add maintainer information for Mellanox BlueField SoC.

Reviewed-by: David Woods <dwoods@mellanox.com>
Signed-off-by: Liming Sun <lsun@mellanox.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 42a2f31..44fb693 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1694,6 +1694,14 @@ S:	Maintained
 F:	drivers/phy/mediatek/
 F:	Documentation/devicetree/bindings/phy/phy-mtk-*
 
+ARM/Mellanox BlueField SoC support
+M:	David Woods <dwoods@mellanox.com>
+M:	Liming Sun <lsun@mellanox.com>
+L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+S:	Maintained
+F:	drivers/soc/mellanox/*
+F:	Documentation/devicetree/bindings/soc/mellanox/tmfifo.txt
+
 ARM/MICREL KS8695 ARCHITECTURE
 M:	Greg Ungerer <gerg@uclinux.org>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
-- 
1.8.3.1
