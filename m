From: "Sherman Yin" <syin@broadcom.com>
Subject: [PATCH v2 1/4] pinctrl: Add void * to pinctrl_pin_desc
Date: Mon, 7 Oct 2013 12:28:25 -0700
Message-ID: <1381174108-25168-2-git-send-email-syin@broadcom.com>
References: <1380846199-12829-1-git-send-email-syin@broadcom.com>
 <1381174108-25168-1-git-send-email-syin@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1381174108-25168-1-git-send-email-syin@broadcom.com>
Sender: linux-doc-owner@vger.kernel.org
To: Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Landley <rob@landley.net>, Christian Daudt <bcm@fixthebug.org>, Russell King <linux@arm.linux.org.uk>, Linus Walleij <linus.walleij@linaro.org>, Grant Likely <grant.likely@linaro.org>, Matt Porter <matt.porter@linaro.org>
Cc: devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, linux-arm-kernel@lists.infradead.org, Sherman Yin <syin@broadcom.com>
List-Id: devicetree@vger.kernel.org

drv_data is added to the pinctrl_pin_desc for drivers to define additional
driver-specific per-pin data.

Signed-off-by: Sherman Yin <syin@broadcom.com>
Reviewed-by: Christian Daudt <bcm@fixthebug.org>
Reviewed-by: Matt Porter <matt.porter@linaro.org>
---
Change-Id: I78b2c44b93d88b04897fd0af80ffce213e338d6b
v2: Use hyphens instead of underscore in DT property names.
---
 include/linux/pinctrl/pinctrl.h |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/linux/pinctrl/pinctrl.h b/include/linux/pinctrl/pinctrl.h
index 5979147..c8e42c4 100644
--- a/include/linux/pinctrl/pinctrl.h
+++ b/include/linux/pinctrl/pinctrl.h
@@ -32,10 +32,12 @@ struct device_node;
  * pins, pads or other muxable units in this struct
  * @number: unique pin number from the global pin number space
  * @name: a name for this pin
+ * @drv_data: driver-defined per-pin data. pinctrl core does not touch this
  */
 struct pinctrl_pin_desc {
 	unsigned number;
 	const char *name;
+	void *drv_data;
 };
 
 /* Convenience macro to define a single named or anonymous pin descriptor */
-- 
1.7.9.5


