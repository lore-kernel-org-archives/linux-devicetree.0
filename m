From: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Subject: [PATCH][RESEND] of: return of_get_cpu_node from of_cpu_device_node_get if CPUs are not registered
Date: Mon, 14 Aug 2017 17:18:40 +0100
Message-ID: <1502727520-5635-1-git-send-email-sudeep.holla@arm.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Instead of the callsites choosing between of_cpu_device_node_get if the
CPUs are registered as of_node is populated by then and of_get_cpu_node
when the CPUs are not yet registered as CPU of_nodes are not yet stashed
thereby needing to parse the device tree, we can call of_get_cpu_node
in case the CPUs are not yet registered in of_cpu_device_node_get.

This will allow to use of_cpu_device_node_get anywhere hiding the
details from the caller.

Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Signed-off-by: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
---
 include/linux/of_device.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

Hi Rob,

You have already acked this patch, but I wanted you to pick up this via
your tree and hence I am resending it. I tried pinging on that thread
but I can understand that it's lost in your mailbox :)

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

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
