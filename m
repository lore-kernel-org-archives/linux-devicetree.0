From: Stephen Warren <swarren@wwwdotorg.org>
Subject: [PATCH] clocksource: always define CLOCKSOURCE_OF_DECLARE
Date: Wed, 30 Jan 2013 10:49:30 -0700
Message-ID: <1359568170-26479-1-git-send-email-swarren@wwwdotorg.org>
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
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: arm@kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, kgene.kim@samsung.com, Stephen Warren <swarren@nvidia.com>, johnstul@us.ibm.com, devicetree-discuss@lists.ozlabs.org, rob.herring@calxeda.com, Thomas Abraham <thomas.abraham@linaro.org>, tglx@linutronix.de, chaos.youn@samsung.com, sylvester.nawrocki@gmail.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

From: Stephen Warren <swarren@nvidia.com>

This allows clocksource drivers that support both DT and non-DT to
always invoke macro CLOCKSOURCE_OF_DECLARE(), rather than wrapping
it in a #ifdef CONFIG_CLKSRC_OF, which simplifies their code.

Signed-off-by: Stephen Warren <swarren@nvidia.com>
---
Olof, Arnd, this is based on arm-soc's timer/cleanup branch, which is
probably the best place for this patch.

 include/linux/clocksource.h |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/linux/clocksource.h b/include/linux/clocksource.h
index 7944f14..27cfda4 100644
--- a/include/linux/clocksource.h
+++ b/include/linux/clocksource.h
@@ -339,6 +339,8 @@ extern void clocksource_of_init(void);
 	static const struct of_device_id __clksrc_of_table_##name	\
 		__used __section(__clksrc_of_table)			\
 		 = { .compatible = compat, .data = fn };
+#else
+#define CLOCKSOURCE_OF_DECLARE(name, compat, fn)
 #endif
 
 #endif /* _LINUX_CLOCKSOURCE_H */
-- 
1.7.10.4
