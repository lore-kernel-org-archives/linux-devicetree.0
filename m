From: Bao Xiaowei <xiaowei.bao-3arQi8VN3Tc@public.gmane.org>
Subject: [PATCHv4 0/3] dts: Add the property of IB and OB
Date: Fri, 10 Nov 2017 11:48:44 +0800
Message-ID: <20171110034847.17891-1-xiaowei.bao@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, madalin.bucur-3arQi8VN3Tc@public.gmane.org, sumit.garg-3arQi8VN3Tc@public.gmane.org, yangbo.lu-3arQi8VN3Tc@public.gmane.org, hongtao.jia-3arQi8VN3Tc@public.gmane.org, Yuantian.Tang-3arQi8VN3Tc@public.gmane.org, leoyang.li-3arQi8VN3Tc@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org, jingoohan1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, pbrobinson-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, songxiaowei-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Zhiqiang.Hou-3arQi8VN3Tc@public.gmane.org, mingkai.hu-3arQi8VN3Tc@public.gmane.org, Minghuan.Lian-3arQi8VN3Tc@public.gmane.org
Cc: Bao Xiaowei <xiaowei.bao-3arQi8VN3Tc@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Depend on http://patchwork.ozlabs.org/patch/815382/

Bao Xiaowei (3):
  ARMv8: dts: ls1046a: add the property of IB and OB
  ARMv8: layerscape: add the pcie ep function support
  ARMv8: pcie: make the DWC EP driver support for layerscape

 arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi |   6 ++
 drivers/pci/dwc/Kconfig                        |   1 +
 drivers/pci/dwc/pci-layerscape.c               | 121 +++++++++++++++++++++++--
 3 files changed, 121 insertions(+), 7 deletions(-)

-- 
2.14.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
