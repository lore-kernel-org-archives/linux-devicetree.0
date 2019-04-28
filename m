From: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Subject: [PATCH] dt-bindings: pinctrl: Fix spelling of bias-pull-up
Date: Sun, 28 Apr 2019 17:08:22 +0200
Message-ID: <20190428150822.13935-1-j.neuschaefer@gmx.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-msm@vger.kernel.org
Cc: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The property is spelled 'bias-pull-up', as documented in
pinctrl-bindings.txt.

Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
=2D--
 .../devicetree/bindings/pinctrl/qcom,apq8064-pinctrl.txt        | 2 +-
 .../devicetree/bindings/pinctrl/qcom,ipq4019-pinctrl.txt        | 2 +-
 .../devicetree/bindings/pinctrl/qcom,ipq8064-pinctrl.txt        | 2 +-
 .../devicetree/bindings/pinctrl/qcom,msm8660-pinctrl.txt        | 2 +-
 .../devicetree/bindings/pinctrl/qcom,msm8974-pinctrl.txt        | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,apq8064-pinctr=
l.txt b/Documentation/devicetree/bindings/pinctrl/qcom,apq8064-pinctrl.txt
index c2dbb3e8d840..4e90ddd77784 100644
=2D-- a/Documentation/devicetree/bindings/pinctrl/qcom,apq8064-pinctrl.txt
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,apq8064-pinctrl.txt
@@ -42,7 +42,7 @@ information about e.g. the mux function.
 The following generic properties as defined in pinctrl-bindings.txt are v=
alid
 to specify in a pin configuration subnode:

- pins, function, bias-disable, bias-pull-down, bias-pull,up, drive-streng=
th,
+ pins, function, bias-disable, bias-pull-down, bias-pull-up, drive-streng=
th,
  output-low, output-high.

 Non-empty subnodes must specify the 'pins' property.
diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,ipq4019-pinctr=
l.txt b/Documentation/devicetree/bindings/pinctrl/qcom,ipq4019-pinctrl.txt
index 991be0cd0948..84be0f2c6f3b 100644
=2D-- a/Documentation/devicetree/bindings/pinctrl/qcom,ipq4019-pinctrl.txt
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,ipq4019-pinctrl.txt
@@ -44,7 +44,7 @@ information about e.g. the mux function.

 The following generic properties as defined in pinctrl-bindings.txt are v=
alid
 to specify in a pin configuration subnode:
- pins, function, bias-disable, bias-pull-down, bias-pull,up, drive-streng=
th.
+ pins, function, bias-disable, bias-pull-down, bias-pull-up, drive-streng=
th.

 Non-empty subnodes must specify the 'pins' property.
 Note that not all properties are valid for all pins.
diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,ipq8064-pinctr=
l.txt b/Documentation/devicetree/bindings/pinctrl/qcom,ipq8064-pinctrl.txt
index 7ed56a1b70fc..a7aaaa7db83b 100644
=2D-- a/Documentation/devicetree/bindings/pinctrl/qcom,ipq8064-pinctrl.txt
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,ipq8064-pinctrl.txt
@@ -42,7 +42,7 @@ information about e.g. the mux function.
 The following generic properties as defined in pinctrl-bindings.txt are v=
alid
 to specify in a pin configuration subnode:

- pins, function, bias-disable, bias-pull-down, bias-pull,up, drive-streng=
th,
+ pins, function, bias-disable, bias-pull-down, bias-pull-up, drive-streng=
th,
  output-low, output-high.

 Non-empty subnodes must specify the 'pins' property.
diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,msm8660-pinctr=
l.txt b/Documentation/devicetree/bindings/pinctrl/qcom,msm8660-pinctrl.txt
index cdc4787e59d2..f095209848c8 100644
=2D-- a/Documentation/devicetree/bindings/pinctrl/qcom,msm8660-pinctrl.txt
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,msm8660-pinctrl.txt
@@ -42,7 +42,7 @@ information about e.g. the mux function.
 The following generic properties as defined in pinctrl-bindings.txt are v=
alid
 to specify in a pin configuration subnode:

- pins, function, bias-disable, bias-pull-down, bias-pull,up, drive-streng=
th,
+ pins, function, bias-disable, bias-pull-down, bias-pull-up, drive-streng=
th,
  output-low, output-high.

 Non-empty subnodes must specify the 'pins' property.
diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,msm8974-pinctr=
l.txt b/Documentation/devicetree/bindings/pinctrl/qcom,msm8974-pinctrl.txt
index c22e6c425d0b..004056506679 100644
=2D-- a/Documentation/devicetree/bindings/pinctrl/qcom,msm8974-pinctrl.txt
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,msm8974-pinctrl.txt
@@ -41,7 +41,7 @@ information about e.g. the mux function.

 The following generic properties as defined in pinctrl-bindings.txt are v=
alid
 to specify in a pin configuration subnode:
- pins, function, bias-disable, bias-pull-down, bias-pull,up, drive-streng=
th.
+ pins, function, bias-disable, bias-pull-down, bias-pull-up, drive-streng=
th.

 Non-empty subnodes must specify the 'pins' property.
 Note that not all properties are valid for all pins.
=2D-
2.20.1
