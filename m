From: Laura Abbott <laura-0PSzFVTn/CLa5EbDDlwbIw@public.gmane.org>
Subject: [RESEND][PATCHv2 1/3] ion: Devicetree bindings for Ion
Date: Mon, 11 Jan 2016 13:39:22 -0800
Message-ID: <1452548364-9522-2-git-send-email-laura@labbott.name>
References: <1452548364-9522-1-git-send-email-laura@labbott.name>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1452548364-9522-1-git-send-email-laura-0PSzFVTn/CLa5EbDDlwbIw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sumit Semwal <sumit.semwal-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Andrew Andrianov <andrew-g16cbSVCqPUdnm+yROfE0A@public.gmane.org>, arve-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org, Riley Andrews <riandrews-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Cc: Laura Abbott <laura-0PSzFVTn/CLa5EbDDlwbIw@public.gmane.org>, John Stultz <john.stultz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Tom Gall <tom.gall-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Colin Cross <ccross-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, romlem-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, mitchelh-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Feng Tang <feng.tang-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org


This adds a base set of devicetree bindings for the Ion memory
manager. This supports setting up the generic set of heaps and
their properties.

Signed-off-by: Laura Abbott <laura-0PSzFVTn/CLa5EbDDlwbIw@public.gmane.org>
---
 drivers/staging/android/ion/devicetree.txt | 50 ++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)
 create mode 100644 drivers/staging/android/ion/devicetree.txt

diff --git a/drivers/staging/android/ion/devicetree.txt b/drivers/staging/android/ion/devicetree.txt
new file mode 100644
index 0000000..e1ea537
--- /dev/null
+++ b/drivers/staging/android/ion/devicetree.txt
@@ -0,0 +1,50 @@
+Ion Memory Manager
+
+Ion is a memory manager that allows for sharing of buffers via dma-buf.
+Ion allows for different types of allocation via an abstraction called
+a 'heap'. A heap represents a specific type of memory. Each heap has
+a different type. There can be multiple instances of the same heap
+type.
+
+Required properties for Ion
+
+- compatible: "linux,ion" PLUS a compatible property for the device
+
+All child nodes of a linux,ion node are interpreted as heaps
+
+required properties for heaps
+
+- compatible: compatible string for a heap type PLUS a compatible property
+for the specific instance of the heap. Current heap types
+-- linux,ion-heap-system
+-- linux,ion-heap-system-contig
+-- linux,ion-heap-carveout
+-- linux,ion-heap-chunk
+-- linux,ion-heap-dma
+-- linux,ion-heap-custom
+
+Optional properties
+- memory-region: A phandle to a memory region. Required for DMA heap type
+(see reserved-memory.txt for details on the reservation)
+
+Example:
+
+	ion {
+		compatbile = "qcom,msm8916-ion", "linux,ion";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		ion-system-heap {
+			compatbile = "qcom,system-heap", "linux,ion-heap-system"
+		};
+
+		ion-camera-region {
+			compatible = "qcom,camera-heap", "linux,ion-heap-dma"
+			memory-region = <&camera_region>;
+		};
+
+		ion-fb-region {
+			compatbile = "qcom,fb-heap", "linux,ion-heap-dma"
+			memory-region = <&fb_region>;
+		};
+	}
-- 
2.5.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
