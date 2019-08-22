From: Lubomir Rintel <lkundrak@v3.sk>
Subject: [PATCH v2 01/20] dt-bindings: arm: cpu: Add Marvell MMP3 SMP enable method
Date: Thu, 22 Aug 2019 11:26:24 +0200
Message-ID: <20190822092643.593488-2-lkundrak@v3.sk>
References: <20190822092643.593488-1-lkundrak@v3.sk>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190822092643.593488-1-lkundrak@v3.sk>
Sender: linux-kernel-owner@vger.kernel.org
To: Olof Johansson <olof@lixom.net>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <maz@kernel.org>, Kishon Vijay Abraham I <kishon@ti.com>, Russell King <linux@armlinux.org.uk>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, Lubomir Rintel <lkundrak@v3.sk>, Rob Herring <robh@kernel.org>
List-Id: devicetree@vger.kernel.org

Add the enable method for the second PJ4B core of the Marvell MMP3 SoC.

Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
Reviewed-by: Rob Herring <robh@kernel.org>

---
Changes since v1:
- Add Rob's Reviewed-by tag

 Documentation/devicetree/bindings/arm/cpus.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/cpus.yaml b/Documentat=
ion/devicetree/bindings/arm/cpus.yaml
index aa40b074b8648..fcba84e32e68a 100644
--- a/Documentation/devicetree/bindings/arm/cpus.yaml
+++ b/Documentation/devicetree/bindings/arm/cpus.yaml
@@ -186,6 +186,7 @@ properties:
               - marvell,armada-390-smp
               - marvell,armada-xp-smp
               - marvell,98dx3236-smp
+              - marvell,mmp3-smp
               - mediatek,mt6589-smp
               - mediatek,mt81xx-tz-smp
               - qcom,gcc-msm8660
--=20
2.21.0
