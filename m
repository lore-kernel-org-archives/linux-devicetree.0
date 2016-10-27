From: <tthayer@opensource.altera.com>
Subject: [PATCHv2 4/4] ARM: socfpga: dts: Add Monitor to A10-SR MFD
Date: Thu, 27 Oct 2016 15:00:26 -0500
Message-ID: <1477598426-28125-5-git-send-email-tthayer@opensource.altera.com>
References: <1477598426-28125-1-git-send-email-tthayer@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1477598426-28125-1-git-send-email-tthayer@opensource.altera.com>
Sender: linux-kernel-owner@vger.kernel.org
To: lee.jones@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, dinguyen@opensource.altera.com, linux@armlinux.org.uk, arnd@arndb.de, gregkh@linuxfoundation.org
Cc: davem@davemloft.net, geert@linux-m68k.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Thor Thayer <tthayer@opensource.altera.com>
List-Id: devicetree@vger.kernel.org

From: Thor Thayer <tthayer@opensource.altera.com>

Add the Monitor functionality to the Arria10 DevKit
System Resource chip.

Signed-off-by: Thor Thayer <tthayer@opensource.altera.com>
---
v2  Change from -mon to -monitor for clarity.
---
 arch/arm/boot/dts/socfpga_arria10_socdk.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/socfpga_arria10_socdk.dtsi b/arch/arm/boot/dts/socfpga_arria10_socdk.dtsi
index eb00ae3..61a5f42 100644
--- a/arch/arm/boot/dts/socfpga_arria10_socdk.dtsi
+++ b/arch/arm/boot/dts/socfpga_arria10_socdk.dtsi
@@ -121,6 +121,10 @@
 			gpio-controller;
 			#gpio-cells = <2>;
 		};
+
+		a10sr_monitor {
+			compatible = "altr,a10sr-monitor";
+		};
 	};
 };
 
-- 
1.9.1
