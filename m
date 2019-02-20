From: Jerry-ch Chen <Jerry-Ch.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [RFC PATCH V0 3/7] [media] dt-bindings: mt8183: Added FD-SMEM
 dt-bindings
Date: Wed, 20 Feb 2019 15:48:09 +0800
Message-ID: <1550648893-42050-4-git-send-email-Jerry-Ch.chen@mediatek.com>
References: <1550648893-42050-1-git-send-email-Jerry-Ch.chen@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1550648893-42050-1-git-send-email-Jerry-Ch.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org, laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, tfiga-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sean.Cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Rynn.Wu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, holmes.chiou-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Jerry-ch Chen <jerry-ch.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, jungo.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, sj.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, yuzhao-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, zwisler-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, christie.yu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, frederic.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patch adds the DT binding documentation for the shared memory
between Face Detection unit of the camera system and the co-processor
in Mediatek SoCs.

Signed-off-by: Jerry-ch Chen <jerry-ch.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
---
 .../devicetree/bindings/media/mediatek,fd_smem.txt | 28 ++++++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,fd_smem.txt

diff --git a/Documentation/devicetree/bindings/media/mediatek,fd_smem.txt b/Documentation/devicetree/bindings/media/mediatek,fd_smem.txt
new file mode 100644
index 0000000..6f7c836
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/mediatek,fd_smem.txt
@@ -0,0 +1,28 @@
+Mediatek FD Shared Memory Device
+
+Mediatek FD Shared Memory Device is used to manage shared memory
+among CPU, FD and coprocessor. It is associated with a reserved
+memory region (Please see Documentation/devicetree/bindings/
+reserved-memory/mediatek,reserve-memory-fd_smem.txt) and
+provide the context to allocate memory with dma addresses.
+
+Required properties:
+- compatible: Shall be "mediatek,fd_smem"
+
+- iommus: Shall point to the respective IOMMU block with master port
+  as argument. Please set the ports which may be accessed
+  through the common path. You can see
+  Documentation/devicetree/bindings/iommu/mediatek,iommu.txt
+  for the detail.
+
+- mediatek,larb: must contain the local arbiters in the current SoCs.
+  Please set the larb of imgsys for FD if you are using FD function.
+  You can see Documentation/devicetree/bindings/memory-controllers/
+  mediatek,smi-larb.txt for the detail.
+
+Example:
+	fd_smem: fd_smem {
+		compatible = "mediatek,fd_smem";
+		mediatek,larb = <&larb5>;
+		iommus = <&iommu M4U_PORT_CAM_IMGI>;
+	};
-- 
1.9.1
