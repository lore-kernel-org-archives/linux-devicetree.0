From: Axel Haslam <ahaslam-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: [RESEND PATCHv3 0/2] regulator: handling of error conditions for usb drivers
Date: Thu, 15 Dec 2016 12:28:54 +0100
Message-ID: <20161215112856.9541-1-ahaslam@baylibre.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, nsekhar-l0cyMroinI0@public.gmane.org, david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Axel Haslam <ahaslam-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Some usb drivers rely on external power switches/regulators
for the port vbus, and some of these drivers are still using
a plain gpio to control the enable and over current
indicator pins.

To make these drivers more generic, we can use a regulator
to handle vbus, and send and over current event, but we are
missing a way to transmit the over current pin status, which
the usb layer may poll at any time.

These patches extend the fixed regulator driver to handle an optional
over current gpio pin.

Changes v3 -> 3.1
* added Acked-by for DT bindings

Changes v2 -> v3
* dropped merged patch to add new API
* rebased on top of regulator-next

Changes v1->v2
* add new API to get error status instead of extending events (Mark)
* use gpiod for fixed regulator: This spears us extra platform
  data and bindings

Axel Haslam (2):
  regulator: fixed: dt: Allow an optional over current pin
  regulator: fixed: Handle optional overcurrent pin

 .../bindings/regulator/fixed-regulator.txt         |  2 +
 drivers/regulator/fixed.c                          | 59 ++++++++++++++++++++++
 2 files changed, 61 insertions(+)

-- 
2.9.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
