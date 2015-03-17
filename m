From: Alan Tull <atull@opensource.altera.com>
Subject: =?UTF-8?q?=5BPATCH=201/2=5D=20newhaven=20lcd=3A=20device=20tree=20bindings=20documentation?=
Date: Tue, 17 Mar 2015 15:36:46 -0500
Message-ID: <1426624607-2832-2-git-send-email-atull@opensource.altera.com>
References: <1426624607-2832-1-git-send-email-atull@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1426624607-2832-1-git-send-email-atull@opensource.altera.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jiri Slaby <jslaby@suse.cz>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Alan Tull <atull@opensource.altera.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, delicious.quinoa@gmail.com, dinguyen@opensource.altera.com, yvanderv@opensource.altera.com
List-Id: devicetree@vger.kernel.org

Add documention for the newhaven lcd device tree bindings.

Signed-off-by: Alan Tull <atull@opensource.altera.com>
---
 .../devicetree/bindings/tty/newhaven_lcd.txt       |   21 ++++++++++++=
++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/tty/newhaven_lcd.=
txt

diff --git a/Documentation/devicetree/bindings/tty/newhaven_lcd.txt b/D=
ocumentation/devicetree/bindings/tty/newhaven_lcd.txt
new file mode 100644
index 0000000..14b48fc
--- /dev/null
+++ b/Documentation/devicetree/bindings/tty/newhaven_lcd.txt
@@ -0,0 +1,21 @@
+* TTY on a Newhaven NHD=E2=80=900216K3Z=E2=80=90NSW=E2=80=90BBW LCD co=
nnected to I2C
+
+Required properties:
+- compatible: Should be "newhaven,nhd-0216k3z-nsw-bbw"
+- reg: i2c address
+- height: should be 2 lines
+- width: should be 16 characters
+- brightness: backlight brightness. Range is 1 to 8, where
+              1=3DOFF and 8=3Dmaximum brightness.
+
+Example:
+
+&i2c0 {
+	lcd: lcd@28 {
+		compatible =3D "newhaven,nhd-0216k3z-nsw-bbw";
+		reg =3D <0x28>;
+		height =3D <2>;
+		width =3D <16>;
+		brightness =3D <8>;
+	};
+
--=20
1.7.9.5
