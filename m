From: Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v3 02/18] dt-bindings: timer: sp804: add new compatible for
 OX810SE SoC
Date: Thu, 24 Mar 2016 17:49:59 +0100
Message-ID: <1458838215-23314-3-git-send-email-narmstrong@baylibre.com>
References: <1458838215-23314-1-git-send-email-narmstrong@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1458838215-23314-1-git-send-email-narmstrong@baylibre.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-kernel@vger.kernel.org, linux@arm.linux.org.uk, linux-arm-kernel@lists.infradead.org, daniel.lezcano@linaro.org, tglx@linutronix.de, rmk+kernel@arm.linux.org.uk, sudeep.holla@arm.com, devicetree@vger.kernel.org
Cc: Neil Armstrong <narmstrong@baylibre.com>
List-Id: devicetree@vger.kernel.org

Add new oxsemi,ox810se-rps-timer compatible string to support the
PLX Technology OX810SE SoC Dual Timers variant.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 Documentation/devicetree/bindings/timer/arm,sp804.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/timer/arm,sp804.txt b/Documentation/devicetree/bindings/timer/arm,sp804.txt
index 5cd8eee7..ebe8753 100644
--- a/Documentation/devicetree/bindings/timer/arm,sp804.txt
+++ b/Documentation/devicetree/bindings/timer/arm,sp804.txt
@@ -2,7 +2,7 @@ ARM sp804 Dual Timers
 ---------------------------------------
 
 Required properties:
-- compatible: Should be "arm,sp804" & "arm,primecell"
+- compatible: Should be "arm,sp804" & "arm,primecell", or "oxsemi,ox810se-rps-timer"
 - interrupts: Should contain the list of Dual Timer interrupts. This is the
 	interrupt for timer 1 and timer 2. In the case of a single entry, it is
 	the combined interrupt or if "arm,sp804-has-irq" is present that
-- 
1.9.1
