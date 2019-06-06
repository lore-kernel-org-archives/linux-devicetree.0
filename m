Return-Path: <SRS0=gQZM=UF=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-lj1-f196.google.com ([209.85.208.196]:42274 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727828AbfFFNYu (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 6 Jun 2019 09:24:50 -0400
Received: by mail-lj1-f196.google.com with SMTP id t28so1993293lje.9
        for <devicetree@vger.kernel.org>; Thu, 06 Jun 2019 06:24:49 -0700 (PDT)
From: Krzysztof Michonski <michonskikrzysztof@gmail.com>
Subject: [PATCH 2/2] Enable secure monitor on gxl
Date: Thu,  6 Jun 2019 15:24:39 +0200
Message-Id: <20190606132439.25182-2-krzysztof.michonski@digitalstrom.com>
In-Reply-To: <20190606132439.25182-1-krzysztof.michonski@digitalstrom.com>
References: <20190606132439.25182-1-krzysztof.michonski@digitalstrom.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
To: khilman@baylibre.com, linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org
Cc: afenkart@gmail.com, Krzysztof Michonski <michonskikrzysztof@gmail.com>
List-ID: <devicetree@vger.kernel.org>

From: Krzysztof Michonski <michonskikrzysztof@gmail.com>

Add secure monitor node in the gxl dtsi file.

Signed-off-by: Krzysztof Michonski <michonskikrzysztof@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-gxl.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
index 3093ae421b17..fd75538ee9f9 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
@@ -37,6 +37,10 @@
 			};
 		};
 	};
+
+	sm: secure-monitor {
+		compatible = "amlogic,meson-gxl-sm";
+	};
 };
 
 &apb {
-- 
2.21.0
