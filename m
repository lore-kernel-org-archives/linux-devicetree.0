From: Thierry Escande <thierry.escande@collabora.com>
Subject: [PATCH v2 1/5] firmware: google memconsole: Remove useless submenu in Kconfig
Date: Tue, 28 Mar 2017 18:11:25 +0200
Message-ID: <1490717489-19218-2-git-send-email-thierry.escande@collabora.com>
References: <1490717489-19218-1-git-send-email-thierry.escande@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset = "utf-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1490717489-19218-1-git-send-email-thierry.escande@collabora.com>
Content-Transfert-Encoding: 8bit
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Olof Johansson <olof@lixom.net>, Stephen Warren <swarren@nvidia.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Julius Werner <jwerner@chromium.org>, Brian Norris <briannorris@chromium.org>
List-Id: devicetree@vger.kernel.org

This patch removes the "Google Firmware Drivers" menu containing a
menuconfig entry with the exact same name. The menuconfig is now
directly under the "Firmware Drivers" entry.

Signed-off-by: Thierry Escande <thierry.escande@collabora.com>
---
 drivers/firmware/google/Kconfig | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/firmware/google/Kconfig b/drivers/firmware/google/Kconfig
index 29c8cdd..475bd01 100644
--- a/drivers/firmware/google/Kconfig
+++ b/drivers/firmware/google/Kconfig
@@ -1,4 +1,4 @@
-config GOOGLE_FIRMWARE
+menuconfig GOOGLE_FIRMWARE
 	bool "Google Firmware Drivers"
 	depends on X86
 	default n
@@ -7,8 +7,7 @@ config GOOGLE_FIRMWARE
 	  only useful if you are working directly on one of their
 	  proprietary servers.  If in doubt, say "N".
 
-menu "Google Firmware Drivers"
-	depends on GOOGLE_FIRMWARE
+if GOOGLE_FIRMWARE
 
 config GOOGLE_SMI
 	tristate "SMI interface for Google platforms"
@@ -28,4 +27,4 @@ config GOOGLE_MEMCONSOLE
 	  the EBDA on Google servers.  If found, this log is exported to
 	  userland in the file /sys/firmware/log.
 
-endmenu
+endif # GOOGLE_FIRMWARE
-- 
2.7.4
