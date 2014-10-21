From: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Subject: [PATCH v2 5/5] ARM: berlin: Enable SATA on Sony NSZ-GS7
Date: Tue, 21 Oct 2014 11:07:57 +0200
Message-ID: <1413882477-27922-6-git-send-email-sebastian.hesselbarth@gmail.com>
References: <1413882477-27922-1-git-send-email-sebastian.hesselbarth@gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1413882477-27922-1-git-send-email-sebastian.hesselbarth@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: Kishon Vijay Abraham I <kishon@ti.com>, =?UTF-8?q?Antoine=20T=C3=A9nart?= <antoine.tenart@free-electrons.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Marvell Berlin BG2 based Sony NSZ-GS7 has an unpopulated SATA plug
on its PCB solder side. As it is quite easy to populate and I have
done it, enable AHCI and SATA by default.

Acked-by: Antoine T=C3=A9nart <antoine.tenart@free-electrons.com>
Signed-off-by: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
---
Cc: Kishon Vijay Abraham I <kishon@ti.com>=20
Cc: "Antoine T=C3=A9nart" <antoine.tenart@free-electrons.com>
Cc: devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org=20
---
 arch/arm/boot/dts/berlin2-sony-nsz-gs7.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/berlin2-sony-nsz-gs7.dts b/arch/arm/boot=
/dts/berlin2-sony-nsz-gs7.dts
index c72bfd468d10..0a13e8a5da15 100644
--- a/arch/arm/boot/dts/berlin2-sony-nsz-gs7.dts
+++ b/arch/arm/boot/dts/berlin2-sony-nsz-gs7.dts
@@ -26,4 +26,11 @@
 	};
 };
=20
+&ahci { status =3D "okay"; };
+
+/* Unpopulated SATA plug on solder side */
+&sata0 { status =3D "okay"; };
+
+&sata_phy { status =3D "okay"; };
+
 &uart0 { status =3D "okay"; };
--=20
2.1.1
