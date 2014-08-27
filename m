From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: [PATCH 01/16] devicetree: Add vendor prefix "mitsubishi" to vendor-prefixes.txt
Date: Wed, 27 Aug 2014 18:40:58 +0200
Message-ID: <1409157673-4154-2-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
References: <1409157673-4154-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <1409157673-4154-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-sh-owner@vger.kernel.org
To: dri-devel@lists.freedesktop.org
Cc: linux-sh@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Mitsubishi Electric Corporation has a numerical stock ticker, use the
company name as vendor prefix.

Cc: devicetree@vger.kernel.org
Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index ac7269f..7292cfc 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -83,6 +83,7 @@ maxim	Maxim Integrated Products
 mediatek	MediaTek Inc.
 micrel	Micrel Inc.
 microchip	Microchip Technology Inc.
+mitsubishi	Mitsubishi Electric Corporation
 mosaixtech	Mosaix Technologies, Inc.
 moxa	Moxa
 mpl	MPL AG
-- 
1.8.5.5

