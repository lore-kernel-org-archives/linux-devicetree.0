From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
Subject: [PATCH V2 3/5] ARM: BCM5301X: Set GPIO enabling USB power on Netgear R7000
Date: Wed,  7 Dec 2016 08:56:53 +0100
Message-ID: <20161207075655.7396-3-zajec5@gmail.com>
References: <20161207075655.7396-1-zajec5@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20161207075655.7396-1-zajec5@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Hauke Mehrtens <hauke@hauke-m.de>, bcm-kernel-feedback-list@broadcom.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
List-Id: devicetree@vger.kernel.org

From: Rafał Miłecki <rafal@milecki.pl>

There is one GPIO controlling power for both USB ports.

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
V2: Avoid double Signed-off-by due to different e-mail address
---
 arch/arm/boot/dts/bcm4709-netgear-r7000.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/bcm4709-netgear-r7000.dts b/arch/arm/boot/dts/bcm4709-netgear-r7000.dts
index 0225d82..7ab1176 100644
--- a/arch/arm/boot/dts/bcm4709-netgear-r7000.dts
+++ b/arch/arm/boot/dts/bcm4709-netgear-r7000.dts
@@ -100,3 +100,11 @@
 		};
 	};
 };
+
+&usb2 {
+	vcc-gpio = <&chipcommon 0 GPIO_ACTIVE_HIGH>;
+};
+
+&usb3 {
+	vcc-gpio = <&chipcommon 0 GPIO_ACTIVE_HIGH>;
+};
-- 
2.10.1
