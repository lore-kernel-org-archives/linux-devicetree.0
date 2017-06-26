From: Florian Fainelli <f.fainelli@gmail.com>
Subject: [PATCH 1/4] misc: sram: Allow ARM64 to select SRAM_EXEC
Date: Mon, 26 Jun 2017 15:32:42 -0700
Message-ID: <20170626223248.14199-3-f.fainelli@gmail.com>
References: <20170626223248.14199-1-f.fainelli@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170626223248.14199-1-f.fainelli@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org
Cc: Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Florian Fainelli <f.fainelli@gmail.com>, Markus Mayer <mmayer@broadcom.com>, Arnd Bergmann <arnd@arndb.de>, "open list:BROADCOM BCM47XX MIPS ARCHITECTURE" <linux-mips@linux-mips.org>, Hauke Mehrtens <hauke@hauke-m.de>, =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, open list <linux-kernel@vger.kernel.org>, Ralf Baechle <ralf@linux-mips.org>, Eric Anholt <eric@anholt.net>, linux-pm@vger.kernerl.org, Rob Herring <robh+dt@kernel.org>, "maintainer:BROADCOM BCM7XXX ARM ARCHITECTURE" <bcm-kernel-feedback-list@broadcom.com>, Justin Chen <justinpopo6@gmail.com>, Gregory Fong <gregory.0xf0@gmail.com>, Doug Berger <opendmb@gmail.com>, Brian Norris <computersforpeace@gmail.com>
List-Id: devicetree@vger.kernel.org

Now that ARM64 also has a fncpy() implementation, allow selection
SRAM_EXEC for ARM64 as well.

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 drivers/misc/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig
index 07bbd4cc1852..ac8779278c0c 100644
--- a/drivers/misc/Kconfig
+++ b/drivers/misc/Kconfig
@@ -464,7 +464,7 @@ config SRAM
 	bool "Generic on-chip SRAM driver"
 	depends on HAS_IOMEM
 	select GENERIC_ALLOCATOR
-	select SRAM_EXEC if ARM
+	select SRAM_EXEC if ARM || ARM64
 	help
 	  This driver allows you to declare a memory region to be managed by
 	  the genalloc API. It is supposed to be used for small on-chip SRAM
-- 
2.9.3
