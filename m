From: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Subject: [PATCH v2 3/6] Documentation: devicetree: amlogic: Document Meson GXBaby
Date: Wed,  2 Mar 2016 03:34:58 +0100
Message-ID: <1456886101-22967-4-git-send-email-afaerber@suse.de>
References: <1456886101-22967-1-git-send-email-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1456886101-22967-1-git-send-email-afaerber@suse.de>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-meson@googlegroups.com
Cc: Carlo Caione <carlo@caione.org>, linux-arm-kernel@lists.infradead.org, Matthias Brugger <mbrugger@suse.com>, Nicolas Saenz <nicolassaenzj@gmail.com>, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, "open list:OPEN FIRMWARE AND FLATTENED
	DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Use "amlogic,meson-gxbb" compatible string.

Signed-off-by: Andreas F=C3=A4rber <afaerber@suse.de>
---
 v1 -> v2: unchanged
=20
 Documentation/devicetree/bindings/arm/amlogic.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.txt b/Docume=
ntation/devicetree/bindings/arm/amlogic.txt
index 1dfee20eee74..776f08ca215f 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.txt
+++ b/Documentation/devicetree/bindings/arm/amlogic.txt
@@ -13,6 +13,10 @@ Boards with the Amlogic Meson8b SoC shall have the f=
ollowing properties:
   Required root node property:
     compatible: "amlogic,meson8b";
=20
+Boards with the Amlogic Meson GXBaby SoC shall have the following prop=
erties:
+  Required root node property:
+    compatible: "amlogic,meson-gxbb";
+
 Board compatible values:
   - "geniatech,atv1200" (Meson6)
   - "minix,neo-x8" (Meson8)
--=20
2.6.2
