From: Jisheng Zhang <Jisheng.Zhang@synaptics.com>
Subject: [PATCH 7/8] dt-bindings: sy8824x: Document SY20278 support
Date: Tue, 27 Aug 2019 08:49:09 +0000
Message-ID: <20190827163754.170cf130@xhacker.debian>
References: <20190827163252.4982af95@xhacker.debian>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190827163252.4982af95@xhacker.debian>
Content-Language: en-US
Content-ID: <60695DC90411274BBB98A90097C8145A@namprd03.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

SY20276 is an I2C-controlled adjustable voltage regulator made by
Silergy Corp. The differences between SY8824C and SY20278 are
different regs for mode/enable.

Signed-off-by: Jisheng Zhang <Jisheng.Zhang@synaptics.com>
---
 Documentation/devicetree/bindings/regulator/sy8824x.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/regulator/sy8824x.txt b/Docu=
mentation/devicetree/bindings/regulator/sy8824x.txt
index 28600541b5de..c5e95850c427 100644
--- a/Documentation/devicetree/bindings/regulator/sy8824x.txt
+++ b/Documentation/devicetree/bindings/regulator/sy8824x.txt
@@ -5,6 +5,7 @@ Required properties:
 	"silergy,sy8824c"
 	"silergy,sy8824e"
 	"silergy,sy20276"
+	"silergy,sy20278"
 - reg: I2C slave address
=20
 Any property defined as part of the core regulator binding, defined in
--=20
2.23.0.rc1
