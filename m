From: Stephen Warren <swarren@wwwdotorg.org>
Subject: [PATCH V2 4/5] gpio: implement gpio-ranges binding document fix
Date: Mon, 15 Jul 2013 12:40:28 -0600
Message-ID: <1373913629-32179-4-git-send-email-swarren@wwwdotorg.org>
References: <1373913629-32179-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1373913629-32179-1-git-send-email-swarren@wwwdotorg.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <rob.herring@calxeda.com>
Cc: Stephen Warren <swarren@nvidia.com>, linux-gpio@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, Shiraz Hashim <shiraz.hashim@st.com>, Haojian Zhuang <haojian.zhuang@linaro.org>, Jingchang Lu <b35083@freescale.com>, Shawn Guo <shawn.guo@linaro.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

From: Stephen Warren <swarren@nvidia.com>

Use the new of_parse_phandle_with_fixed_args() to implement the
corrected gpio-ranges DT property definition.

Signed-off-by: Stephen Warren <swarren@nvidia.com>
---
 drivers/gpio/gpiolib-of.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index 665f953..48cda3c 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -194,8 +194,8 @@ static void of_gpiochip_add_pin_range(struct gpio_chip *chip)
 		return;
 
 	for (;; index++) {
-		ret = of_parse_phandle_with_args(np, "gpio-ranges",
-				"#gpio-range-cells", index, &pinspec);
+		ret = of_parse_phandle_with_fixed_args(np, "gpio-ranges", 3,
+				index, &pinspec);
 		if (ret)
 			break;
 
-- 
1.8.1.5
