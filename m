From: Heiko =?utf-8?q?St=C3=BCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH v2 0/5] pinctrl: rockchip: add rk3188 support
Date: Wed, 16 Oct 2013 01:06:42 +0200
Message-ID: <201310160106.42329.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

A patch series, finalizing support for the pin controller in the  rk3188.

As mentioned in the individual patches, the rk3188 makes it even more
complex due to its strange pull setting configuration. Therefore a bit
of reordering needed to take place to accomodate this.

changes since v1:
- remove the of_device_is_any_of nonsense, as of_match_node is perfectly
  capable to reach the same goal, as pointed out by Mark Rutland

Heiko Stuebner (5):
  pinctrl: rockchip: separate different sub-types more
  pinctrl: rockchip: add support for multiple bank types
  pinctrl: rockchip: remove redundant check
  pinctrl: rockchip: add rk3188 specifics
  pinctrl: rockchip: emulate both edge triggered interrupts

 .../bindings/pinctrl/rockchip,pinctrl.txt          |   46 ++-
 drivers/pinctrl/pinctrl-rockchip.c                 |  292 +++++++++++++++-----
 2 files changed, 274 insertions(+), 64 deletions(-)

-- 
1.7.10.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
