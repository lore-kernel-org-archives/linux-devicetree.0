From: Brandon Martin <martinbv-cvVvTOR6QHAqDJ6do+/SaQ@public.gmane.org>
Subject: [PATCH 0/2] DT bindings for rtc-v3020
Date: Tue, 22 Aug 2017 17:05:05 -0400
Message-ID: <b832db93-9885-adfe-39b4-1950851b391d@mothictech.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

The V3020 driver didn't have DT bindings which is a problem if you want to
use it on a DT-only platform.  Let's fix that.

Tested on a CompuLab CM-T3517 which uses the GPIO attachment/access method.
I don't have anything that hooks it up using MMIO, so I can't test that
access mode.

Long-ish time kernel hacker, first time patch submitter.  Be gentle, please.
Comments welcome, of course.

Brandon Martin (2):
  rtc: v3020: Add documentation for DT bindings
  rtc: v3020: DT bindings

 .../devicetree/bindings/rtc/rtc-v3020.txt          |  38 ++++++
 drivers/rtc/rtc-v3020.c                            | 152 +++++++++++----------
 2 files changed, 119 insertions(+), 71 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/rtc/rtc-v3020.txt

-- 
2.11.0
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
