From: Yogesh Gaur <yogeshnarayan.gaur-3arQi8VN3Tc@public.gmane.org>
Subject: [PATCH 0/2] mtd: fsl-quadspi: Update slave device hwcap based on mode provided in dtsi file
Date: Tue, 30 Jan 2018 23:03:55 +0530
Message-ID: <1517333637-17331-1-git-send-email-yogeshnarayan.gaur@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, cyrille.pitchen-yU5RGvR974pGWvitb5QawA@public.gmane.org, computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, han.xu-3arQi8VN3Tc@public.gmane.org, festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, prabhakar.kushwaha-3arQi8VN3Tc@public.gmane.org, suresh.gupta-3arQi8VN3Tc@public.gmane.org, Yogesh Gaur <yogeshnarayan.gaur-3arQi8VN3Tc@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch-set added support to update hwcap of slave device connected to
FSL QUADSPI controller by reading values from the device tree files.

Mode information is available via "spi-tx-bus-width" and
"spi-rx-bus-width" nodes of device tree for the connected slave device.

Update read and write hwcap capability for slave device by reading
"spi-rx-bus-width" and "spi-tx-bus-width" respectively.

Added usage example by adding support for spi-rx-bus-width
and spi-tx-bus-width binding.

Depends on
 https://patchwork.ozlabs.org/project/linux-mtd/list/?series=26084

Yogesh Gaur (2):
  mtd: fsl-quadspi: Update slave device hwcap based on mode provided in
    dtsi file
  dt-bindings: fsl-quadspi: spi-rx/tx-bus-width usage example

 .../devicetree/bindings/mtd/fsl-quadspi.txt        | 30 ++++++++++++
 drivers/mtd/spi-nor/fsl-quadspi.c                  | 56 ++++++++++++++++++++--
 2 files changed, 81 insertions(+), 5 deletions(-)

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
