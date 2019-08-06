From: Frank Wunderlich <frank-w@public-files.de>
Subject: [PATCH v4 01/10] dt-bindings: add powercontroller
Date: Tue,  6 Aug 2019 18:27:36 +0200
Message-ID: <20190806162745.8414-2-frank-w@public-files.de>
References: <20190806162745.8414-1-frank-w@public-files.de>
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190806162745.8414-1-frank-w@public-files.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Allison Randal <allison@lohutok.net>, "David S. Miller" <davem@davemloft.net>, devicetree@vger.kernel.org, Eddie Huang <eddie.huang@mediatek.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, Kate Stewart <kstewart@linuxfoundation.org>, Lee Jones <lee.jones@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org, linux-rtc@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, Richard Fontana <rfontana@r>
Cc: Josef Friedl <josef.friedl@speed.at>, Frank Wunderlich <frank-w@public-files.de>
List-Id: devicetree@vger.kernel.org

From: Josef Friedl <josef.friedl@speed.at>

add mt6323-rtc and mt6323-pwrc to mt6397 mfd DT bindings
an example is shown in mt6323-poweroff.txt

Suggested-by: Frank Wunderlich <frank-w@public-files.de>
Signed-off-by: Josef Friedl <josef.friedl@speed.at>
Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
=2D--
changes since v3: none
changes since v2: separated rtc-mt6397.txt to part 2

 .../devicetree/bindings/mfd/mt6397.txt        | 10 +++++++++-
 .../bindings/power/reset/mt6323-poweroff.txt  | 20 +++++++++++++++++++
 2 files changed, 29 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/power/reset/mt6323-p=
oweroff.txt

diff --git a/Documentation/devicetree/bindings/mfd/mt6397.txt b/Documentat=
ion/devicetree/bindings/mfd/mt6397.txt
index 0ebd08af777d..44acb9827716 100644
=2D-- a/Documentation/devicetree/bindings/mfd/mt6397.txt
+++ b/Documentation/devicetree/bindings/mfd/mt6397.txt
@@ -8,6 +8,7 @@ MT6397/MT6323 is a multifunction device with the following=
 sub modules:
 - Clock
 - LED
 - Keys
+- Power controller

 It is interfaced to host controller using SPI interface by a proprietary =
hardware
 called PMIC wrapper or pwrap. MT6397/MT6323 MFD is a child device of pwra=
p.
@@ -22,8 +23,10 @@ compatible: "mediatek,mt6397" or "mediatek,mt6323"
 Optional subnodes:

 - rtc
-	Required properties:
+	Required properties: Should be one of follows
+		- compatible: "mediatek,mt6323-rtc"
 		- compatible: "mediatek,mt6397-rtc"
+	For details, see Documentation/devicetree/bindings/rtc/rtc-mt6397.txt
 - regulators
 	Required properties:
 		- compatible: "mediatek,mt6397-regulator"
@@ -46,6 +49,11 @@ Optional subnodes:
 		- compatible: "mediatek,mt6397-keys" or "mediatek,mt6323-keys"
 	see Documentation/devicetree/bindings/input/mtk-pmic-keys.txt

+- power-controller
+	Required properties:
+		- compatible: "mediatek,mt6323-pwrc"
+	For details, see Documentation/devicetree/bindings/power/reset/mt6323-po=
weroff.txt
+
 Example:
 	pwrap: pwrap@1000f000 {
 		compatible =3D "mediatek,mt8135-pwrap";
diff --git a/Documentation/devicetree/bindings/power/reset/mt6323-poweroff=
.txt b/Documentation/devicetree/bindings/power/reset/mt6323-poweroff.txt
new file mode 100644
index 000000000000..933f0c48e887
=2D-- /dev/null
+++ b/Documentation/devicetree/bindings/power/reset/mt6323-poweroff.txt
@@ -0,0 +1,20 @@
+Device Tree Bindings for Power Controller on MediaTek PMIC
+
+The power controller which could be found on PMIC is responsible for exte=
rnally
+powering off or on the remote MediaTek SoC through the circuit BBPU.
+
+Required properties:
+- compatible: Should be one of follows
+       "mediatek,mt6323-pwrc": for MT6323 PMIC
+
+Example:
+
+       pmic {
+               compatible =3D "mediatek,mt6323";
+
+               ...
+
+               power-controller {
+                       compatible =3D "mediatek,mt6323-pwrc";
+               };
+       }
=2D-
2.17.1
