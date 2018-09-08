From: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Subject: [PATCH 1/6] dt-bindings: ramoops: Add event-size property
Date: Sun,  9 Sep 2018 01:57:02 +0530
Message-ID: <4ec22906649fb3f6ab9570d8d4bf214e61512664.1536430404.git.saiprakash.ranjan@codeaurora.org>
References: <cover.1536430404.git.saiprakash.ranjan@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1536430404.git.saiprakash.ranjan@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Steven Rostedt <rostedt@goodmis.org>, Ingo Molnar <mingo@redhat.com>, Laura Abbott <labbott@redhat.com>, Kees Cook <keescook@chromium.org>, Anton Vorontsov <anton@enomsg.org>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, Colin Cross <ccross@android.com>, Jason Baron <jbaron@akamai.com>, Tony Luck <tony.luck@intel.com>, Arnd Bergmann <arnd@arndb.de>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Joel Fernandes <joel@joelfernandes.org>, Masami Hiramatsu <mhiramat@kernel.org>, Joe Perches <joe@perches.com>, Jim Cromie <jim.cromie@gmail.com>
Cc: Rajendra Nayak <rnayak@codeaurora.org>, Vivek Gautam <vivek.gautam@codeaurora.org>, Sibi Sankar <sibis@codeaurora.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Ingo Molnar <mingo@kernel.org>, Tom Zanussi <tom.zanussi@linux.intel.com>, Prasad Sodagudi <psodagud@codeaurora.org>, tsoni@codeaurora.org, Bryan Huntsman <bryanh@codeaurora.org>, Tingwei Zhang <tingwei@codeaurora.org>, Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Add an optional property called event-size to reserve
log buffer for trace events.

Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
---
 .../devicetree/bindings/reserved-memory/ramoops.txt        | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/reserved-memory/ramoops.txt b/Documentation/devicetree/bindings/reserved-memory/ramoops.txt
index 0eba562fe5c6..4f835ef65635 100644
--- a/Documentation/devicetree/bindings/reserved-memory/ramoops.txt
+++ b/Documentation/devicetree/bindings/reserved-memory/ramoops.txt
@@ -14,8 +14,8 @@ Any remaining space will be used for a circular buffer of oops and panic
 records.  These records have a configurable size, with a size of 0 indicating
 that they should be disabled.
 
-At least one of "record-size", "console-size", "ftrace-size", or "pmsg-size"
-must be set non-zero, but are otherwise optional as listed below.
+At least one of "record-size", "console-size", "event-size", "ftrace-size", or
+"pmsg-size" must be set non-zero, but are otherwise optional as listed below.
 
 
 Required properties:
@@ -36,6 +36,9 @@ Optional properties:
 - console-size: size in bytes of log buffer reserved for kernel messages
   (defaults to 0: disabled)
 
+- event-size: size in bytes of log buffer reserved for trace events
+  (defaults to 0: disabled)
+
 - ftrace-size: size in bytes of log buffer reserved for function tracing and
   profiling (defaults to 0: disabled)
 
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
