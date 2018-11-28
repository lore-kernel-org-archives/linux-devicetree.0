Return-Path: <SRS0=NeMx=OH=nxp.com=anson.huang@kernel.org>
From: Anson Huang <anson.huang@nxp.com>
Subject: [PATCH V3 1/4] dt-bindings: rtc: add binding doc for i.MX system
 controller RTC driver
Date: Wed, 28 Nov 2018 09:57:22 +0000
Message-ID: <1543398696-3140-2-git-send-email-Anson.Huang@nxp.com>
References: <1543398696-3140-1-git-send-email-Anson.Huang@nxp.com>
In-Reply-To: <1543398696-3140-1-git-send-email-Anson.Huang@nxp.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: "a.zummo@towertech.it" <a.zummo@towertech.it>, "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will.deacon@arm.com" <will.deacon@arm.com>, Aisheng DONG <aisheng.dong@nxp.com>, Andy Gross <andy.gross@linaro.org>, "arnd@arndb.de" <arnd@arndb.de>, "horms+renesas@verge.net.au" <horms+renesas@verge.net.au>, "heiko@sntech.de" <heiko@sntech.de>, "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>, "enric.balletbo@collabora.com" <enric.balletbo@collabora.com>, "amit.kucheria@linaro.org" <amit.kucheria@linaro.org>, "ezequiel@collabora.com" <ezequiel@collabora.com>, "olof@lixom.net" <olof@lixom.net>, "LW@KARO-electronics.de" <LW@KARO-electronics.de>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Cc: dl-linux-imx <linux-imx@nxp.com>
List-ID: <devicetree@vger.kernel.org>

NXP i.MX8QXP is an ARMv8 SoC with a Cortex-M4 core inside as
system controller, the system controller is in charge of system
power, clock and secure RTC etc. management, Linux kernel
has to communicate with system controller via MU (message unit)
IPC to do RTC operation, this patch adds binding doc for i.MX
system controller RTC driver.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
no change since V2.
 Documentation/devicetree/bindings/rtc/rtc-imx-sc.txt | 10 ++++++++++
 1 file changed, 10 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rtc/rtc-imx-sc.txt

diff --git a/Documentation/devicetree/bindings/rtc/rtc-imx-sc.txt b/Documen=
tation/devicetree/bindings/rtc/rtc-imx-sc.txt
new file mode 100644
index 0000000..d6e2353
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/rtc-imx-sc.txt
@@ -0,0 +1,10 @@
+* NXP i.MX System Controller Real Time Clock
+
+Required properties:
+- compatible: should be "nxp,imx8qxp-sc-rtc";
+
+Example:
+
+rtc: rtc {
+	compatible =3D "nxp,imx8qxp-sc-rtc";
+};
--=20
2.7.4
