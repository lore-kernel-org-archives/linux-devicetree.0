From: Philipp Rossak <embed3d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 0/2] Fix broken bananapi m2 devicetree/regulators
Date: Wed, 14 Feb 2018 15:10:23 +0100
Message-ID: <20180214141025.22171-1-embed3d@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patchseries fixes the bananapi m1 devicetree, to be able to boot again.
The first two patches update/improve the devicetree and the last patch adds
all missing regulators.

Regards,
Philipp

Changes since v1:
	* squashed commit 1 and 3
	* fix wrong mmc regulator

Philipp Rossak (2):
  arm: dts: sun6i: a31s: bpi-m2: improve pmic properties
  arm: dts: sun6i: a31s: fix: bpi-m2: add missing regulators

 arch/arm/boot/dts/sun6i-a31s-sinovoip-bpi-m2.dts | 63 ++++++++++++++++++++++--
 1 file changed, 60 insertions(+), 3 deletions(-)

-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
