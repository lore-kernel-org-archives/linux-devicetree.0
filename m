Return-Path: <SRS0=kFSR=FN=gmail.com=joel.stan@kernel.org>
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
From: Joel Stanley <joel@jms.id.au>
Subject: [PATCH v2 3/3] misc: aspeed-lpc-ctrl: Enable FWH and A2H bridge cycles
Date: Mon, 19 Feb 2018 17:54:22 +1030
Message-Id: <20180219072422.22733-4-joel@jms.id.au>
In-Reply-To: <20180219072422.22733-1-joel@jms.id.au>
References: <20180219072422.22733-1-joel@jms.id.au>
To: Lee Jones <lee.jones@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Arnd Bergmann <arnd@arndb.de>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Andrew Jeffery <andrew@aj.id.au>, Cyril Bur <cyrilbur@gmail.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Ryan Chen <ryan_chen@aspeedtech.com>, Lei YU <mine260309@gmail.com>
List-ID: <devicetree@vger.kernel.org>

To date this driver has relied on prevous state from out of tree hacks
and vendor u-boot trees in order to have the host be able to access
data over the LPC bus.

Now we explicitly enable the AHB to LPC bridge and FWH cycles from when
the user first configures the address to map. We chose to do this then
as before that time there is no way for the kernel to know where it is
safe to point the LPC window.

Tested-by: Lei YU <mine260309@gmail.com>
Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 drivers/misc/aspeed-lpc-ctrl.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/misc/aspeed-lpc-ctrl.c b/drivers/misc/aspeed-lpc-ctrl.c
index 1827b7aa6674..a024f8042259 100644
--- a/drivers/misc/aspeed-lpc-ctrl.c
+++ b/drivers/misc/aspeed-lpc-ctrl.c
@@ -21,6 +21,10 @@
 
 #define DEVICE_NAME	"aspeed-lpc-ctrl"
 
+#define HICR5 0x0
+#define HICR5_ENL2H	BIT(8)
+#define HICR5_ENFWH	BIT(10)
+
 #define HICR7 0x8
 #define HICR8 0xc
 
@@ -155,8 +159,18 @@ static long aspeed_lpc_ctrl_ioctl(struct file *file, unsigned int cmd,
 		if (rc)
 			return rc;
 
-		return regmap_write(lpc_ctrl->regmap, HICR8,
-			(~(map.size - 1)) | ((map.size >> 16) - 1));
+		rc = regmap_write(lpc_ctrl->regmap, HICR8,
+				(~(map.size - 1)) | ((map.size >> 16) - 1));
+		if (rc)
+			return rc;
+
+		/*
+		 * Enable LPC FHW cycles. This is required for the host to
+		 * access the regions specified.
+		 */
+		return regmap_update_bits(lpc_ctrl->regmap, HICR5,
+				HICR5_ENFWH | HICR5_ENL2H,
+				HICR5_ENFWH | HICR5_ENL2H);
 	}
 
 	return -EINVAL;
-- 
2.15.1
