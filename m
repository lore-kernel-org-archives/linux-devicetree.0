From: Tomas Novotny <tomas-P46umIhNmdHrBKCeMvbIDA@public.gmane.org>
Subject: [PATCH 0/4] rtc: ds1307: add support for device tree and mcp7940x
Date: Mon, 24 Nov 2014 16:49:20 +0100
Message-ID: <1416844164-16782-1-git-send-email-tomas@novotny.cz>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Tomas Novotny <tomas-P46umIhNmdHrBKCeMvbIDA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This series is tested with MCP79401 and it is based on 3.18-rc6.

Tomas Novotny (4):
  rtc: ds1307: add support for mcp7940x chips
  of: add vendor prefix for Pericom Technology
  rtc: ds1307: add device tree bindings documentation
  rtc: ds1307: add device tree support

 .../devicetree/bindings/rtc/maxim,ds1307.txt       |  23 ++++
 .../devicetree/bindings/vendor-prefixes.txt        |   1 +
 drivers/rtc/rtc-ds1307.c                           | 149 ++++++++++++---------
 3 files changed, 110 insertions(+), 63 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/rtc/maxim,ds1307.txt

-- 
2.1.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
