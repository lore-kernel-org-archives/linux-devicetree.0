Return-Path: <SRS0=MYDa=M6=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail.nic.cz ([217.31.204.67]:35006 "EHLO mail.nic.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727437AbeJRXau (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Thu, 18 Oct 2018 19:30:50 -0400
From: =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>
Subject: [PATCH 1/2] dt-bindings: mmc: Document no-uhs-voltage MMC property
Date: Thu, 18 Oct 2018 17:29:15 +0200
Message-Id: <20181018152916.9355-1-marek.behun@nic.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Add documentation for no-uhs-voltage MMC property.

Signed-off-by: Marek Behún <marek.behun@nic.cz>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org
---
 Documentation/devicetree/bindings/mmc/mmc.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mmc/mmc.txt b/Documentation/devicetree/bindings/mmc/mmc.txt
index f5a0923b34ca..0506dcbc2070 100644
--- a/Documentation/devicetree/bindings/mmc/mmc.txt
+++ b/Documentation/devicetree/bindings/mmc/mmc.txt
@@ -55,6 +55,7 @@ Optional properties:
 - no-sdio: controller is limited to send sdio cmd during initialization
 - no-sd: controller is limited to send sd cmd during initialization
 - no-mmc: controller is limited to send mmc cmd during initialization
+- no-uhs-voltage: controller does not support switching to UHS voltage
 - fixed-emmc-driver-type: for non-removable eMMC, enforce this driver type.
   The value <n> is the driver type as specified in the eMMC specification
   (table 206 in spec version 5.1).
-- 
2.18.1
