From: Velibor Markovski <velibor.markovski-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: [PATCH 0/2] Add support for ARM CCN-502 interconnect
Date: Fri, 10 Feb 2017 12:36:25 -0800
Message-ID: <1486758987-23769-1-git-send-email-velibor.markovski@broadcom.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, BCM Kernel Feedback <bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Velibor Markovski <velibor.markovski-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add compatible string for ARM CCN-502 interconnect.
CCN-502 interconnect is already compatible with the 
existing ARM CCN driver, which supports CCN-504.

This patchset is based on v4.10-rc3 and is available from github:
repo: https://github.com/Broadcom/arm64-linux
branch: arm64-ccn502

Velibor Markovski (2):
  dt-bindings: arm-ccn: Add bindings info for CCN-502 compatible string
  bus: arm-ccn: Enable stats for CCN-502 interconnect

 Documentation/devicetree/bindings/arm/ccn.txt | 1 +
 drivers/bus/arm-ccn.c                         | 1 +
 2 files changed, 2 insertions(+)

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
