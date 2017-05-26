From: Anup Patel <anup.patel@broadcom.com>
Subject: [PATCH v5 01/11] dt-bindings: bcm: Add Broadcom Stingray bindings
 document
Date: Fri, 26 May 2017 14:54:54 +0530
Message-ID: <1495790704-2438-2-git-send-email-anup.patel@broadcom.com>
References: <1495790704-2438-1-git-send-email-anup.patel@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1495790704-2438-1-git-send-email-anup.patel@broadcom.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>
Cc: devicetree@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>, Sandeep Tripathy <sandeep.tripathy@broadcom.com>, Anup Patel <anup.patel@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Jon Mason <jonmason@broadcom.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, Pramod Kumar <pramod.kumar@broadcom.com>, Oza Pawandeep <oza.oza@broadcom.com>, Ray Jui <rjui@broadcom.com>, Srinath Mannam <srinath.mannam@broadcom.com>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

This patch adds DT bindings info for Broadcom Stingray SOC
and related reference boards.

Signed-off-by: Anup Patel <anup.patel@broadcom.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/arm/bcm/brcm,stingray.txt | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/bcm/brcm,stingray.txt

diff --git a/Documentation/devicetree/bindings/arm/bcm/brcm,stingray.txt b/Documentation/devicetree/bindings/arm/bcm/brcm,stingray.txt
new file mode 100644
index 0000000..23a0217
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/bcm/brcm,stingray.txt
@@ -0,0 +1,12 @@
+Broadcom Stingray device tree bindings
+------------------------------------------------
+
+Boards with Stingray shall have the following properties:
+
+Required root node property:
+
+Stingray Combo SVK board
+compatible = "brcm,bcm958742k", "brcm,stingray";
+
+Stingray SST100 board
+compatible = "brcm,bcm958742t", "brcm,stingray";
-- 
2.7.4
