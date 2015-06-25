From: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
Subject: [PATCH] Documentation: dt: clk: fix typo in assigned-clock-rates name
Date: Thu, 25 Jun 2015 18:06:30 +0300
Message-ID: <1435244790-13064-1-git-send-email-vladimir_zapolskiy@mentor.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Mike Turquette <mturquette@linaro.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Fix a trivial copy-paste typo, "assigned-clock-rates" property is
named as "assigned-clock-parents".

Signed-off-by: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
---
 Documentation/devicetree/bindings/clock/clock-bindings.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/clock-bindings.txt b/Documentation/devicetree/bindings/clock/clock-bindings.txt
index 06fc6d5..bf5b041 100644
--- a/Documentation/devicetree/bindings/clock/clock-bindings.txt
+++ b/Documentation/devicetree/bindings/clock/clock-bindings.txt
@@ -138,7 +138,7 @@ Some platforms may require initial configuration of default parent clocks
 and clock frequencies. Such a configuration can be specified in a device tree
 node through assigned-clocks, assigned-clock-parents and assigned-clock-rates
 properties. The assigned-clock-parents property should contain a list of parent
-clocks in form of phandle and clock specifier pairs, the assigned-clock-parents
+clocks in form of phandle and clock specifier pairs, the assigned-clock-rates
 property the list of assigned clock frequency values - corresponding to clocks
 listed in the assigned-clocks property.
 
-- 
2.1.4
