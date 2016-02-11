From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH] ARM: dts: porter: fix JP3 jumper description
Date: Fri, 12 Feb 2016 00:49:52 +0300
Message-ID: <1655804.y4T36KvG5v@wasted.cogentembedded.com>
References: <1674850.BZpGW9kEud@wasted.cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1674850.BZpGW9kEud@wasted.cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: horms@verge.net.au, linux-renesas-soc@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devicetree@vger.kernel.org
Cc: magnus.damm@gmail.com, linux@arm.linux.org.uk, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

When finishing the Porter sound support patch, I managed to call the JP3
jumper SW3 in the comment.  Fix this  along with (also miscalled) jumper
positions...

Fixes: 493b4da7c10c ("ARM: dts: porter: add sound support")
Reported-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
This patch is against the 'renesas-devel-20160209-v4.5-rc3' tag of Simon
Horman's 'renesas.git' repo.

arch/arm/boot/dts/r8a7791-porter.dts |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

Index: renesas/arch/arm/boot/dts/r8a7791-porter.dts
===================================================================
--- renesas.orig/arch/arm/boot/dts/r8a7791-porter.dts
+++ renesas/arch/arm/boot/dts/r8a7791-porter.dts
@@ -11,8 +11,8 @@
 /*
  * SSI-AK4642
  *
- * SW3: 1: AK4642
- *      3: ADV7511
+ * JP3: 2-1: AK4642
+ *      2-3: ADV7511
  *
  * This command is required before playback/capture:
  *
