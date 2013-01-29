From: "Vishwanathrao Badarkhe, Manish" <manishv.b-l0cyMroinI0@public.gmane.org>
Subject: [PATCH V2 3/6] ARM: davinci: da850: add DT node for I2C0
Date: Tue, 29 Jan 2013 13:08:51 +0530
Message-ID: <1359445134-13323-4-git-send-email-manishv.b@ti.com>
References: <1359445134-13323-1-git-send-email-manishv.b@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <davinci-linux-open-source-bounces-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>
In-Reply-To: <1359445134-13323-1-git-send-email-manishv.b-l0cyMroinI0@public.gmane.org>
List-Unsubscribe: <http://linux.davincidsp.com/mailman/options/davinci-linux-open-source>,
	<mailto:davinci-linux-open-source-request-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org?subject=unsubscribe>
List-Archive: <http://linux.davincidsp.com/pipermail/davinci-linux-open-source>
List-Post: <mailto:davinci-linux-open-source-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>
List-Help: <mailto:davinci-linux-open-source-request-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org?subject=help>
List-Subscribe: <http://linux.davincidsp.com/mailman/listinfo/davinci-linux-open-source>,
	<mailto:davinci-linux-open-source-request-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org?subject=subscribe>
Sender: <davinci-linux-open-source-bounces-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>
Errors-To: davinci-linux-open-source-bounces-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, davinci-linux-open-source-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org
Cc: rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, anilkumar-l0cyMroinI0@public.gmane.org, hs-ynQEQJNshbs@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add I2C0 device tree node information to da850-evm.
Also, add I2C0 pin muxing information in da850-evm.

Signed-off-by: Vishwanathrao Badarkhe, Manish <manishv.b-l0cyMroinI0@public.gmane.org>
---
Changes since V1:
 - Updated i2c0 node names in dts and dtsi file.
 - Removed interrupt parent from i2c0 node.
 - Handled i2c0 pin mux inside i2c0 node.

:100644 100644 433027f... c9ed683... M	arch/arm/boot/dts/da850-evm.dts
:100644 100644 5e0eb5c... 245ab9a... M	arch/arm/boot/dts/da850.dtsi
 arch/arm/boot/dts/da850-evm.dts |    5 +++++
 arch/arm/boot/dts/da850.dtsi    |   15 +++++++++++++++
 2 files changed, 20 insertions(+), 0 deletions(-)

diff --git a/arch/arm/boot/dts/da850-evm.dts b/arch/arm/boot/dts/da850-evm.dts
index 433027f..c9ed683 100644
--- a/arch/arm/boot/dts/da850-evm.dts
+++ b/arch/arm/boot/dts/da850-evm.dts
@@ -27,6 +27,11 @@
 		serial2: serial@1d0d000 {
 			status = "okay";
 		};
+		i2c0: i2c0@1c22000 {
+			status = "okay";
+			pinctrl-names = "default";
+			pinctrl-0 = <&i2c0_pins>;
+		};
 	};
 	nand_cs3@62000000 {
 		status = "okay";
diff --git a/arch/arm/boot/dts/da850.dtsi b/arch/arm/boot/dts/da850.dtsi
index 5e0eb5c..245ab9a 100644
--- a/arch/arm/boot/dts/da850.dtsi
+++ b/arch/arm/boot/dts/da850.dtsi
@@ -56,6 +56,12 @@
 					0x30 0x01100000  0x0ff00000
 				>;
 			};
+			i2c0_pins: pinmux_i2c0_pins {
+				pinctrl-single,bits = <
+					/* I2C0_SDA,I2C0_SCL */
+					0x10 0x00002200 0x0000ff00
+				>;
+			};
 		};
 		serial0: serial@1c42000 {
 			compatible = "ns16550a";
@@ -81,6 +87,15 @@
 			interrupts = <61>;
 			status = "disabled";
 		};
+		i2c0: i2c0@1c22000 {
+			compatible = "ti,davinci-i2c";
+			reg = <0x22000 0x1000>;
+			clock-frequency = <100000>;
+			interrupts = <15>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
 	};
 	nand_cs3@62000000 {
 		compatible = "ti,davinci-nand";
-- 
1.7.4.1
