From: Frans Klaver <frans.klaver@xsens.com>
Subject: [PATCH 2/2] sbs-battery: dts: document always-present property
Date: Wed, 24 Sep 2014 15:11:18 +0200
Message-ID: <1411564278-17207-3-git-send-email-frans.klaver@xsens.com>
References: <1411564278-17207-1-git-send-email-frans.klaver@xsens.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1411564278-17207-1-git-send-email-frans.klaver@xsens.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Frans Klaver <frans.klaver@xsens.com>, Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>, David Woodhouse <dwmw2@infradead.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Randy Dunlap <rdunlap@infradead.org>, devicetree@vger.kernel.org, linux-doc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Document the sbs,always-present property of sbs batteries.

Signed-off-by: Frans Klaver <frans.klaver@xsens.com>
---
 Documentation/devicetree/bindings/power_supply/sbs_sbs-battery.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/power_supply/sbs_sbs-battery.txt b/Documentation/devicetree/bindings/power_supply/sbs_sbs-battery.txt
index c40e892..05bf09c 100644
--- a/Documentation/devicetree/bindings/power_supply/sbs_sbs-battery.txt
+++ b/Documentation/devicetree/bindings/power_supply/sbs_sbs-battery.txt
@@ -11,6 +11,8 @@ Optional properties :
    after an external change notification.
  - sbs,battery-detect-gpios : The gpio which signals battery detection and
    a flag specifying its polarity.
+ - sbs,always-present : If set, the battery is always registered even if
+   status cannot be read during probe
 
 Example:
 
-- 
2.1.0
