From: Chen-Yu Tsai <wens@csie.org>
Subject: [PATCH v3 5/5] Documentation: sunxi: Add A80 datasheet link
Date: Wed,  8 Oct 2014 21:02:56 +0800
Message-ID: <1412773376-25212-6-git-send-email-wens@csie.org>
References: <1412773376-25212-1-git-send-email-wens@csie.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1412773376-25212-1-git-send-email-wens@csie.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@free-electrons.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>
Cc: Chen-Yu Tsai <wens@csie.org>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Shuge <shuge@allwinnertech.com>, Meng Zhang <kevin@allwinnertech.com>, Gregory CLEMENT <gregory.clement@free-electrons.com>
List-Id: devicetree@vger.kernel.org

We now have initial support for the A80, as well a the datasheet.
Update the documents to reflect this.

Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
 Documentation/arm/sunxi/README | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/arm/sunxi/README b/Documentation/arm/sunxi/README
index 57c4da6..e68d163 100644
--- a/Documentation/arm/sunxi/README
+++ b/Documentation/arm/sunxi/README
@@ -58,4 +58,5 @@ SunXi family
 
     * Quad ARM Cortex-A15, Quad ARM Cortex-A7 based SoCs
       - Allwinner A80
-        + Not Supported
\ No newline at end of file
+        + Datasheet
+	  http://dl.linux-sunxi.org/A80/A80_Datasheet_Revision_1.0_0404.pdf
-- 
2.1.1
