From: Douglas Anderson <dianders@chromium.org>
Subject: [PATCH] regulator: Document "regulator-boot-on" binding more thoroughly
Date: Thu, 26 Sep 2019 12:41:18 -0700
Message-ID: <20190926124115.1.Ice34ad5970a375c3c03cb15c3859b3ee501561bf@changeid>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>
Cc: Marco Felsch <m.felsch@pengutronix.de>, ckeepax@opensource.cirrus.com, zhang.chunyan@linaro.org, Douglas Anderson <dianders@chromium.org>, devicetree@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

The description of "regulator-boot-on" was a little unclear, at least
to me.  Did this property mean that we should turn the regulator on at
boot?  Or perhaps it was intended only to be used for regulators where
we couldn't read the state at bootup to indicate what state we should
assume?  The answer, it turns out, is both [1].

Let's document this.

[1] https://lore.kernel.org/r/20190923181431.GU2036@sirena.org.uk

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 Documentation/devicetree/bindings/regulator/regulator.yaml | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/regulator/regulator.yaml b/Documentation/devicetree/bindings/regulator/regulator.yaml
index 02c3043ce419..4e67fb41db6b 100644
--- a/Documentation/devicetree/bindings/regulator/regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/regulator.yaml
@@ -38,7 +38,12 @@ properties:
     type: boolean
 
   regulator-boot-on:
-    description: bootloader/firmware enabled regulator
+    description: bootloader/firmware enabled regulator.
+      It's expected that this regulator was left on by the bootloader.
+      If the bootloader didn't leave it on then OS should turn it on
+      at boot but shouldn't prevent it from being turned off later.
+      This property is intended to only be used for regulators where
+      Linux cannot read the state of the regulator at bootup.
     type: boolean
 
   regulator-allow-bypass:
-- 
2.23.0.444.g18eeb5a265-goog
