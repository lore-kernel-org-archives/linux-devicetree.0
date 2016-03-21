From: <tthayer@opensource.altera.com>
Subject: [PATCHv3 1/9] EDAC: Altera L2 Kconfig change from select to depends upon.
Date: Mon, 21 Mar 2016 11:01:38 -0500
Message-ID: <1458576106-24505-2-git-send-email-tthayer@opensource.altera.com>
References: <1458576106-24505-1-git-send-email-tthayer@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1458576106-24505-1-git-send-email-tthayer@opensource.altera.com>
Sender: linux-doc-owner@vger.kernel.org
To: bp@alien8.de, dougthompson@xmission.com, m.chehab@samsung.com, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux@arm.linux.org.uk, dinguyen@opensource.altera.com, grant.likely@linaro.org
Cc: devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, tthayer.linux@gmail.com, tthayer@opensource.altera.com
List-Id: devicetree@vger.kernel.org

From: Thor Thayer <tthayer@opensource.altera.com>

Force L2 cache dependency instead of forcing selection of
L2 cache.

Signed-off-by: Thor Thayer <tthayer@opensource.altera.com>
---
v2/3 No change
---
 drivers/edac/Kconfig |    5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/edac/Kconfig b/drivers/edac/Kconfig
index 37755e6..6ca7474 100644
--- a/drivers/edac/Kconfig
+++ b/drivers/edac/Kconfig
@@ -378,12 +378,11 @@ config EDAC_ALTERA
 
 config EDAC_ALTERA_L2C
 	bool "Altera L2 Cache ECC"
-	depends on EDAC_ALTERA=y
-	select CACHE_L2X0
+	depends on EDAC_ALTERA=y && CACHE_L2X0
 	help
 	  Support for error detection and correction on the
 	  Altera L2 cache Memory for Altera SoCs. This option
-	  requires L2 cache so it will force that selection.
+	  requires L2 cache.
 
 config EDAC_ALTERA_OCRAM
 	bool "Altera On-Chip RAM ECC"
-- 
1.7.9.5

