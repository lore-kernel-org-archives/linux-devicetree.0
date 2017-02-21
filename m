From: Richard Leitner <richard.leitner-WcANXNA0UjBBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH 0/3] usb: misc: improve USB251xB/xBi dt bindings
Date: Tue, 21 Feb 2017 09:56:16 +0100
Message-ID: <1487667379-2075-1-git-send-email-richard.leitner@skidata.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, dev-M/VWbR8SM2SsTnJN9+BGXg@public.gmane.org, Richard Leitner <richard.leitner-WcANXNA0UjBBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patchset improves/fixes the USB251xB/xBi devicetree bindings as
recommended by Rob Herring.

Richard Leitner (3):
  usb: usb251xb: remove max_{power,current}_{sp,bp} properties
  usb: usb251xb: dt: add unit suffix to oc-delay and power-on-time
  doc: dt-bindings: usb251xb: mark reg as required

 Documentation/devicetree/bindings/usb/usb251xb.txt | 52 +++++++-------------
 drivers/usb/misc/usb251xb.c                        | 56 +++++++++-------------
 2 files changed, 40 insertions(+), 68 deletions(-)

-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
