From: Peter Griffin <peter.griffin@linaro.org>
Subject: [PATCH v2 5/6] dt-bindings: reset: hisilicon: Add ao reset controller
Date: Fri, 19 Apr 2019 09:33:00 +0100
Message-ID: <1555662781-22570-6-git-send-email-peter.griffin@linaro.org>
References: <1555662781-22570-1-git-send-email-peter.griffin@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1555662781-22570-1-git-send-email-peter.griffin@linaro.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, john.stultz@linaro.org, airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org, mark.rutland@arm.com, p.zabel@pengutronix.de, xuwei5@hisilicon.com, mturquette@baylibre.com, sboyd@kernel.org, yuq825@gmail.com
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org, lima@lists.freedesktop.org
List-Id: devicetree@vger.kernel.org

This is required to bring Mali450 gpu out of reset.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 include/dt-bindings/reset/hisi,hi6220-resets.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/include/dt-bindings/reset/hisi,hi6220-resets.h b/include/dt-bindings/reset/hisi,hi6220-resets.h
index e7c362a8..63aff7d 100644
--- a/include/dt-bindings/reset/hisi,hi6220-resets.h
+++ b/include/dt-bindings/reset/hisi,hi6220-resets.h
@@ -73,4 +73,11 @@
 #define MEDIA_MMU                       6
 #define MEDIA_XG2RAM1                   7
 
+#define AO_G3D                          1
+#define AO_CODECISP                     2
+#define AO_MCPU                         4
+#define AO_BBPHARQMEM                   5
+#define AO_HIFI                         8
+#define AO_ACPUSCUL2C                   12
+
 #endif /*_DT_BINDINGS_RESET_CONTROLLER_HI6220*/
-- 
2.7.4
