From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] dt-bindings: ARM: add arm,cortex-a72 compatible string
Date: Tue, 24 Nov 2015 20:31:51 +0900
Message-ID: <1448364711-31275-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org, arm@kernel.org, devicetree@vger.kernel.org
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Mark Rutland <mark.rutland@arm.com>, Paul Walmsley <paul@pwsan.com>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, Gregory CLEMENT <gregory.clement@free-electrons.com>, Yingjoe Chen <yingjoe.chen@mediatek.com>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 Documentation/devicetree/bindings/arm/cpus.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/cpus.txt b/Documentation/devicetree/bindings/arm/cpus.txt
index 3a07a87..58e240d 100644
--- a/Documentation/devicetree/bindings/arm/cpus.txt
+++ b/Documentation/devicetree/bindings/arm/cpus.txt
@@ -157,6 +157,7 @@ nodes to be present and contain the properties described below.
 			    "arm,cortex-a17"
 			    "arm,cortex-a53"
 			    "arm,cortex-a57"
+			    "arm,cortex-a72"
 			    "arm,cortex-m0"
 			    "arm,cortex-m0+"
 			    "arm,cortex-m1"
-- 
1.9.1
