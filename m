From: Chunyan Zhang <chunyan.zhang@spreadtrum.com>
Subject: [PATCH V2 3/3] serial: sprd: adjust TIMEOUT to a big value
Date: Tue, 21 Feb 2017 14:55:04 +0800
Message-ID: <1487660104-15693-4-git-send-email-chunyan.zhang@spreadtrum.com>
References: <1487660104-15693-1-git-send-email-chunyan.zhang@spreadtrum.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1487660104-15693-1-git-send-email-chunyan.zhang@spreadtrum.com>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, gregkh@linuxfoundation.org, catalin.marinas@arm.com, will.deacon@arm.com, arnd@arndb.de
Cc: orson.zhai@spreadtrum.com, sudeep.holla@arm.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, zhang.lyra@gmail.com
List-Id: devicetree@vger.kernel.org

From: Wei Qiao <wei.qiao@spreadtrum.com>

SPRD_TIMEOUT was 256, which is too small to wait until the status
switched to workable in a while loop, so that the earlycon could
not work correctly.

Signed-off-by: Wei Qiao <wei.qiao@spreadtrum.com>
Signed-off-by: Chunyan Zhang <chunyan.zhang@spreadtrum.com>
---
 drivers/tty/serial/sprd_serial.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/tty/serial/sprd_serial.c b/drivers/tty/serial/sprd_serial.c
index 699447a..cc1a55e 100644
--- a/drivers/tty/serial/sprd_serial.c
+++ b/drivers/tty/serial/sprd_serial.c
@@ -36,7 +36,7 @@
 #define SPRD_FIFO_SIZE		128
 #define SPRD_DEF_RATE		26000000
 #define SPRD_BAUD_IO_LIMIT	3000000
-#define SPRD_TIMEOUT		256
+#define SPRD_TIMEOUT		256000
 
 /* the offset of serial registers and BITs for them */
 /* data registers */
-- 
2.7.4
