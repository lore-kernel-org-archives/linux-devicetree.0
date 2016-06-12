From: Yakir Yang <ykk@rock-chips.com>
Subject: [PATCH v3 3/6] dt-bindings: add Samsung LSN122DL01-C01 panel binding
Date: Sun, 12 Jun 2016 10:56:06 +0800
Message-ID: <1465700166-13620-1-git-send-email-ykk@rock-chips.com>
References: <1465700010-13483-1-git-send-email-ykk@rock-chips.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1465700010-13483-1-git-send-email-ykk@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: David Airlie <airlied@linux.ie>, Thierry Reding <thierry.reding@gmail.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Kumar Gala <galak@codeaurora.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, dianders@chromium.org, emil.l.velikov@gmail.com
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Yakir Yang <ykk@rock-chips.com>
List-Id: devicetree@vger.kernel.org

The Samsung LSN122DL01-C01 is an 12.2" 2560x1600 (WQXGA) TFT-LCD
panel connected using eDP interfaces.

Signed-off-by: Yakir Yang <ykk@rock-chips.com>
Acked-by: Rob Herring <robh@kernel.org>
---
Changes in v3: None
Changes in v2:
- Add Rob's acked for dt-bindings of Samsung LSN122DL01 panel

 .../devicetree/bindings/display/panel/samsung,lsn122dl01-c01.txt   | 7 +++++++
 1 file changed, 7 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/samsung,lsn122dl01-c01.txt

diff --git a/Documentation/devicetree/bindings/display/panel/samsung,lsn122dl01-c01.txt b/Documentation/devicetree/bindings/display/panel/samsung,lsn122dl01-c01.txt
new file mode 100644
index 0000000..dba298b
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/samsung,lsn122dl01-c01.txt
@@ -0,0 +1,7 @@
+Samsung 12.2" (2560x1600 pixels) TFT LCD panel
+
+Required properties:
+- compatible: should be "samsung,lsn122dl01-c01"
+
+This binding is compatible with the simple-panel binding, which is specified
+in simple-panel.txt in this directory.
-- 
1.9.1
