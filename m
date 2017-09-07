From: Ray Jui <ray.jui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: [PATCH 0/2] Binding document for iProc CDRU and MHB
Date: Wed,  6 Sep 2017 17:27:40 -0700
Message-ID: <1504744062-5941-1-git-send-email-ray.jui@broadcom.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ray Jui <ray.jui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch series adds binding documents for the iProc CDRU and MHB blocks

This patch series is based off v4.13-rc3 and is available on GIHUB:
repo: https://github.com/Broadcom/arm64-linux.git
branch: iproc-mfd-mhb-v1

Ray Jui (2):
  syscon: dt-bindings: Add binding doc for Broadcom iProc CDRU
  syscon: dt-bindings: Add binding document for iProc MHB block

 .../devicetree/bindings/mfd/brcm,iproc-cdru.txt        | 16 ++++++++++++++++
 .../devicetree/bindings/mfd/brcm,iproc-mhb.txt         | 18 ++++++++++++++++++
 2 files changed, 34 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/brcm,iproc-cdru.txt
 create mode 100644 Documentation/devicetree/bindings/mfd/brcm,iproc-mhb.txt

-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
