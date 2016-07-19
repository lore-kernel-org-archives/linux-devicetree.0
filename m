From: Randy Li <randy.li-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: [PATCH v3 0/2] usb: dwc2: fix the usb host for host port at RK3288
Date: Tue, 19 Jul 2016 20:00:04 +0800
Message-ID: <1468929606-6652-1-git-send-email-randy.li@rock-chips.com>
References: <1446236275-12698-2-git-send-email-dianders@chromium.org>
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1446236275-12698-2-git-send-email-dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: johnyoun-HKixBCOQz3hWk0Htik3J/w@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ayaka-xPW3/0Ywev/iB9QmIjCX8w@public.gmane.org, eddie.cai-TNX95d0MmH7DzftRWevZcw@public.gmane.org, Randy Li <randy.li-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi, the implementation of Doug is thought quick but the Herring 
want to use this problem in autosuspend. Unfortunately, It is a fault
in hardware, onyl would happened at Rockchip RK3288 now.

So I suggest to accept this idea. It may be better if dropped
the dts,  as it is an issue only for RK3288, just hard-code to
source code. If maintainer would agree with the later one, I would
send the other version to the list.

Thank you for using of Rockchip.

Doug Anderson (2):
  usb: dwc2: optionally assert phy "full reset" when waking up
  ARM: dts: rockchip: Point rk3288 dwc2 usb at the full PHY reset

 Documentation/devicetree/bindings/usb/dwc2.txt |  7 +++++++
 arch/arm/boot/dts/rk3288.dtsi                  |  5 +++++
 drivers/usb/dwc2/core.h                        |  5 +++++
 drivers/usb/dwc2/core_intr.c                   | 14 ++++++++++++++
 drivers/usb/dwc2/platform.c                    | 13 +++++++++++++
 5 files changed, 44 insertions(+)

-- 
2.7.4


--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
