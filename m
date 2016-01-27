From: John Stultz <john.stultz@linaro.org>
Subject: [RFC][PATCH 1/3] dt-bindings: power: reset: Add document for sram-reboot-mode driver
Date: Tue, 26 Jan 2016 16:37:58 -0800
Message-ID: <1453855080-17760-2-git-send-email-john.stultz@linaro.org>
References: <1453855080-17760-1-git-send-email-john.stultz@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1453855080-17760-1-git-send-email-john.stultz@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: lkml <linux-kernel@vger.kernel.org>
Cc: John Stultz <john.stultz@linaro.org>, Andy Yan <andy.yan@rock-chips.com>, Rob Herring <robh@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Thierry Reding <treding@nvidia.com>, =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>, Caesar Wang <wxt@rock-chips.com>, Kees Cook <keescook@chromium.org>, Guodong Xu <guodong.xu@linaro.org>, Haojian Zhuang <haojian.zhuang@linaro.org>, Vishal Bhoj <vishal.bhoj@linaro.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, devicetree@vger.kernel.org, Android Kernel Team <kernel-team@android.com>
List-Id: devicetree@vger.kernel.org

Add device tree binding document for reboot-mode driver

Cc: Andy Yan <andy.yan@rock-chips.com>
Cc: Rob Herring <robh@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Thierry Reding <treding@nvidia.com>
Cc: Heiko St=C3=BCbner <heiko@sntech.de>
Cc: Caesar Wang <wxt@rock-chips.com>
Cc: Kees Cook <keescook@chromium.org>
Cc: Guodong Xu <guodong.xu@linaro.org>
Cc: Haojian Zhuang <haojian.zhuang@linaro.org>
Cc: Vishal Bhoj <vishal.bhoj@linaro.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: devicetree@vger.kernel.org
Cc: Android Kernel Team <kernel-team@android.com>
Signed-off-by: John Stultz <john.stultz@linaro.org>
---
 .../bindings/power/reset/sram-reboot-mode.txt      | 47 ++++++++++++++=
++++++++
 1 file changed, 47 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/power/reset/sram-=
reboot-mode.txt

diff --git a/Documentation/devicetree/bindings/power/reset/sram-reboot-=
mode.txt b/Documentation/devicetree/bindings/power/reset/sram-reboot-mo=
de.txt
new file mode 100644
index 0000000..33bb132
--- /dev/null
+++ b/Documentation/devicetree/bindings/power/reset/sram-reboot-mode.tx=
t
@@ -0,0 +1,47 @@
+SRAM reboot mode driver
+
+This driver get reboot mode magic value form reboot-mode driver
+and stores it in a SRAM address. Then the bootloader
+can read it and take different action according to the magic
+value stored.
+
+This DT node should be represented as a sub-node of a "mmio-sram", "si=
mple-bus"
+node.
+
+Required properties:
+- compatible: should be "sram-reboot-mode"
+- reg: offset from the sram range where to store the magic value(in by=
tes)
+
+The rest of the properties should follow the generic reboot-mode discr=
iption
+found in reboot-mode.txt
+
+Example:
+
+	sram@5f01000 {
+		compatible =3D "mmio-sram", "simple-bus";
+		reg =3D <0x0 0x05f01000 0x0 0x00001000>;
+		ranges =3D <0x0 0x0 0x05f01000 0x00001000>;
+
+		#address-cells =3D <1>;
+		#size-cells =3D <1>;
+
+		reboot-mode@0 {
+			compatible =3D "sram-reboot-mode";
+			reg =3D <0x0 0x4>;
+
+			none {
+				linux,mode =3D "none";
+				loader,magic =3D <0x77665501>;
+			};
+
+			bootloader {
+				linux,mode =3D "bootloader";
+				loader,magic =3D <0x77665500>;
+			};
+
+			recovery {
+				linux,mode =3D "recovery";
+				loader,magic =3D <0x77665502>;
+			};
+		};
+	};
--=20
1.9.1
