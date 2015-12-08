From: Damien Riegel <damien.riegel@savoirfairelinux.com>
Subject: [PATCH v8 2/3] of: documentation: add bindings documentation for TS-4800
Date: Tue,  8 Dec 2015 11:41:37 -0500
Message-ID: <1449592898-24049-3-git-send-email-damien.riegel@savoirfairelinux.com>
References: <1449592898-24049-1-git-send-email-damien.riegel@savoirfairelinux.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1449592898-24049-1-git-send-email-damien.riegel@savoirfairelinux.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, kernel@savoirfairelinux.com, Lee Jones <lee.jones@linaro.org>, Damien Riegel <damien.riegel@savoirfairelinux.com>
List-Id: devicetree@vger.kernel.org

This adds the documentation for the TS-4800 by Technologic Systems.

Signed-off-by: Damien Riegel <damien.riegel@savoirfairelinux.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/arm/technologic.txt | 6 ++++++
 1 file changed, 6 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/technologic.txt

diff --git a/Documentation/devicetree/bindings/arm/technologic.txt b/Documentation/devicetree/bindings/arm/technologic.txt
new file mode 100644
index 0000000..8422988
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/technologic.txt
@@ -0,0 +1,6 @@
+Technologic Systems Platforms Device Tree Bindings
+--------------------------------------------------
+
+TS-4800 board
+Required root node properties:
+	- compatible = "technologic,imx51-ts4800", "fsl,imx51";
-- 
2.5.0
