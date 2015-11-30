From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH 0/2] regulator: Add support for parallel regulators
Date: Mon, 30 Nov 2015 16:29:04 +0100
Message-ID: <1448897346-17780-1-git-send-email-maxime.ripard@free-electrons.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On some boards, devices consuming a lot of power cannot use a single
regulator, but few of them in parallel to spread the consumption.

In such a case, we must ensure that all these regulators are kept in
sync.

Since this is something that is totally board specific, it should
obviously not be handle by each and every customer drivers that might
be driving a device wired this way on a particular board.

Instead, we implemented a regulator driver that just aggregates
several parent regulators and just forwards the regulators calls to
them.

Let me know what you think,
Maxime


Maxime Ripard (2):
  regulator: Add coupled regulator
  ARM: sunxi: chip: Add Wifi chip

 arch/arm/boot/dts/sun5i-r8-chip.dts           |  44 ++++-
 drivers/regulator/Kconfig                     |   7 +
 drivers/regulator/Makefile                    |   1 +
 drivers/regulator/coupled-voltage-regulator.c | 241 ++++++++++++++++++++++++++
 4 files changed, 292 insertions(+), 1 deletion(-)
 create mode 100644 drivers/regulator/coupled-voltage-regulator.c

-- 
2.6.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
