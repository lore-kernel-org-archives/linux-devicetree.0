From: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 3/5] phy: berlin-sata: Document BG2 compatible
Date: Sat, 11 Oct 2014 17:41:11 +0200
Message-ID: <1413042073-14253-4-git-send-email-sebastian.hesselbarth@gmail.com>
References: <1413042073-14253-1-git-send-email-sebastian.hesselbarth@gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1413042073-14253-1-git-send-email-sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, =?UTF-8?q?Antoine=20T=C3=A9nart?= <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Berlin BG2 SATA PHY is slightly different from currently supported
BG2Q SATA PHY. Document the new compatible for BG2's PHY.

Signed-off-by: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
Cc: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>=20
Cc: "Antoine T=C3=A9nart" <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org=20
---
 Documentation/devicetree/bindings/phy/berlin-sata-phy.txt | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/phy/berlin-sata-phy.txt =
b/Documentation/devicetree/bindings/phy/berlin-sata-phy.txt
index 88f8c23384c0..c0155f842f62 100644
--- a/Documentation/devicetree/bindings/phy/berlin-sata-phy.txt
+++ b/Documentation/devicetree/bindings/phy/berlin-sata-phy.txt
@@ -2,7 +2,9 @@ Berlin SATA PHY
 ---------------
=20
 Required properties:
-- compatible: should be "marvell,berlin2q-sata-phy"
+- compatible: should be one of
+    "marvell,berlin2-sata-phy"
+    "marvell,berlin2q-sata-phy"
 - address-cells: should be 1
 - size-cells: should be 0
 - phy-cells: from the generic PHY bindings, must be 1
--=20
2.1.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
