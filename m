From: Chen-Yu Tsai <wens@csie.org>
Subject: [PATCH v3 02/15] dt-bindings: net: broadcom-bluetooth: Add VBAT and VDDIO supplies
Date: Mon, 17 Dec 2018 12:04:36 +0800
Message-ID: <20181217040449.31437-3-wens@csie.org>
References: <20181217040449.31437-1-wens@csie.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181217040449.31437-1-wens@csie.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg <johan.hedberg@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Chen-Yu Tsai <wens@csie.org>, Loic Poulain <loic.poulain@gmail.com>, linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>, Ondrej Jirman <megous@megous.com>
List-Id: devicetree@vger.kernel.org

The Broadcom Bluetooth chips have two power inputs, VBAT and VDDIO.
The former provides overall power for the chip, while the latter powers
the I/O pins and buffers.

This patch adds properties for the two so we can describe the power
supply relationships.

Reviewed-by: Rob Herring <robh@kernel.org>
Tested-by: Ondrej Jirman <megous@megous.com>
Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
 Documentation/devicetree/bindings/net/broadcom-bluetooth.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/broadcom-bluetooth.txt b/Documentation/devicetree/bindings/net/broadcom-bluetooth.txt
index 711c75ac2bb5..78cfa0fbece9 100644
--- a/Documentation/devicetree/bindings/net/broadcom-bluetooth.txt
+++ b/Documentation/devicetree/bindings/net/broadcom-bluetooth.txt
@@ -23,6 +23,8 @@ Optional properties:
    - "extclk": deprecated, replaced by "txco"
    - "txco": external reference clock (not a standalone crystal)
    - "lpo": external low power 32.768 kHz clock
+ - vbat-supply: phandle to regulator supply for VBAT
+ - vddio-supply: phandle to regulator supply for VDDIO
 
 
 Example:
-- 
2.20.0
