From: Eric Anholt <eric@anholt.net>
Subject: [PATCH 4/5] ARM: dts: bcm2835: Add VCHI node to the Raspberry Pi
 boards.
Date: Mon,  5 Mar 2018 12:28:05 -0800
Message-ID: <20180305202806.21219-5-eric@anholt.net>
References: <20180305202806.21219-1-eric@anholt.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180305202806.21219-1-eric@anholt.net>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Florian Fainelli <f.fainelli@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Phil Elwell <phil@raspberrypi.org>
Cc: Stefan Wahren <stefan.wahren@i2se.com>, linux-kernel@vger.kernel.org, Eric Anholt <eric@anholt.net>, bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

The VCHI firmware communication channel operates in parallel with our
other mailbox-based channel.  This is the communication channel that
exposes the firmware's media decode/encode and ISP interfaces.

Signed-off-by: Eric Anholt <eric@anholt.net>
---
 arch/arm/boot/dts/bcm2835-rpi.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/bcm2835-rpi.dtsi b/arch/arm/boot/dts/bcm2835-rpi.dtsi
index e36c392a2b8f..c128bc6a1435 100644
--- a/arch/arm/boot/dts/bcm2835-rpi.dtsi
+++ b/arch/arm/boot/dts/bcm2835-rpi.dtsi
@@ -27,6 +27,13 @@
 			firmware = <&firmware>;
 			#power-domain-cells = <1>;
 		};
+
+		vchi@7e00b840 {
+			compatible = "brcm,bcm2835-vchiq";
+			reg = <0x7e00b840 0xf>;
+			interrupts = <0 2>;
+			firmware = <&firmware>;
+		};
 	};
 };
 
-- 
2.16.2
