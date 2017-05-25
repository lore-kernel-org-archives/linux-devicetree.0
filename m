From: Joshua Clayton <stillcompiling@gmail.com>
Subject: [PATCH v11 6/6] fpga-manager: altera-ps-spi: use bitrev8x4
Date: Thu, 25 May 2017 10:29:11 -0700
Message-ID: <20170525172911.11467-7-stillcompiling@gmail.com>
References: <20170525172911.11467-1-stillcompiling@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170525172911.11467-1-stillcompiling@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Alan Tull <atull@kernel.org>, Moritz Fischer <moritz.fischer@ettus.com>, Anatolij Gustschin <agust@denx.de>, Bastian Stender <bst@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, Joshua Clayton <stillcompiling@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-fpga@vger.kernel.org, Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Speed up bit reversal by using hardware bit reversal
Add extra code to handle less than 4byte remnants, if any

Signed-off-by: Joshua Clayton <stillcompiling@gmail.com>
---
 drivers/fpga/altera-ps-spi.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/drivers/fpga/altera-ps-spi.c b/drivers/fpga/altera-ps-spi.c
index 9e90f8086cd5..baddead15476 100644
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
