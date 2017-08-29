From: Vadim Pasternak <vadimp@mellanox.com>
Subject: [patch v1 1/1] dt-bindings: Add vendor Mellanox
Date: Tue, 29 Aug 2017 18:02:57 +0000
Message-ID: <1504029777-192637-1-git-send-email-vadimp@mellanox.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Sender: linux-leds-owner@vger.kernel.org
To: robh+dt@kernel.org
Cc: devicetree@vger.kernel.org, platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org, jacek.anaszewski@gmail.com, lee.jones@linaro.org, jiri@resnulli.us, pavel@ucw.cz, gregkh@linuxfoundation.org, Vadim Pasternak <vadimp@mellanox.com>
List-Id: devicetree@vger.kernel.org

This patch adds Mellanox vendor to vendor-prefixes.

Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index ae09487..8730f33 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -196,6 +196,7 @@ mediatek	MediaTek Inc.
 megachips	MegaChips
 melexis	Melexis N.V.
 melfas	MELFAS Inc.
+mellanox	Mellanox Technologies
 memsic	MEMSIC Inc.
 merrii	Merrii Technology Co., Ltd.
 micrel	Micrel Inc.
-- 
2.1.4
