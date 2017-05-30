From: Alexandre TORGUE <alexandre.torgue@st.com>
Subject: [PATCH] pinctrl: stm32: Fix bad function call
Date: Tue, 30 May 2017 16:43:04 +0200
Message-ID: <1496155384-30711-1-git-send-email-alexandre.torgue@st.com>
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
To: Linus Walleij <linus.walleij@linaro.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Patrice Chotard <patrice.chotard@st.com>, Paul Gortmaker <paul.gortmaker@windriver.com>, Rob Herring <robh+dt@kernel.org>
Cc: linux-gpio@vger.kernel.org, dan.carpenter@oracle.com, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

In stm32_pconf_parse_conf function, stm32_pmx_gpio_set_direction is
called with wrong parameter value. Indeed, using NULL value for range
will raise an oops.

Fixes: aceb16dc2da5 ("pinctrl: Add STM32 MCUs support")
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Alexandre TORGUE <alexandre.torgue@st.com>

diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.c b/drivers/pinctrl/stm32/pinctrl-stm32.c
index d3c5f5d..222b668 100644
--- a/drivers/pinctrl/stm32/pinctrl-stm32.c
+++ b/drivers/pinctrl/stm32/pinctrl-stm32.c
@@ -798,7 +798,7 @@ static int stm32_pconf_parse_conf(struct pinctrl_dev *pctldev,
 		break;
 	case PIN_CONFIG_OUTPUT:
 		__stm32_gpio_set(bank, offset, arg);
-		ret = stm32_pmx_gpio_set_direction(pctldev, NULL, pin, false);
+		ret = stm32_pmx_gpio_set_direction(pctldev, range, pin, false);
 		break;
 	default:
 		ret = -EINVAL;
-- 
1.9.1
