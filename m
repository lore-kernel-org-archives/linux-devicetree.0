From: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Subject: [PATCH 4/8] Documentation: devicetree: Document Tronsmart vendor prefix
Date: Tue,  1 Mar 2016 00:44:21 +0100
Message-ID: <1456789465-2962-5-git-send-email-afaerber@suse.de>
References: <1456789465-2962-1-git-send-email-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1456789465-2962-1-git-send-email-afaerber@suse.de>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-meson@googlegroups.com
Cc: Carlo Caione <carlo@caione.org>, linux-arm-kernel@lists.infradead.org, Matthias Brugger <mbrugger@suse.com>, Nicolas Saenz <nicolassaenzj@gmail.com>, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, "open list:OPEN FIRMWARE AND FLATTENED
	DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Choose the obvious prefix, "tronsmart".

Cc: Matthias Brugger <mbrugger@suse.com>
Signed-off-by: Andreas F=C3=A4rber <afaerber@suse.de>
---
 Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Do=
cumentation/devicetree/bindings/vendor-prefixes.txt
index f871e8e7e98f..662edc7bce04 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -243,6 +243,7 @@ toshiba	Toshiba Corporation
 toumaz	Toumaz
 tplink	TP-LINK Technologies Co., Ltd.
 tronfy	Tronfy
+tronsmart	Tronsmart
 truly	Truly Semiconductors Limited
 upisemi	uPI Semiconductor Corp.
 urt	United Radiant Technology Corporation
--=20
2.6.2
