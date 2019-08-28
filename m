From: Jisheng Zhang <Jisheng.Zhang@synaptics.com>
Subject: [PATCH v2 3/8] dt-bindings: sy8824x: Document SY8824E support
Date: Wed, 28 Aug 2019 06:10:01 +0000
Message-ID: <20190828135844.19846b1c@xhacker.debian>
References: <20190828135646.52457ac3@xhacker.debian>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190828135646.52457ac3@xhacker.debian>
Content-Language: en-US
Content-ID: <3F70D55AB672B2468F2D6D8E1EEB113E@namprd03.prod.outlook.com>
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
