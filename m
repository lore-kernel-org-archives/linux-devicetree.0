From: Florian Fainelli <florian@openwrt.org>
Subject: [PATCH 8/8] ARM: MSC814x: add MAINTAINERS entry
Date: Sun, 15 Jul 2012 16:49:14 +0200
Message-ID: <1342363754-30808-9-git-send-email-florian@openwrt.org>
References: <1342363754-30808-1-git-send-email-florian@openwrt.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1342363754-30808-1-git-send-email-florian@openwrt.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org
Cc: olof@lixom.net, devicetree-discuss@lists.ozlabs.org, Florian Fainelli <florian@openwrt.org>, arnd@arndb.de
List-Id: devicetree@vger.kernel.org

Signed-off-by: Florian Fainelli <florian@openwrt.org>
---
 MAINTAINERS |    6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 3e30a3a..593ca15 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -918,6 +918,12 @@ L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 F:	arch/arm/mach-pxa/mioa701.c
 S:	Maintained
 
+ARM/MOSCHIP MCS814X SUPPORT
+M:	Florian Fainelli <florian@openwrt.org>
+L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+F:	arch/arm/mach-mcs814x
+S:	Maintained
+
 ARM/NEC MOBILEPRO 900/c MACHINE SUPPORT
 M:	Michael Petchkovsky <mkpetch@internode.on.net>
 S:	Maintained
-- 
1.7.10.4
