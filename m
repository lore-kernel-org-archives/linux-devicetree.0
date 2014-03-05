From: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 0/3] pinctrl: mvebu: prepare for single PMU node
Date: Wed,  5 Mar 2014 01:03:07 +0100
Message-ID: <1393977790-29110-1-git-send-email-sebastian.hesselbarth@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

This is a small patch set preparing a discussion and rework for the
Power Management Unit (PMU) found on Marvell Dove SoCs. We are planing
to consolidate PMU into a single DT node instead of chopping it into
tiny pieces [1].

As we just have taken in patches for pinctrl driver that grab another
piece of PMU reg space, we rather drop the corresponding reg property
and wait for v3.15 and proper PMU node rework.

Patch 1 drops the reg property added for pinctrl and is based on mvebu/dt.

Patch 2 drops the reg property added for pinctrl from the corresponding
binding documentation and example. It is based on recently pulled
mvebu/pinctrl-dove.

Patch 3 reduces a WARN on missing reg properties to dev_warn with FW_BUG,
as we just enforced this situation. The driver will continue to work
properly without the resource and derive it from other resources. As soon
as PMU binding is worked out, we will update the driver to make use of it.

The last patch is optional and Linus Walleij can reject it, if he is already
done for v3.15.

[1] https://lkml.org/lkml/2014/3/3/326

Sebastian Hesselbarth (3):
  ARM: dove: drop pinctrl PMU reg property
  devicetree: bindings: drop pinctrl PMU reg property
  pinctrl: mvebu: silence WARN to dev_warn

 Documentation/devicetree/bindings/pinctrl/marvell,dove-pinctrl.txt  | 2 +-
 Documentation/devicetree/bindings/pinctrl/marvell,mvebu-pinctrl.txt | 2 +-
 arch/arm/boot/dts/dove.dtsi                                         | 3 +--
 drivers/pinctrl/mvebu/pinctrl-dove.c                                | 3 ++-
 4 files changed, 5 insertions(+), 5 deletions(-)

---
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
Cc: Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Cc: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Cc: Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
-- 
1.8.5.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
