From: Joshua Clayton <stillcompiling@gmail.com>
Subject: [PATCH v2 1/2] of: add vendor prefix for UniWest
Date: Thu, 14 Jan 2016 11:43:27 -0800
Message-ID: <1452800607-14818-1-git-send-email-stillcompiling@gmail.com>
References: <Re: [PATCH 1_2] of: add vendor prefix for UniWest>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <Re: [PATCH 1_2] of: add vendor prefix for UniWest>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Joshua Clayton <stillcompiling@gmail.com>
List-Id: devicetree@vger.kernel.org

United Western Technologies Corp, known primarily as UniWest,
is a manufacturer of eddy current and ultrasonic testing equipment.

Signed-off-by: Joshua Clayton <stillcompiling@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index 72e2c5a..f2f84580 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -239,6 +239,7 @@ toumaz	Toumaz
 tplink	TP-LINK Technologies Co., Ltd.
 tronfy	Tronfy
 truly	Truly Semiconductors Limited
+uniwest	United Western Technologies Corp (UniWest)
 upisemi	uPI Semiconductor Corp.
 usi	Universal Scientific Industrial Co., Ltd.
 v3	V3 Semiconductor
-- 
2.5.0
