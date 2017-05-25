From: Joshua Clayton <stillcompiling@gmail.com>
Subject: [PATCH v11 1/6] fpga: Add flag to indicate SPI bitstream is
 bit-reversed
Date: Thu, 25 May 2017 10:29:06 -0700
Message-ID: <20170525172911.11467-2-stillcompiling@gmail.com>
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

From: Anatolij Gustschin <agust@denx.de>

Add a flag that is passed to the write_init() callback,
indicating that the SPI bitstream starts with LSB first.
SPI controllers usually send data with MSB first. If an
FPGA expects bitstream data as LSB first, the data must
be reversed either by the SPI controller or by the driver.

Alternatively the bitstream could be prepared as bit-reversed
to avoid the bit-swapping while sending. This flag indicates
such bit-reversed SPI bitstream. The low-level driver will
deal with the flag and perform bit-reversing if needed.

Signed-off-by: Anatolij Gustschin <agust@denx.de>
Signed-off-by: Joshua Clayton <stillcompiling@gmail.com>
---
 include/linux/fpga/fpga-mgr.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/linux/fpga/fpga-mgr.h b/include/linux/fpga/fpga-mgr.h
index b4ac24c4411d..01c348ca38b7 100644
--- a/include/linux/fpga/fpga-mgr.h
+++ b/include/linux/fpga/fpga-mgr.h
@@ -67,10 +67,12 @@ enum fpga_mgr_states {
  * FPGA Manager flags
  * FPGA_MGR_PARTIAL_RECONFIG: do partial reconfiguration if supported
  * FPGA_MGR_EXTERNAL_CONFIG: FPGA has been configured prior to Linux booting
+ * FPGA_MGR_BITSTREAM_LSB_FIRST: SPI bitstream bit order is LSB first
  */
 #define FPGA_MGR_PARTIAL_RECONFIG	BIT(0)
 #define FPGA_MGR_EXTERNAL_CONFIG	BIT(1)
 #define FPGA_MGR_ENCRYPTED_BITSTREAM	BIT(2)
+#define FPGA_MGR_BITSTREAM_LSB_FIRST	BIT(3)
 
 /**
  * struct fpga_image_info - information specific to a FPGA image
-- 
2.11.0
