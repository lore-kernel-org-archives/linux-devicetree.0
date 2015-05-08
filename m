From: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: [PATCH] clk: bindings: Fix assigned-clock-rates description
Date: Thu,  7 May 2015 23:51:14 -0700
Message-ID: <1431067874-7877-1-git-send-email-sboyd@codeaurora.org>
References: <5549CC5C.8090107@samsung.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5549CC5C.8090107-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

The binding uses assigned-clock-parents when it should use
assigned-clock-rates. Furthermore, the part that describes how
they relate to the assigned-clocks property is not clear about
what is related. Correct and clarify this part of the binding.

Reported-by: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Signed-off-by: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
---

On 05/06, Krzysztof Kozlowski wrote:
> Looks much better. So actually this should be yours patch now, you
> can add my Reported-by :).

Ok. I'll queue up this patch unless there are any other objections.

 Documentation/devicetree/bindings/clock/clock-bindings.txt | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/clock-bindings.txt b/Documentation/devicetree/bindings/clock/clock-bindings.txt
index 06fc6d541c89..2ec489eebe72 100644
--- a/Documentation/devicetree/bindings/clock/clock-bindings.txt
+++ b/Documentation/devicetree/bindings/clock/clock-bindings.txt
@@ -138,9 +138,10 @@ Some platforms may require initial configuration of default parent clocks
 and clock frequencies. Such a configuration can be specified in a device tree
 node through assigned-clocks, assigned-clock-parents and assigned-clock-rates
 properties. The assigned-clock-parents property should contain a list of parent
-clocks in form of phandle and clock specifier pairs, the assigned-clock-parents
-property the list of assigned clock frequency values - corresponding to clocks
-listed in the assigned-clocks property.
+clocks in the form of a phandle and clock specifier pair and the
+assigned-clock-rates property should contain a list of frequencies in Hz. Both
+these properties should correspond to the clocks listed in the assigned-clocks
+property.
 
 To skip setting parent or rate of a clock its corresponding entry should be
 set to 0, or can be omitted if it is not followed by any non-zero entry.
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
