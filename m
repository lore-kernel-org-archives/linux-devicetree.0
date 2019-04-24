From: Eddie James <eajames@linux.ibm.com>
Subject: [PATCH v2 3/4] media: dt-bindings: aspeed-video: Add missing memory-region property
Date: Wed, 24 Apr 2019 10:16:59 -0500
Message-ID: <1556119020-7609-4-git-send-email-eajames@linux.ibm.com>
References: <1556119020-7609-1-git-send-email-eajames@linux.ibm.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1556119020-7609-1-git-send-email-eajames@linux.ibm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: linux-aspeed@lists.ozlabs.org, devicetree@vger.kernel.org, linux-media@vger.kernel.org, andrew@aj.id.au, joel@jms.id.au, robh+dt@kernel.org, mark.rutland@arm.com, mchehab@kernel.org, hverkuil@xs4all.nl, Eddie James <eajames@linux.ibm.com>
List-Id: devicetree@vger.kernel.org

Missed documenting this property in the initial commit.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
Changes since v1:
 - Add missing semi-colon

 Documentation/devicetree/bindings/media/aspeed-video.txt | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/aspeed-video.txt b/Documentation/devicetree/bindings/media/aspeed-video.txt
index 78b464a..ce28945 100644
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
+    memory-region = <&video_engine_memory>;
 };
-- 
1.8.3.1
