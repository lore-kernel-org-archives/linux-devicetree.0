From: Zhiqiang Hou <Zhiqiang.Hou-3arQi8VN3Tc@public.gmane.org>
Subject: [PATCHv2 0/3] dts: add ls2088a and 1088a pcie DT nodes
Date: Fri, 4 Aug 2017 14:44:03 +0800
Message-ID: <1501829046-3761-1-git-send-email-Zhiqiang.Hou@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, prabhakar.kushwaha-3arQi8VN3Tc@public.gmane.org
Cc: Hou Zhiqiang <Zhiqiang.Hou-3arQi8VN3Tc@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Hou Zhiqiang <Zhiqiang.Hou-3arQi8VN3Tc@public.gmane.org>

Add GICv3 ITS DT node for ls1088a, because the PCIe nodes must
have a msi-parent.

Hou Zhiqiang (3):
  dts: ls2088a: add pcie support
  dts: ls1088a: add gicv3 ITS DT node
  dts: ls1088a: add PCIe controller DT nodes

 arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi | 81 ++++++++++++++++++++++++++
 arch/arm64/boot/dts/freescale/fsl-ls2088a.dtsi |  4 ++
 2 files changed, 85 insertions(+)

-- 
2.1.0.27.g96db324

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
