From: Boris BREZILLON <b.brezillon-ZNYIgs0QAGpBDgjK7y7TUQ@public.gmane.org>
Subject: [RFC PATCH 0/4] pinctrl: at91: various fixes
Date: Fri, 13 Sep 2013 09:43:33 +0200
Message-ID: <1379058213-3245-1-git-send-email-b.brezillon@overkiz.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ian.campbell-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org>, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Richard Genoud <richard.genoud-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jiri Kosina <jkosina-AlSwsSmVLrQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Boris BREZILLON <b.brezillon-ZNYIgs0QAGpBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello,

This patch series fixes some errors in the pinctrl drivers:
- typos in dt-binding macros and pinctrl-at91 driver (patch 1)
- fix several at91-pinctrl functions (patch 2 and 3)
- rework the debounce config handling (patches 4)

The last point is the most important one: the at91sam9x5/pio3 controller
does not provide a per pin debounce time config. Instead it provides a
common debounce time for all the pins on a given bank (PIOX).

In this series I proposed 2 solutions to gracefully handle this limitation:
1) Handle debounce time conflicts at config time (PATCH 4/4).
   In other words, all the pins on a given bank using the debounce option must
   use the same debounce time. If a device tries to configure a pin with
   conflicting a debounce time, this will result in an -EINVAL error return
   during the pin configuration.
2) Provide a device tree property to define the default debounce time on a
   given bank (PATCH alt 4/4)


I prefer the first solution, as it provides a more future proof approach:
- the generic pinconf layer provides a per pin debounce time config and if
  we plan to support it we should take this into consideration
- IMHO we should be able to (re)configure the debounce time after bootup and
  the second solution does not provide any way to do this

I might be wrong, so please feel free to share your thoughts about this.

Best Regards,

Boris


Boris BREZILLON (4):
  pinctrl: at91: fix typos
  pinctrl: at91: reset caller's config variable before setting flags
  pinctrl: at91: fix get_debounce/deglitch functions for sam9x5
    controller
  pinctrl: at91: check for debounce time conflicts

 drivers/pinctrl/pinctrl-at91.c     |   60 +++++++++++++++++++++++++++---------
 include/dt-bindings/pinctrl/at91.h |    2 +-
 2 files changed, 46 insertions(+), 16 deletions(-)

-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
