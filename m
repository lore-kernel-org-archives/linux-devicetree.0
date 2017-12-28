From: Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH v4 14/15] devicetree/bindings: Add GCW vendor prefix
Date: Thu, 28 Dec 2017 14:56:33 +0100
Message-ID: <20171228135634.30000-15-paul@crapouillou.net>
References: <20170702163016.6714-2-paul@crapouillou.net>
 <20171228135634.30000-1-paul@crapouillou.net>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171228135634.30000-1-paul@crapouillou.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Ralf Baechle <ralf@linux-mips.org>, Rob Herring <robh+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Stephen Boyd <sboyd@codeaurora.org>, Maarten ter Huurne <maarten@treewalker.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mips@linux-mips.org, linux-clk@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
List-Id: devicetree@vger.kernel.org

Game Consoles Worldwide, mostly known under the acronym GCW, is the
creator of the GCW Zero open-source video game system.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
 1 file changed, 1 insertion(+)

 v2: It's 'Game Consoles Worldwide', not 'Games Consoles Worldwide'
 v3: No change
 v4: No change

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index 0994bdd82cd3..f40f4da39937 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -123,6 +123,7 @@ focaltech	FocalTech Systems Co.,Ltd
 friendlyarm	Guangzhou FriendlyARM Computer Tech Co., Ltd
 fsl	Freescale Semiconductor
 fujitsu	Fujitsu Ltd.
+gcw Game Consoles Worldwide
 ge	General Electric Company
 geekbuying	GeekBuying
 gef	GE Fanuc Intelligent Platforms Embedded Systems, Inc.
-- 
2.11.0
