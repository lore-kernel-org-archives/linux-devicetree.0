From: Sekhar Nori <nsekhar@ti.com>
Subject: [PATCH] MAINTAINERS: add device-tree files to TI DaVinci entry
Date: Thu, 25 May 2017 15:08:07 +0530
Message-ID: <20170525093807.21157-1-nsekhar@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Device Tree Mailing List <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Sekhar Nori <nsekhar@ti.com>, Kevin Hilman <khilman@kernel.org>
List-Id: devicetree@vger.kernel.org

Add device-tree files relevant to TI DaVinci platform
to its entry so mach-davinci sub-arch maintainers get
copied on patches with device-tree file updates.

Signed-off-by: Sekhar Nori <nsekhar@ti.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 9e984645c4b0..7a935d71f56f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11778,6 +11778,7 @@ T:	git git://git.kernel.org/pub/scm/linux/kernel/git/nsekhar/linux-davinci.git
 S:	Supported
 F:	arch/arm/mach-davinci/
 F:	drivers/i2c/busses/i2c-davinci.c
+F:	arch/arm/boot/dts/da850*
 
 TI DAVINCI SERIES MEDIA DRIVER
 M:	"Lad, Prabhakar" <prabhakar.csengg@gmail.com>
-- 
2.9.0
