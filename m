From: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Subject: [PATCH 1/3] Documentation: vendor-prefixes: Add DT vendor entry "jnx"
Date: Fri,  7 Oct 2016 18:15:23 +0300
Message-ID: <1475853325-21796-2-git-send-email-pantelis.antoniou@konsulko.com>
References: <1475853325-21796-1-git-send-email-pantelis.antoniou@konsulko.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1475853325-21796-1-git-send-email-pantelis.antoniou@konsulko.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Debjit Ghosh <dghosh@juniper.net>, Guenter Roeck <linux@roeck-us.net>, JawaharBalaji Thirumalaisamy <jawaharb@juniper.net>, Mohammad Kamil <mkamil@juniper.net>, Rajat Jain <rajatjain@juniper.net>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: JawaharBalaji Thirumalaisamy <jawaharb@juniper.net>

Add a vendor-prefix for Juniper which is set to "jnx"

Signed-off-by: JawaharBalaji Thirumalaisamy <jawaharb@juniper.net>
Signed-off-by: Guenter Roeck <groeck@juniper.net>
[Ported from Juniper kernel]
Signed-off-by: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index 77e985f..044dc36 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -143,6 +143,7 @@ isil	Intersil
 issi	Integrated Silicon Solutions Inc.
 jdi	Japan Display Inc.
 jedec	JEDEC Solid State Technology Association
+jnx	Juniper Networks, Inc.
 karo	Ka-Ro electronics GmbH
 keithkoep	Keith & Koep GmbH
 keymile	Keymile GmbH
-- 
1.9.1
