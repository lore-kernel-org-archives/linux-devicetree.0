From: Eric Engestrom <eric@engestrom.ch>
Subject: [PATCH 07/41] Documentation: dt: arc: fix spelling mistakes
Date: Mon, 25 Apr 2016 01:24:04 +0100
Message-ID: <1461543878-3639-8-git-send-email-eric@engestrom.ch>
References: <1461543878-3639-1-git-send-email-eric@engestrom.ch>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1461543878-3639-1-git-send-email-eric@engestrom.ch>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Eric Engestrom <eric@engestrom.ch>, Vineet Gupta <vgupta@synopsys.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, linux-snps-arc@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: Eric Engestrom <eric@engestrom.ch>
---
 Documentation/devicetree/bindings/arc/archs-pct.txt | 2 +-
 Documentation/devicetree/bindings/arc/pct.txt       | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/arc/archs-pct.txt b/Documentation/devicetree/bindings/arc/archs-pct.txt
index 1ae98b87..e4b9dce 100644
--- a/Documentation/devicetree/bindings/arc/archs-pct.txt
+++ b/Documentation/devicetree/bindings/arc/archs-pct.txt
@@ -2,7 +2,7 @@
 
 The ARC HS can be configured with a pipeline performance monitor for counting
 CPU and cache events like cache misses and hits. Like conventional PCT there
-are 100+ hardware conditions dynamically mapped to upto 32 counters.
+are 100+ hardware conditions dynamically mapped to up to 32 counters.
 It also supports overflow interrupts.
 
 Required properties:
diff --git a/Documentation/devicetree/bindings/arc/pct.txt b/Documentation/devicetree/bindings/arc/pct.txt
index 7b95884..4e874d9 100644
--- a/Documentation/devicetree/bindings/arc/pct.txt
+++ b/Documentation/devicetree/bindings/arc/pct.txt
@@ -2,7 +2,7 @@
 
 The ARC700 can be configured with a pipeline performance monitor for counting
 CPU and cache events like cache misses and hits. Like conventional PCT there
-are 100+ hardware conditions dynamically mapped to upto 32 counters
+are 100+ hardware conditions dynamically mapped to up to 32 counters
 
 Note that:
  * The ARC 700 PCT does not support interrupts; although HW events may be
-- 
2.8.0
