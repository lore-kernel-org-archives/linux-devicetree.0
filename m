From: Javier Martinez Canillas <javier@dowhile0.org>
Subject: [PATCH v5 11/20] ARM: dts: socfpga: Add generic compatible string for
 I2C EEPROM
Date: Tue, 23 May 2017 15:34:39 +0200
Message-ID: <20170523133448.4794-12-javier@dowhile0.org>
References: <20170523133448.4794-1-javier@dowhile0.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170523133448.4794-1-javier@dowhile0.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-kernel@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>, Russell King <linux@armlinux.org.uk>, Dinh Nguyen <dinguyen@kernel.org>, Rob Herring <robh+dt@kernel.org>, Javier Martinez Canillas <javier@dowhile0.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

The at24 driver allows to register I2C EEPROM chips using different vendor
and devices, but the I2C subsystem does not take the vendor into account
when matching using the I2C table since it only has device entries.

But when matching using an OF table, both the vendor and device has to be
taken into account so the driver defines only a set of compatible strings
using the "atmel" vendor as a generic fallback for compatible I2C devices.

So add this generic fallback to the device node compatible string to make
the device to match the driver using the OF device ID table.

Signed-off-by: Javier Martinez Canillas <javier@dowhile0.org>

---

Changes in v5: None
Changes in v4:
- Only use the atmel manufacturer in the compatible string instead of
  keeping the deprecated ones (Rob Herring).

Changes in v3: None
Changes in v2: None

 arch/arm/boot/dts/socfpga_cyclone5_vining_fpga.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/socfpga_cyclone5_vining_fpga.dts b/arch/arm/boot/dts/socfpga_cyclone5_vining_fpga.dts
index 893198049397..4bb2791ab04a 100644
--- a/arch/arm/boot/dts/socfpga_cyclone5_vining_fpga.dts
+++ b/arch/arm/boot/dts/socfpga_cyclone5_vining_fpga.dts
@@ -294,7 +294,7 @@
 	clock-frequency = <100000>;
 
 	at24@50 {
-		compatible = "at24,24c02";
+		compatible = "atmel,24c02";
 		pagesize = <8>;
 		reg = <0x50>;
 	};
-- 
2.9.3
