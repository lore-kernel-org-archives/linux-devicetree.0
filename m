Return-Path: <SRS0=9KvZ=L3=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mx01.hxt-semitech.com ([223.203.96.7]:34175 "EHLO
        barracuda.hxt-semitech.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726832AbeIMONz (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Thu, 13 Sep 2018 10:13:55 -0400
From: Wang Dongsheng <dongsheng.wang@hxt-semitech.com>
Subject: [PATCH 1/2] dt-bindings: net: qcom: Add binding for shared mdio bus
Date: Thu, 13 Sep 2018 17:04:52 +0800
Message-ID: <1536829493-10088-2-git-send-email-dongsheng.wang@hxt-semitech.com>
In-Reply-To: <1536829493-10088-1-git-send-email-dongsheng.wang@hxt-semitech.com>
References: <1536829493-10088-1-git-send-email-dongsheng.wang@hxt-semitech.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: devicetree-owner@vger.kernel.org
To: timur@kernel.org
Cc: davem@davemloft.net, yu.zheng@hxt-semitech.com, Wang Dongsheng <dongsheng.wang@hxt-semitech.com>, devicetree@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com
List-ID: <devicetree@vger.kernel.org>

This property copy from "ibm,emac.txt" to describe a shared MIDO bus.
Since QDF2400 emac include MDIO, so If the motherboard has more than one
PHY connected to an MDIO bus, this property will point to the MAC device
that has the MDIO bus.

Signed-off-by: Wang Dongsheng <dongsheng.wang@hxt-semitech.com>
---
 Documentation/devicetree/bindings/net/qcom-emac.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/qcom-emac.txt b/Documentation/devicetree/bindings/net/qcom-emac.txt
index 346e6c7f47b7..50db71771358 100644
--- a/Documentation/devicetree/bindings/net/qcom-emac.txt
+++ b/Documentation/devicetree/bindings/net/qcom-emac.txt
@@ -24,6 +24,9 @@ Internal PHY node:
 The external phy child node:
 - reg : The phy address
 
+Optional properties:
+- mdio-device : Shared MIDO bus.
+
 Example:
 
 FSM9900:
@@ -86,6 +89,7 @@ soc {
 		reg = <0x0 0x38800000 0x0 0x10000>,
 		      <0x0 0x38816000 0x0 0x1000>;
 		interrupts = <0 256 4>;
+		mdio-device = <&emac1>;
 
 		clocks = <&gcc 0>, <&gcc 1>, <&gcc 3>, <&gcc 4>, <&gcc 5>,
 			 <&gcc 6>, <&gcc 7>;
-- 
2.18.0
