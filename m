From: "Maciej S. Szmigiero" <mail@maciej.szmigiero.name>
Subject: [PATCH 1/3] of: Add United Radiant Technology Corporation vendor
 prefix
Date: Wed, 07 Oct 2015 22:59:53 +0200
Message-ID: <561587C9.2000207@maciej.szmigiero.name>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Cc: dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, David Airlie <airlied@linux.ie>, linux-kernel <linux-kernel@vger.kernel.org>, Thierry Reding <thierry.reding@gmail.com>
List-Id: devicetree@vger.kernel.org

This adds vendor prefix for United Radiant Technology Corporation,
a provider of liquid crystal display technologies.

Signed-off-by: Maciej Szmigiero <mail@maciej.szmigiero.name>
---
 Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index 82d2ac9..01e3cee 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -223,6 +223,7 @@ toshiba	Toshiba Corporation
 toumaz	Toumaz
 tplink	TP-LINK Technologies Co., Ltd.
 truly	Truly Semiconductors Limited
+urt	United Radiant Technology Corporation
 usi	Universal Scientific Industrial Co., Ltd.
 v3	V3 Semiconductor
 variscite	Variscite Ltd.
