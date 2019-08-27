From: Jisheng Zhang <Jisheng.Zhang@synaptics.com>
Subject: [PATCH 3/8] dt-bindings: sy8824x: Document SY8824E support
Date: Tue, 27 Aug 2019 08:46:21 +0000
Message-ID: <20190827163505.361890af@xhacker.debian>
References: <20190827163252.4982af95@xhacker.debian>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190827163252.4982af95@xhacker.debian>
Content-Language: en-US
Content-ID: <F58E2B3DC09CCC41A813AE1F2A67652C@namprd03.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

SY8824E is an I2C-controlled adjustable voltage regulator made by
Silergy Corp. The only difference between SY8824C and SY8824E is the
vsel_min.

Signed-off-by: Jisheng Zhang <Jisheng.Zhang@synaptics.com>
---
 Documentation/devicetree/bindings/regulator/sy8824x.txt | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/regulator/sy8824x.txt b/Docu=
mentation/devicetree/bindings/regulator/sy8824x.txt
index ff8d1af04f7b..31fefa3baa71 100644
--- a/Documentation/devicetree/bindings/regulator/sy8824x.txt
+++ b/Documentation/devicetree/bindings/regulator/sy8824x.txt
@@ -1,7 +1,9 @@
-SY8824C Voltage regulator
+SY8824C/SY8824E Voltage regulator
=20
 Required properties:
-- compatible: Must be "silergy,sy8824c"
+- compatible: Must be one of the following.
+	"silergy,sy8824c"
+	"silergy,sy8824e"
 - reg: I2C slave address
=20
 Any property defined as part of the core regulator binding, defined in
--=20
2.23.0.rc1
