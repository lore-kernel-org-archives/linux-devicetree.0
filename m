From: Sudeep Holla <sudeep.holla@arm.com>
Subject: [PATCH] of: return of_get_cpu_node from of_cpu_device_node_get if CPUs are not registered
Date: Mon, 24 Jul 2017 14:55:13 +0100
Message-ID: <1500904513-10483-1-git-send-email-sudeep.holla@arm.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org
Cc: Sudeep Holla <sudeep.holla@arm.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>
List-Id: devicetree@vger.kernel.org

Instead of the callsites choosing between of_cpu_device_node_get if the
CPUs are registered as of_node is populated by then and of_get_cpu_node
when the CPUs are not yet registered as CPU of_nodes are not yet stashed
thereby needing to parse the device tree, we can call of_get_cpu_node
in case the CPUs are not yet registered.

This will allow to use of_cpu_device_node_get anywhere hiding the
details from the caller.

Cc: Rob Herring <robh+dt@kernel.org>
Cc: Frank Rowand <frowand.list@gmail.com>
Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
---
 include/linux/of_device.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

Hi Rob,

Let me know if you are OK with this change. I keep seeing different
drivers calling of_get_cpu_node or of_cpu_device_node_get based on what
they are aware of or copying from other place without knowing the
details. I am trying to avoid that and ask to use of_cpu_device_node_get
at all places instead.

Regards,
Sudeep

diff --git a/include/linux/of_device.h b/include/linux/of_device.h
index b4ad8b4f8506..611502524425 100644
--- a/include/linux/of_device.h
+++ b/include/linux/of_device.h
@@ -50,7 +50,7 @@ static inline struct device_node *of_cpu_device_node_get(int cpu)
 	struct device *cpu_dev;
 	cpu_dev = get_cpu_device(cpu);
 	if (!cpu_dev)
-		return NULL;
+		return of_get_cpu_node(cpu, NULL);
 	return of_node_get(cpu_dev->of_node);
 }

--
2.7.4
