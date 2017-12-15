From: Dhaval Shah <dhaval.shah-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v4 0/2] Documentation and driver of logicoreIP
Date: Thu, 14 Dec 2017 23:24:14 -0800
Message-ID: <1513322656-4571-1-git-send-email-dshah@xilinx.com>
References: <29198c0a-783e-8aa0-00e4-44b1fa1acef7@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <29198c0a-783e-8aa0-00e4-44b1fa1acef7-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: arnd-r2nGTMty4D4@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, hyunk-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, Dhaval Shah <dshah-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

1st patch provide Device Tree binding document for logicoreIP
2nd patch provide the xlnx_vcu logicoreIP driver, Kconfig changes
and Makefile changes for the driver.

Dhaval Shah (2):
  Documentation: devicetree: Add DT bindings to xlnx_vcu driver
  misc: xlnx_vcu: Add Xilinx ZYNQMP VCU logicoreIP init driver

 .../devicetree/bindings/misc/xlnx,vcu.txt          |  31 +
 drivers/misc/Kconfig                               |  15 +
 drivers/misc/Makefile                              |   1 +
 drivers/misc/xlnx_vcu.c                            | 631 +++++++++++++++++++++
 4 files changed, 678 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/misc/xlnx,vcu.txt
 create mode 100644 drivers/misc/xlnx_vcu.c

-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
