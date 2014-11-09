From: Jean-Francois Moine <moinejf-GANU6spQydw@public.gmane.org>
Subject: [PATCH 0/2] of: Fix some 'const' problems
Date: Sun, 9 Nov 2014 19:28:00 +0100
Message-ID: <cover.1415557680.git.moinejf@free.fr>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

A cast is often needed to call some OF functions, removing
the 'const' attribute.
This patchset makes 'const' the device node pointers of the functions
of_clk_get() and of_node_put() and also removes some useless casts
in the sound/soc tree.

Jean-Francois Moine (2):
  of: Make const the device node pointers in of_clk_get and of_node_put
  ASoC: Remove useless casts

 drivers/clk/clkdev.c                  | 2 +-
 drivers/of/dynamic.c                  | 2 +-
 include/linux/clk.h                   | 4 ++--
 include/linux/of.h                    | 4 ++--
 sound/soc/generic/simple-card.c       | 7 ++-----
 sound/soc/samsung/odroidx2_max98090.c | 4 ++--
 sound/soc/ux500/mop500.c              | 6 ++----
 7 files changed, 12 insertions(+), 17 deletions(-)

-- 
2.1.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
