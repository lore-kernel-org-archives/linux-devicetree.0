From: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [PATCH v5 0/2] usb: change clock information for chipidea
Date: Tue, 20 Oct 2015 14:58:37 +0800
Message-ID: <1445324319-19063-1-git-send-email-peter.chen@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, mkl-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org, Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch set changes usb clock information for legacy i.mx platforms.
At these platforms, they needs three clocks to let controller work.

Fabio, would you please help to test again, I am sorry to let you
test again.

Changes for v5:
- Using one line code for two devm_clk_get error message
- disable clocks should be inverse with enable clocks

Changes for v4:
- Following Rob Herring suggestion, if the platforms can get
clock using their dev_id, then, they are legacy platforms which
need three clocks to let controller work. If the dev_id is NULL,
then it only needs one clock.
- Only includes bug fix patches in this set, for new changes, will
through the next-tree.

Changes for v3:
- Delete property "needs-three-clocks", and using of_device_id->data
  to differentiate platforms
- change <stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org> #v3.19+ to <stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org> #v4.1+

Changes for v2:
- Add imx25 & imx27 dts change
- Add Fabio's tested-by and Cc: <stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org> #v3.19+
- Some typo and commit description

Peter Chen (2):
  ARM: dts: imx27.dtsi: change the clock information for usb
  usb: chipidea: imx: refine clock operations to adapt for all platforms

 arch/arm/boot/dts/imx27.dtsi       |  16 +++--
 drivers/usb/chipidea/ci_hdrc_imx.c | 131 ++++++++++++++++++++++++++++++++-----
 2 files changed, 125 insertions(+), 22 deletions(-)

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
