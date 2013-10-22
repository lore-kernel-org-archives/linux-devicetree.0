From: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH 0/4] charger-manager: Support Devicetree and use IIO susbystem
Date: Tue, 22 Oct 2013 21:51:53 +0900
Message-ID: <1382446317-32613-1-git-send-email-cw00.choi@samsung.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: anton-9xeibp6oKSgdnm+yROfE0A@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, myungjoo.ham-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patchset support DT(Device Tree) to get platform data for charger desc
structure from dts file and use IIO(Industrial I/O) subsystem to read ADC
value of battery temperature instead of using legacy method.

Chanwoo Choi (4):
  charger-manager: Support DT to get platform data for charger_desc
  charger-manager: Use IIO subsystem to read battery temperature instead of legacy method
  charger-manager: Add device tree binding for charger-manager
  charger-manager: Remove build warning fo unused variable

 .../devicetree/bindings/power/charger-manager.txt  | 106 ++++++
 drivers/power/Kconfig                              |   1 +
 drivers/power/charger-manager.c                    | 379 ++++++++++++++++++++-
 include/linux/power/charger-manager.h              |  25 +-
 4 files changed, 493 insertions(+), 18 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/power/charger-manager.txt

-- 
1.8.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
