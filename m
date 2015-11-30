From: Damien Riegel <damien.riegel@savoirfairelinux.com>
Subject: [PATCH v7 1/6] of: add vendor prefix for Technologic Systems
Date: Mon, 30 Nov 2015 10:59:46 -0500
Message-ID: <1448899191-13891-2-git-send-email-damien.riegel@savoirfairelinux.com>
References: <1448899191-13891-1-git-send-email-damien.riegel@savoirfairelinux.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1448899191-13891-1-git-send-email-damien.riegel@savoirfairelinux.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, Russell King <linux@arm.linux.org.uk>, Arnd Bergmann <arnd@arndb.de>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Damien Riegel <damien.riegel@savoirfairelinux.com>, Shawn Guo <shawnguo@kernel.org>, Wim Van Sebroeck <wim@iguana.be>, Rob Herring <robh+dt@kernel.org>, kernel@savoirfairelinux.com, Sascha Hauer <kernel@pengutronix.de>, Kumar Gala <galak@codeaurora.org>, Lee Jones <lee.jones@linaro.org>, Guenter Roeck <linux@roeck-us.net>, Samuel Ortiz <sameo@linux.intel.com>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Damien Riegel <damien.riegel@savoirfairelinux.com>
Acked-by: Lee Jones <lee.jones@linaro.org>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index 82d2ac9..d3a206d 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -215,6 +215,7 @@ stericsson	ST-Ericsson
 synology	Synology, Inc.
 tbs	TBS Technologies
 tcl	Toby Churchill Ltd.
+technologic	Technologic Systems
 thine	THine Electronics, Inc.
 ti	Texas Instruments
 tlm	Trusted Logic Mobility
-- 
2.5.0
