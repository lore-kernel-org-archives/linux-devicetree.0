From: Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>
Subject: [PATCH 3/9] ARM: davinci: arrange kconfig selects in alphabetical
	order
Date: Wed, 12 Sep 2012 22:05:26 +0530
Message-ID: <1347467732-1332-4-git-send-email-nsekhar@ti.com>
References: <1347467732-1332-1-git-send-email-nsekhar@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <davinci-linux-open-source-bounces+gld-davinci-linux-open-source=gmane.org-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>
In-Reply-To: <1347467732-1332-1-git-send-email-nsekhar-l0cyMroinI0@public.gmane.org>
List-Unsubscribe: <http://linux.davincidsp.com/mailman/options/davinci-linux-open-source>,
	<mailto:davinci-linux-open-source-request-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org?subject=unsubscribe>
List-Archive: <http://linux.davincidsp.com/pipermail/davinci-linux-open-source>
List-Post: <mailto:davinci-linux-open-source-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>
List-Help: <mailto:davinci-linux-open-source-request-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org?subject=help>
List-Subscribe: <http://linux.davincidsp.com/mailman/listinfo/davinci-linux-open-source>,
	<mailto:davinci-linux-open-source-request-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org?subject=subscribe>
Sender: <davinci-linux-open-source-bounces+gld-davinci-linux-open-source=gmane.org-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>
Errors-To: davinci-linux-open-source-bounces+gld-davinci-linux-open-source=gmane.org-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Kevin Hilman <khilman-l0cyMroinI0@public.gmane.org>
Cc: davinci-linux-open-source-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Heiko Schocher <hs-ynQEQJNshbs@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Arrange Kconfig selects for DaVinci in alphabetical order.
This makes it easier to avoid adding duplicate selects.

Signed-off-by: Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>
---
 arch/arm/Kconfig |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index c5f9ae5..df04b0b 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -963,14 +963,14 @@ config ARCH_NOMADIK
 
 config ARCH_DAVINCI
 	bool "TI DaVinci"
-	select GENERIC_CLOCKEVENTS
+	select ARCH_HAS_HOLES_MEMORYMODEL
 	select ARCH_REQUIRE_GPIOLIB
-	select ZONE_DMA
-	select HAVE_IDE
 	select CLKDEV_LOOKUP
 	select GENERIC_ALLOCATOR
+	select GENERIC_CLOCKEVENTS
 	select GENERIC_IRQ_CHIP
-	select ARCH_HAS_HOLES_MEMORYMODEL
+	select HAVE_IDE
+	select ZONE_DMA
 	help
 	  Support for TI's DaVinci platform.
 
-- 
1.7.10.1
