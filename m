From: Chen-Yu Tsai <wens@csie.org>
Subject: [PATCH v2 02/15] dt-bindings: net: broadcom-bluetooth: Add VBAT and
 VDDIO supplies
Date: Thu, 15 Nov 2018 17:35:50 +0800
Message-ID: <20181115093603.26729-3-wens@csie.org>
References: <20181115093603.26729-1-wens@csie.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20181115093603.26729-1-wens@csie.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg <johan.hedberg@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Maxime Ripard <maxime.ripard@bootlin.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, Loic Poulain <loic.poulain@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

The Broadcom Bluetooth chips have two power inputs, VBAT and VDDIO.
The former provides overall power for the chip, while the latter powers
the I/O pins and buffers.

This patch adds properties for the two so we can describe the power
supply relationships.

Reviewed-by: Rob Herring <robh@kernel.org>
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
2.19.1
