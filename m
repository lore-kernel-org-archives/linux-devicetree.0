From: David Lechner <david@lechnology.com>
Subject: [PATCH v4 1/4] dt-bindings: Add vendor prefix for LEGO
Date: Fri, 13 Jan 2017 13:03:39 -0600
Message-ID: <1484334222-14223-2-git-send-email-david@lechnology.com>
References: <1484334222-14223-1-git-send-email-david@lechnology.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1484334222-14223-1-git-send-email-david@lechnology.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: David Lechner <david@lechnology.com>, Sekhar Nori <nsekhar@ti.com>, Kevin Hilman <khilman@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add a vendor prefix for LEGO Systems A/S

Signed-off-by: David Lechner <david@lechnology.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index 61cb272..c1ccfd4 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -159,6 +159,7 @@ kosagi	Sutajio Ko-Usagi PTE Ltd.
 kyo	Kyocera Corporation
 lacie	LaCie
 lantiq	Lantiq Semiconductor
+lego	LEGO Systems A/S
 lenovo	Lenovo Group Ltd.
 lg	LG Corporation
 licheepi	Lichee Pi
-- 
2.7.4
