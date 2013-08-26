From: wangyuhang <wangyuhang2014@gmail.com>
Subject: [PATCH 1/2] spi: dual and quad support(device tree)
Date: Mon, 26 Aug 2013 13:47:59 +0800
Message-ID: <1377496080-14356-1-git-send-email-wangyuhang2014@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: broonie@kernel.org, linux-spi@vger.kernel.org, devicetree@vger.kernel.org, linux-mtd@lists.infradead.org
Cc: sourav.poddar@ti.com, pekon@ti.com, wangyuhang <wangyuhang2014@gmail.com>
List-Id: devicetree@vger.kernel.org

Add spi-tx-nbits and spi-rx-nbits for spi slave node.
 spi-tx-nbits:Number of bits used for MOSI(writting)
 spi-rx-nbits:Number of bits used for MISO(reading)
Support for spi-tx/rx-nbits in SPI framework has been picked[1].
[1]: http://comments.gmane.org/gmane.linux.kernel.spi.devel/14420
Commit Id:f477b7fb13df2b843997559ff34e87d054ba6538

Signed-off-by: wangyuhang <wangyuhang2014@gmail.com>
---
 Documentation/devicetree/bindings/spi/spi-bus.txt |   14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/spi/spi-bus.txt b/Documentation/devicetree/bindings/spi/spi-bus.txt
index 296015e..145ba96 100644
--- a/Documentation/devicetree/bindings/spi/spi-bus.txt
+++ b/Documentation/devicetree/bindings/spi/spi-bus.txt
@@ -55,6 +55,20 @@ contain the following properties.
     		chip select active high
 - spi-3wire       - (optional) Empty property indicating device requires
     		    3-wire mode.
+- spi-tx-nbits    - (optional) Number of bits used for MOSI(writting)
+- spi-rx-nbits    - (optional) Number of bits used for MISO(reading)
+
+So if for example the slave has 4 wires for writting and 2 wires for reading,
+and the spi-tx/rx-nbits property should be set as follows:
+
+spi-tx-nbits = <4>;
+spi-rx-nbits = <2>;
+
+Now the value that spi-tx-nbits and spi-rx-nbits can receive is only
+1(single), 2(dual) and 4(quad). If you don't set spi-tx-nbits or spi-rx-nbits,
+spi_device mode will be set in single(1 wire) as default. Another point, if
+property:spi-3wire is set, spi-tx/rx-nbits is forbidden to set to <2 or 4>,
+otherwise, an errro will return.
 
 If a gpio chipselect is used for the SPI slave the gpio number will be passed
 via the cs_gpio
-- 
1.7.9.5


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
