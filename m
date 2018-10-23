From: "A.s. Dong" <aisheng.dong@nxp.com>
Subject: [PATCH V2 3/8] dt-bindings: gpio: vf610: add optional clocks property
Date: Tue, 23 Oct 2018 11:49:13 +0000
Message-ID: <1540295058-26090-4-git-send-email-aisheng.dong@nxp.com>
References: <1540295058-26090-1-git-send-email-aisheng.dong@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1540295058-26090-1-git-send-email-aisheng.dong@nxp.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Cc: "A.s. Dong" <aisheng.dong@nxp.com>, Mark Rutland <mark.rutland@arm.com>, "dongas86@gmail.com" <dongas86@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, "linux@armlinux.org.uk" <linux@armlinux.org.uk>, Stefan Agner <stefan@agner.ch>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, dl-linux-imx <linux-imx@nxp.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>
List-Id: devicetree@vger.kernel.org

On some SoCs(e.g. MX7ULP), GPIO clock is gatable and maybe
disabled by default. Users have to make sure it's enabled before
being able to access controller registers, otherwise an external
abort error may occur. Let's add the optional clocks property to
handle this case.

For ULP GPIO clock, it includes two separate clocks: one is for
GPIO controller Input/Output function clock while another is
GPIO port control clock for interrupt function.

Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Stefan Agner <stefan@agner.ch>
Cc: linux-gpio@vger.kernel.org
Cc: devicetree@vger.kernel.org
Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
---
v1->v2:
 * new patch
---
 Documentation/devicetree/bindings/gpio/gpio-vf610.txt | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpio/gpio-vf610.txt b/Documentation/devicetree/bindings/gpio/gpio-vf610.txt
index 0ccbae4..ae254aa 100644
--- a/Documentation/devicetree/bindings/gpio/gpio-vf610.txt
+++ b/Documentation/devicetree/bindings/gpio/gpio-vf610.txt
@@ -24,6 +24,12 @@ Required properties for GPIO node:
       4 = active high level-sensitive.
       8 = active low level-sensitive.
 
+Optional properties:
+-clocks:	Must contain an entry for each entry in clock-names.
+		See common clock-bindings.txt for details.
+-clock-names:	A list of clock names. For imx7ulp, it must contain
+		"gpio", "port".
+
 Note: Each GPIO port should have an alias correctly numbered in "aliases"
 node.
 
-- 
2.7.4
