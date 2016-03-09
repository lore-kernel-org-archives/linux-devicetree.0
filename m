From: Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v2 02/18] dt-bindings: timer: sp804: add timer-width property
Date: Wed,  9 Mar 2016 11:24:04 +0100
Message-ID: <1457519060-6038-3-git-send-email-narmstrong@baylibre.com>
References: <1457005210-18485-1-git-send-email-narmstrong@baylibre.com>
 <1457519060-6038-1-git-send-email-narmstrong@baylibre.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1457519060-6038-1-git-send-email-narmstrong@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, daniel.lezcano@linaro.org, tglx@linutronix.de, rmk+kernel@arm.linux.org.uk, sudeep.holla@arm.com, devicetree@vger.kernel.org
Cc: Neil Armstrong <narmstrong@baylibre.com>
List-Id: devicetree@vger.kernel.org

Add timer-width optional property to specify a different vendor
specific timer counter bit-width.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 Documentation/devicetree/bindings/timer/arm,sp804.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/timer/arm,sp804.txt b/Documentation/devicetree/bindings/timer/arm,sp804.txt
index 5cd8eee7..141e143 100644
--- a/Documentation/devicetree/bindings/timer/arm,sp804.txt
+++ b/Documentation/devicetree/bindings/timer/arm,sp804.txt
@@ -17,6 +17,8 @@ Optional properties:
 - arm,sp804-has-irq = <#>: In the case of only 1 timer irq line connected, this
 	specifies if the irq connection is for timer 1 or timer 2. A value of 1
 	or 2 should be used.
+- arm,timer-width: Should contain the width in number of bits of the counter,
+	is considered by default 32 but can be changed for vendor variants.
 
 Example:
 
-- 
1.9.1
