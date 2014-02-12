From: Alexander Popov <a13xp0p0v88-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH RFC v7 4/6] dma: mpc512x: add device tree binding document
Date: Wed, 12 Feb 2014 17:25:06 +0400
Message-ID: <1392211508-23615-5-git-send-email-a13xp0p0v88@gmail.com>
References: <1392211508-23615-1-git-send-email-a13xp0p0v88@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1392211508-23615-1-git-send-email-a13xp0p0v88-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Gerhard Sittig <gsi-ynQEQJNshbs@public.gmane.org>, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Anatolij Gustschin <agust-ynQEQJNshbs@public.gmane.org>, Alexander Popov <a13xp0p0v88-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Gerhard Sittig <gsi-ynQEQJNshbs@public.gmane.org>

introduce a device tree binding document for the MPC512x DMA controller

Signed-off-by: Gerhard Sittig <gsi-ynQEQJNshbs@public.gmane.org>
[ a13xp0p0v88-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org: turn this into a separate patch ]
---
 .../devicetree/bindings/dma/mpc512x-dma.txt        | 55 ++++++++++++++++++++++
 1 file changed, 55 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/dma/mpc512x-dma.txt

diff --git a/Documentation/devicetree/bindings/dma/mpc512x-dma.txt b/Documentation/devicetree/bindings/dma/mpc512x-dma.txt
new file mode 100644
index 0000000..a4867d5
--- /dev/null
+++ b/Documentation/devicetree/bindings/dma/mpc512x-dma.txt
@@ -0,0 +1,55 @@
+* Freescale MPC512x DMA Controller
+
+The DMA controller in the Freescale MPC512x SoC can move blocks of
+memory contents between memory and peripherals or memory to memory.
+
+Refer to the "Generic DMA Controller and DMA request bindings" description
+in the dma.txt file for a more detailled discussion of the binding.  The
+MPC512x DMA engine binding follows the common scheme, but doesn't provide
+support for the optional channels and requests counters (those values are
+derived from the detected hardware features) and has a fixed client
+specifier length of 1 integer cell (the value is the DMA channel, since
+the DMA controller uses a fixed assignment of request lines per channel).
+
+
+DMA controller node properties:
+
+Required properties:
+- compatible:		should be "fsl,mpc5121-dma"
+- reg:			address and size of the DMA controller's register set
+- interrupts:		interrupt spec for the DMA controller
+
+Optional properties:
+- #dma-cells:		must be <1>, describes the number of integer cells
+			needed to specify the 'dmas' property in client nodes,
+			strongly recommended since common client helper code
+			uses this property
+
+Example:
+
+	dma0: dma@14000 {
+		compatible = "fsl,mpc5121-dma";
+		reg = <0x14000 0x1800>;
+		interrupts = <65 0x8>;
+		#dma-cells = <1>;
+	};
+
+
+Client node properties:
+
+Required properties:
+- dmas:			list of DMA specifiers, consisting each of a handle
+			for the DMA controller and integer cells to specify
+			the channel used within the DMA controller
+- dma-names:		list of identifier strings for the DMA specifiers,
+			client device driver code uses these strings to
+			have DMA channels looked up at the controller
+
+Example:
+
+	sdhc@1500 {
+		compatible = "fsl,mpc5121-sdhc";
+		/* ... */
+		dmas = <&dma0 30>;
+		dma-names = "rx-tx";
+	};
-- 
1.8.4.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
