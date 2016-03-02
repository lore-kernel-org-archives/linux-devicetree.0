From: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Subject: [PATCH v2 5/6] Documentation: devicetree: amlogic: Document Tronsmart Vega S95 boards
Date: Wed,  2 Mar 2016 03:35:00 +0100
Message-ID: <1456886101-22967-6-git-send-email-afaerber@suse.de>
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

Use "tronsmart,vega-s95" as well as
    "tronsmart,vega-s95-pro",
    "tronsmart,vega-s95-meta" and
    "tronsmart,vega-s95-telos" compatible strings.

Signed-off-by: Andreas F=C3=A4rber <afaerber@suse.de>
---
 v1 -> v2: unchanged
=20
 Documentation/devicetree/bindings/arm/amlogic.txt | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.txt b/Docume=
ntation/devicetree/bindings/arm/amlogic.txt
index 776f08ca215f..8a5122ab19b0 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.txt
+++ b/Documentation/devicetree/bindings/arm/amlogic.txt
@@ -22,3 +22,6 @@ Board compatible values:
   - "minix,neo-x8" (Meson8)
   - "tronfy,mxq" (Meson8b)
   - "hardkernel,odroid-c1" (Meson8b)
+  - "tronsmart,vega-s95-pro", "tronsmart,vega-s95" (Meson gxbb)
+  - "tronsmart,vega-s95-meta", "tronsmart,vega-s95" (Meson gxbb)
+  - "tronsmart,vega-s95-telos", "tronsmart,vega-s95" (Meson gxbb)
--=20
2.6.2
