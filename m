From: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Subject: [PATCH v3 07/12] dt-bindings: add AXP803's regulator info
Date: Mon, 17 Apr 2017 19:57:42 +0800
Message-ID: <20170417115747.7300-8-icenowy@aosc.io>
References: <20170417115747.7300-1-icenowy@aosc.io>
Reply-To: icenowy-h8G6r0blFSE@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBDS6XAN6ZADRBJ652LDQKGQEYHKI57I-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20170417115747.7300-1-icenowy-h8G6r0blFSE@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
List-Id: devicetree@vger.kernel.org

AXP803 have the most regulators in currently supported AXP PMICs.

Add info for the regulators in the dt-bindings document.

Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
Changes in v3:
- Added Rob's ACK.
Changes in v2:
- Place AXP803 regulators before AXP806/809 ones.

 Documentation/devicetree/bindings/mfd/axp20x.txt | 27 ++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/axp20x.txt b/Documentation/devicetree/bindings/mfd/axp20x.txt
index 44df88be3c89..aca09af66514 100644
--- a/Documentation/devicetree/bindings/mfd/axp20x.txt
+++ b/Documentation/devicetree/bindings/mfd/axp20x.txt
@@ -96,6 +96,33 @@ LDO_IO1		: LDO		: ips-supply		: GPIO 1
 RTC_LDO		: LDO		: ips-supply		: always on
 DRIVEVBUS	: Enable output	: drivevbus-supply	: external regulator
 
+AXP803 regulators, type, and corresponding input supply names:
+
+Regulator	  Type		  Supply Name		  Notes
+---------	  ----		  -----------		  -----
+DCDC1		: DC-DC buck	: vin1-supply
+DCDC2		: DC-DC buck	: vin2-supply		: poly-phase capable
+DCDC3		: DC-DC	buck	: vin3-supply		: poly-phase capable
+DCDC4		: DC-DC	buck	: vin4-supply
+DCDC5		: DC-DC	buck	: vin5-supply		: poly-phase capable
+DCDC6		: DC-DC	buck	: vin6-supply		: poly-phase capable
+DC1SW		: On/Off Switch	:			: DCDC1 secondary output
+ALDO1		: LDO		: aldoin-supply		: shared supply
+ALDO2		: LDO		: aldoin-supply		: shared supply
+ALDO3		: LDO		: aldoin-supply		: shared supply
+DLDO1		: LDO		: dldoin-supply		: shared supply
+DLDO2		: LDO		: dldoin-supply		: shared supply
+DLDO3		: LDO		: dldoin-supply		: shared supply
+DLDO4		: LDO		: dldoin-supply		: shared supply
+ELDO1		: LDO		: eldoin-supply		: shared supply
+ELDO2		: LDO		: eldoin-supply		: shared supply
+ELDO3		: LDO		: eldoin-supply		: shared supply
+FLDO1		: LDO		: fldoin-supply		: shared supply
+FLDO2		: LDO		: fldoin-supply		: shared supply
+LDO_IO0		: LDO		: ips-supply		: GPIO 0
+LDO_IO1		: LDO		: ips-supply		: GPIO 1
+RTC_LDO		: LDO		: ips-supply		: always on
+
 AXP806 regulators, type, and corresponding input supply names:
 
 Regulator	  Type		  Supply Name		  Notes
-- 
2.12.2
