From: Eddie James <eajames@linux.ibm.com>
Subject: [PATCH 3/5] media: dt-bindings: aspeed-video: Add missing memory-region property
Date: Tue,  2 Apr 2019 18:25:02 +0000
Message-ID: <1554229504-5661-4-git-send-email-eajames@linux.ibm.com>
References: <1554229504-5661-1-git-send-email-eajames@linux.ibm.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1554229504-5661-1-git-send-email-eajames@linux.ibm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-media@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-aspeed@lists.ozlabs.org, joel@jms.id.au, andrew@aj.id.au, mchehab@kernel.org, linux-clk@vger.kernel.org, sboyd@kernel.org, mturquette@baylibre.com, devicetree@vger.kernel.org, mark.rutland@arm.com, robh+dt@kernel.org
List-Id: devicetree@vger.kernel.org

Missed documenting this property in the initial commit.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 Documentation/devicetree/bindings/media/aspeed-video.txt | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/aspeed-video.txt b/Documentation/devicetree/bindings/media/aspeed-video.txt
index 78b464a..346c2d3 100644
--- a/Documentation/devicetree/bindings/media/aspeed-video.txt
+++ b/Documentation/devicetree/bindings/media/aspeed-video.txt
@@ -14,6 +14,11 @@ Required properties:
 			the VE
  - interrupts:		the interrupt associated with the VE on this platform
 
+Optional properties:
+ - memory-region:
+	phandle to a memory region to allocate from, as defined in
+	Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
+
 Example:
 
 video-engine@1e700000 {
@@ -23,4 +28,5 @@ video-engine@1e700000 {
     clock-names = "vclk", "eclk";
     resets = <&syscon ASPEED_RESET_VIDEO>;
     interrupts = <7>;
+    memory-region = <&video_engine_memory>
 };
-- 
1.8.3.1
