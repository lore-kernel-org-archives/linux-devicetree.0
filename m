From: Joshua Clayton <stillcompiling@gmail.com>
Subject: [PATCH v12 6/6] fpga-manager: altera-ps-spi: use bitrev8x4
Date: Fri,  2 Jun 2017 13:30:52 -0700
Message-ID: <9486718188ff6ec3d4cb4e196b4caa33c5af48e1.1496434383.git.stillcompiling@gmail.com>
References: <684ea151ba9aa2c6555a299daf56552ddc11f596.1496434383.git.stillcompiling@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <684ea151ba9aa2c6555a299daf56552ddc11f596.1496434383.git.stillcompiling@gmail.com>
In-Reply-To: <20170525172911.11467-1-stillcompiling@gmail.com>
References: <20170525172911.11467-1-stillcompiling@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alan Tull <atull@kernel.org>, Moritz Fischer <moritz.fischer@ettus.com>, Anatolij Gustschin <agust@denx.de>, Bastian Stender <bst@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, Joshua Clayton <stillcompiling@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Russell King <linux@armlinux.org.uk>, linux-fpga@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Speed up bit reversal by using hardware bit reversal
Add extra code to handle less than 4byte remnants, if any

Signed-off-by: Joshua Clayton <stillcompiling@gmail.com>
---
 drivers/fpga/altera-ps-spi.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/drivers/fpga/altera-ps-spi.c b/drivers/fpga/altera-ps-spi.c
index 0db8def668ed..14f14efdf0d5 100644
--- a/drivers/fpga/altera-ps-spi.c
+++ b/drivers/fpga/altera-ps-spi.c
@@ -149,12 +149,23 @@ static int altera_ps_write_init(struct fpga_manager *mgr,
 
 static void rev_buf(char *buf, size_t len)
 {
-	const char *fw_end = (buf + len);
+	u32 *fw32 = (u32 *)buf;
+	size_t extra_bytes = (len & 0x03);
+	const u32 *fw_end = (u32 *)(buf + len - extra_bytes);
 
 	/* set buffer to lsb first */
-	while (buf < fw_end) {
-		*buf = bitrev8(*buf);
-		buf++;
+	while (fw32 < fw_end) {
+		*fw32 = bitrev8x4(*fw32);
+		fw32++;
+	}
+
+	if (extra_bytes) {
+		buf = (char *)fw_end;
+		while (extra_bytes) {
+			*buf = bitrev8(*buf);
+			buf++;
+			extra_bytes--;
+		}
 	}
 }
 
-- 
2.11.0
