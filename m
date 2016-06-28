From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: [PATCH 11/92] of: Add a new macro to declare_of for one parameter function returning a value
Date: Tue, 28 Jun 2016 12:30:30 +0200
Message-ID: <1467109911-11060-11-git-send-email-daniel.lezcano@linaro.org>
References: <577251A4.7030508@linaro.org>
 <1467109911-11060-1-git-send-email-daniel.lezcano@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1467109911-11060-1-git-send-email-daniel.lezcano@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: daniel.lezcano@linaro.org, tglx@linutronix.de
Cc: linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The macro OF_DECLARE_1 expect a void (*func)(struct device_node *) while the
OF_DECLARE_2 expect a int (*func)(struct device_node *, struct device_node *).

The second one allows to pass an init function returning a value, which make
possible to call the functions in the table and check the return value in order
to catch at a higher level the errors and handle them from there instead of
doing a panic in each driver (well at least this is the case for the clkevt).

Unfortunately the OF_DECLARE_1 does not allow that and that lead to some code
duplication and crappyness in the drivers.

The OF_DECLARE_1 is used by all the clk drivers and the clocksource/clockevent
drivers. It is not possible to do the change in one shot as we have to change
all the init functions.

The OF_DECLARE_2 specifies an init function prototype with two parameters with
the node and its parent. The latter won't be used, ever, in the timer drivers.

Introduce a OF_DECLARE_1_RET macro to be used, and hopefully we can smoothly
and iteratively change the users of OF_DECLARE_1 to use the new macro instead.

Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
Acked-by: Rob Herring <robh@kernel.org>
---
 include/linux/of.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/linux/of.h b/include/linux/of.h
index c7292e8..552943d 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -1009,10 +1009,13 @@ static inline int of_get_available_child_count(const struct device_node *np)
 #endif
 
 typedef int (*of_init_fn_2)(struct device_node *, struct device_node *);
+typedef int (*of_init_fn_1_ret)(struct device_node *);
 typedef void (*of_init_fn_1)(struct device_node *);
 
 #define OF_DECLARE_1(table, name, compat, fn) \
 		_OF_DECLARE(table, name, compat, fn, of_init_fn_1)
+#define OF_DECLARE_1_RET(table, name, compat, fn) \
+		_OF_DECLARE(table, name, compat, fn, of_init_fn_1_ret)
 #define OF_DECLARE_2(table, name, compat, fn) \
 		_OF_DECLARE(table, name, compat, fn, of_init_fn_2)
 
-- 
1.9.1
