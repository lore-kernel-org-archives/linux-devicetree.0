From: Bjorn Andersson <bjorn.andersson-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
Subject: [PATCH 0/2] Qualcomm Shared Memory Driver
Date: Fri, 10 Apr 2015 17:16:52 -0700
Message-ID: <1428711414-17079-1-git-send-email-bjorn.andersson@sonymobile.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, agross-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, linux-kernel-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patch implements the shared memory based communication system found on all
Qualcomm platforms. SMD was originally used to communicate with the modem but
has grown to be part of power management as well as the various DSPs etc found
in Qualcomm platforms.

The code depends on the SMEM implementation found here:
https://patchwork.kernel.org/patch/6160431/

Bjorn Andersson (2):
  soc: qcom: Add device tree binding for Shared Memory Device
  soc: qcom: Add Shared Memory Driver

 .../devicetree/bindings/soc/qcom/qcom,smd.txt      |   78 ++
 drivers/soc/qcom/Kconfig                           |    8 +
 drivers/soc/qcom/Makefile                          |    1 +
 drivers/soc/qcom/smd.c                             | 1263 ++++++++++++++++++++
 include/linux/soc/qcom/smd.h                       |   47 +
 5 files changed, 1397 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,smd.txt
 create mode 100644 drivers/soc/qcom/smd.c
 create mode 100644 include/linux/soc/qcom/smd.h

-- 
1.8.2.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
