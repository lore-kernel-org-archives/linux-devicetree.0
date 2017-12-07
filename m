From: Andrey Zhizhikin <andrey.z-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 1/2] uio: Allow to take irq bottom-half into irq_handler with additional dt-binding
Date: Thu,  7 Dec 2017 15:46:58 +0100
Message-ID: <1512658019-30279-2-git-send-email-andrey.z@gmail.com>
References: <1512572140-48009-1-git-send-email-andrey.z@gmail.com>
 <1512658019-30279-1-git-send-email-andrey.z@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1512658019-30279-1-git-send-email-andrey.z-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andrey Zhizhikin <andrey.z-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Certain Kernel preemption models are using threaded interrupt handlers,
which is in general quite beneficial. However, threaded handlers
introducing additional scheduler overhead, when the bottom-half thread
should be woken up and scheduled for execution. This can result is
additional latency, which in certain cases is not desired.

UIO driver with Generic IRQ handler, that wraps a HW block might suffer
a small degradation when it's bottom half is executed, since it needs
its bottom half to be woken up by the scheduler every time INT is
delivered. For high rate INT signals, this also bring additional
undesired load on the scheduler itself.

Since the actual ACK is performed in the top-half, and bottom-half of
the UIO driver with Generic IRQ handler is relatively slick (only flag
is set based on the INT reception), it might be beneficial to move this
bottom-half to the irq_handler itself, rather than to have a separate
thread to service it.

This patch aims to address the task above by supplying IRQF_NO_THREAD to
request_irq(), based on dt-binding which could be configured on a per-node
basis. That means developers utilizing the UIO driver could decide which
UIO instance is critical in terms of interrupt processing, and move their
corresponding bottom-halves to the irq_handler to fight additional
scheduling latency. When additional property is not found in corresponding
dt-node, then instance behavior is not amended and overall system stays
with default configuration for threaded IRQ (depending on how they are
configured by Preemption model).

Patch was originated on the ARM-based system with Kernel configuration
CONFIG_PREEMPT_RT_FULL set, which effectively promotes all bottom-halves
to threaded interrupt handlers. Once this patch has been enabled on 2
individual uio device nodes (out of around 20 registered in the system),
no additional negative impact has been noted on the system overall.

Having this patch enabled for individual UIO node allowed to have a
latency reduction of around 20-30 usec from INT trigger to the user space
IRQ handler. Those results can vary based on the platform and CPU
architecture, but could be quite beneficial if above gain in comparable
to the worst-case latency figures.

This modification also brings several additional benefits:
- It eliminates few re-scheduling operations, making INT ACK code more
robust and relieves the pressure from the scheduler when HW interrupt
for this IRQ is signaled at a high-enough frequency;
- It makes top and bottom half to be executed back-to-back with IRQ
OFF, making operation pseudo-atomic;
- Above gain might be significant when average latency times for the
systems are comparable

Signed-off-by: Andrey Zhizhikin <andrey.z-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

diff --git a/drivers/uio/uio_pdrv_genirq.c b/drivers/uio/uio_pdrv_genirq.c
index f598ecd..86427a4 100644
--- a/drivers/uio/uio_pdrv_genirq.c
+++ b/drivers/uio/uio_pdrv_genirq.c
@@ -108,6 +108,7 @@ static int uio_pdrv_genirq_probe(struct platform_device *pdev)
 	struct uio_pdrv_genirq_platdata *priv;
 	struct uio_mem *uiomem;
 	int ret = -EINVAL;
+	int no_threaded_irq = 0;
 	int i;
 
 	if (pdev->dev.of_node) {
@@ -121,6 +122,14 @@ static int uio_pdrv_genirq_probe(struct platform_device *pdev)
 		uioinfo->name = pdev->dev.of_node->name;
 		uioinfo->version = "devicetree";
 		/* Multiple IRQs are not supported */
+
+		/* read additional property (if exists) and decide whether
+		 * to have IRQ bottom half to be executed in a separate
+		 * thread, or to have it executed in the irq_handler
+		 * context
+		 */
+		if (of_property_read_bool(pdev->dev.of_node, "no-threaded-irq"))
+			no_threaded_irq = 1;
 	}
 
 	if (!uioinfo || !uioinfo->name || !uioinfo->version) {
@@ -134,6 +143,12 @@ static int uio_pdrv_genirq_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	/* execute BH in irq_handler if property set in FDT */
+	if ((no_threaded_irq > 0) && !(uioinfo->irq_flags & IRQF_NO_THREAD)) {
+		dev_info(&pdev->dev, "promoting INT with IRQF_NO_THREAD\n");
+		uioinfo->irq_flags |= IRQF_NO_THREAD;
+	}
+
 	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv) {
 		dev_err(&pdev->dev, "unable to kmalloc\n");
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
