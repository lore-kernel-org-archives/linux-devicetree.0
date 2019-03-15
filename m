From: =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>
Subject: [PATCH v3 mailbox+firmware 6/6] dt-bindings: firmware: Document cznic,turris-mox-rwtm binding
Date: Fri, 15 Mar 2019 01:59:26 +0100
Message-ID: <20190315005926.5994-7-marek.behun@nic.cz>
References: <20190315005926.5994-1-marek.behun@nic.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190315005926.5994-1-marek.behun@nic.cz>
Sender: linux-kernel-owner@vger.kernel.org
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Jassi Brar <jaswinder.singh@linaro.org>, linux-kernel@vger.kernel.org, Gregory CLEMENT <gregory.clement@bootlin.com>, Miquel Raynal <miquel.raynal@bootlin.com>, Linus Walleij <linus.walleij@linaro.org>, linux-arm-kernel@lists.infradead.org, arm@kernel.org, =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This adds device tree binding documentation for the driver communicating
with the rWTM firmware on Turris Mox.

Signed-off-by: Marek Behún <marek.behun@nic.cz>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org
---
 .../firmware/cznic,turris-mox-rwtm.txt        | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/firmware/cznic,turris-mox-rwtm.txt

diff --git a/Documentation/devicetree/bindings/firmware/cznic,turris-mox-rwtm.txt b/Documentation/devicetree/bindings/firmware/cznic,turris-mox-rwtm.txt
new file mode 100644
index 000000000000..338169dea7bb
--- /dev/null
+++ b/Documentation/devicetree/bindings/firmware/cznic,turris-mox-rwtm.txt
@@ -0,0 +1,19 @@
+Turris Mox rWTM firmware driver
+
+Required properties:
+ - compatible		: Should be "cznic,turris-mox-rwtm"
+ - mboxes		: Must contain a reference to associated mailbox
+
+This device tree node should be used on Turris Mox, or potentially another A3700
+compatible device running the Mox's rWTM firmware in the secure processor (for
+example it is possible to flash this firmware into EspressoBin).
+
+Example:
+
+	firmware {
+		turris-mox-rwtm {
+			compatible = "cznic,turris-mox-rwtm";
+			mboxes = <&rwtm 0>;
+			status = "okay";
+		};
+	};
-- 
2.19.2
