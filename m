From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: [PATCH RFC 0/2] simplefb: Add regulator handling support
Date: Tue, 13 Oct 2015 01:04:16 +0800
Message-ID: <1444669458-5588-1-git-send-email-wens@csie.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi everyone,

This series adds regulator claiming and enabling support for simplefb.

Sometimes the simplefb display output path consits of external conversion
chips and/or LCD drivers and backlights. These devices normally have
GPIOs to turn them on and/or bring them out of reset, and regulators
supplying power to them.

While the kernel does not touch unclaimed GPIOs, the regulator core
happily disables unused regulators. Thus we need simplefb to claim
and enable the regulators used throughout the display pipeline.

Now the DT bindings don't support a list of regulators directly, so
I'm working around it by having a "num-supplies" property to specify
the number of supply properties to check, and name the actual supplies
as "vinN-supply".

Hans, Maxime, AXP223 support for the A23/A33 Q8 tablets will need this
to keep the LCD on. The Primo81 needs this as well.


Patch 1 adds the regulator properties to the DT binding.

Patch 2 adds code to the simplefb driver to claim and enable regulators.


Regards
ChenYu


Chen-Yu Tsai (2):
  dt-bindings: simplefb: Support a list of regulator supply properties
  simplefb: Claim and enable regulators

 .../bindings/video/simple-framebuffer.txt          |  14 ++-
 drivers/video/fbdev/simplefb.c                     | 102 ++++++++++++++++++++-
 2 files changed, 111 insertions(+), 5 deletions(-)

-- 
2.5.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
