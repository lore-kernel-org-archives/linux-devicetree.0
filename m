From: Lubomir Rintel <lkundrak@v3.sk>
Subject: [PATCH 1/2] dt-bindings: marvell,mmp2: Add clock id for the LCDC clock
Date: Mon, 21 Jan 2019 07:31:28 +0100
Message-ID: <20190121063129.552580-2-lkundrak@v3.sk>
References: <20190121063129.552580-1-lkundrak@v3.sk>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190121063129.552580-1-lkundrak@v3.sk>
Sender: linux-kernel-owner@vger.kernel.org
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Lubomir Rintel <lkundrak@v3.sk>
List-Id: devicetree@vger.kernel.org

The peripheral clock is required for access the the LCDC registers. It
is in fact separate from the "AXI clock" that is optionally used to
generate the pixel clock and as such requires a separate clock id.

Link: https://lists.freedesktop.org/archives/dri-devel/2019-January/20397=
5.html
Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
---
 include/dt-bindings/clock/marvell,mmp2.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/clock/marvell,mmp2.h b/include/dt-bindin=
gs/clock/marvell,mmp2.h
index 228a5e234af0..e785c6eb3561 100644
--- a/include/dt-bindings/clock/marvell,mmp2.h
+++ b/include/dt-bindings/clock/marvell,mmp2.h
@@ -71,6 +71,7 @@
 #define MMP2_CLK_CCIC1_MIX		117
 #define MMP2_CLK_CCIC1_PHY		118
 #define MMP2_CLK_CCIC1_SPHY		119
+#define MMP2_CLK_DISP0_LCDC		120
=20
 #define MMP2_NR_CLKS			200
 #endif
--=20
2.20.1
