From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?=
	<u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: [PATCH 0/2] arm: efm32: dts updates
Date: Thu, 10 Sep 2015 10:09:50 +0200
Message-ID: <1441872592-388-1-git-send-email-u.kleine-koenig@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello,

these two patches are part of my patch stack for efm32 since early in
2014. I intend to put them into next after 4.3-rc1 is released and let
them pull for 4.4-rc1 by the arm-soc folk. (Well unless someone objects=
 of
course.)

Best regards
Uwe

Uwe Kleine-K=C3=B6nig (2):
  ARM: efm32: switch to properly namespaced location property
  ARM: efm32: switch to vendor,device compatible strings

 arch/arm/boot/dts/efm32gg-dk3750.dts |  8 ++++----
 arch/arm/boot/dts/efm32gg.dtsi       | 32 ++++++++++++++++------------=
----
 2 files changed, 20 insertions(+), 20 deletions(-)

--=20
2.5.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
