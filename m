From: Jan Viktorin <viktorin-MQpMGdXoZmMqDJ6do+/SaQ@public.gmane.org>
Subject: [PATCH 3/4] uio: introduce devicetree bindings for uio_dmem_genirq
Date: Tue, 17 May 2016 11:22:19 +0200
Message-ID: <1463476940-26791-4-git-send-email-viktorin@rehivetech.com>
References: <1463476940-26791-1-git-send-email-viktorin@rehivetech.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1463476940-26791-1-git-send-email-viktorin-MQpMGdXoZmMqDJ6do+/SaQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Jan Viktorin <viktorin-MQpMGdXoZmMqDJ6do+/SaQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "Hans J. Koch" <hjk-vqZO0P4V72/QD6PfKP4TzA@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Jan Viktorin <viktorin-MQpMGdXoZmMqDJ6do+/SaQ@public.gmane.org>
---
 .../devicetree/bindings/uio/uio_dmem_genirq.txt          | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/uio/uio_dmem_genirq.txt

diff --git a/Documentation/devicetree/bindings/uio/uio_dmem_genirq.txt b/Documentation/devicetree/bindings/uio/uio_dmem_genirq.txt
new file mode 100644
index 0000000..5416f71
--- /dev/null
+++ b/Documentation/devicetree/bindings/uio/uio_dmem_genirq.txt
@@ -0,0 +1,16 @@
+UIO device for dynamic memory allocation
+----------------------------------------
+
+When binding the uio_dmem_genirq via the device tree by setting
+the of_id from command line, the following OF properties are
+used for initialization:
+
+- uio,number-of-dynamic-regions
+
+  Determines the number of dynamically allocated memory regions
+  for the device.
+
+- uio,dynamic-regions-sizes
+
+  Sizes of regions to be allocated. It is expected to contain
+  at least uio,number-of-dynamic-regions sizes.
-- 
2.8.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
