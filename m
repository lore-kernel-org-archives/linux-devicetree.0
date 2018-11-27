From: Jan Tuerk <jan.tuerk@emtrion.com>
Subject: [PATCH v2] dt-bindings: drm/panel: simple: Fix typo in EDT etm-series compatible
Date: Tue, 27 Nov 2018 16:28:03 +0100
Message-ID: <20181127152804.16652-1-jan.tuerk@emtrion.com>
References: <20180831121842.GA23617@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180831121842.GA23617@bogus>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This fixes the error in the compatible documentation for the EDT
etm0700[g].. panels which have accidentally documented as etm0700[8]0..

Signed-off-by: Jan Tuerk <jan.tuerk@emtrion.com>
---
 .../devicetree/bindings/display/panel/edt,et-series.txt     | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

Changes v2:
 - Updated subject line

diff --git a/Documentation/devicetree/bindings/display/panel/edt,et-series.txt b/Documentation/devicetree/bindings/display/panel/edt,et-series.txt
index f56b99ebd9be..5759d64d0c15 100644
--- a/Documentation/devicetree/bindings/display/panel/edt,et-series.txt
+++ b/Documentation/devicetree/bindings/display/panel/edt,et-series.txt
@@ -23,13 +23,13 @@ simple-panel.txt
 +-----------------+---------------------+-------------------------------------+
 | Identifier      | compatbile          | description                         |
 +=================+=====================+=====================================+
-| ETM0700G0DH6    | edt,etm070080dh6    | WVGA TFT Display with capacitive    |
+| ETM0700G0DH6    | edt,etm0700g0dh6    | WVGA TFT Display with capacitive    |
 |                 |                     | Touchscreen                         |
 +-----------------+---------------------+-------------------------------------+
-| ETM0700G0BDH6   | edt,etm070080bdh6   | Same as ETM0700G0DH6 but with       |
+| ETM0700G0BDH6   | edt,etm0700g0bdh6   | Same as ETM0700G0DH6 but with       |
 |                 |                     | inverted pixel clock.               |
 +-----------------+---------------------+-------------------------------------+
-| ETM0700G0EDH6   | edt,etm070080edh6   | Same display as the ETM0700G0BDH6,  |
+| ETM0700G0EDH6   | edt,etm0700g0edh6   | Same display as the ETM0700G0BDH6,  |
 |                 |                     | but with changed Hardware for the   |
 |                 |                     | backlight and the touch interface   |
 +-----------------+---------------------+-------------------------------------+
-- 
emtrion GmbH
Alter Schlachthof 45
76131 Karlsruhe
GERMANY
https://www.emtrion.de

Amtsgericht Mannheim
HRB 110 300
Geschäftsführer: Dieter Baur, Ramona Maurer
