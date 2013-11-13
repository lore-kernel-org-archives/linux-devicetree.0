From: James Hogan <james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v2 0/2] add specified-clock DT binding
Date: Wed, 13 Nov 2013 21:49:58 +0000
Message-ID: <1384379400-24776-1-git-send-email-james.hogan@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-metag-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-metag-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-metag-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, James Hogan <james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The frequency of some fixed rate external oscillators on some SoCs (for
example TZ1090's XTAL1) are specified by the board using pull-ups and
pull-downs of configuration pins which are automatically latched on
reset and available in an SoC register, so that the boot ROM and OS can
automatically discover it.

The first patch adds a separate binding for these clocks to describe how
to discover the frequency. I could easily have extended the fixed-rate
binding instead, but there'd be no properties in common except the
standard common clock properties so it seemed like it deserved a
separate binding. I'm open to arguments to the contrary or better
compatible string names though.

The second patch implements the binding, which sets up a normal fixed
rate clock just like the normal fixed-clock binding except it discovers
the frequency instead of using the clock-frequency property.

Changes in v2:
 * Split out bindings patch for ease of review.
 * Rewrite to use a fixed clock instead of an entirely new clock type.
 * Borrow bit-mask and bit-shift bindings from Mike's mux clock binding
   proposals.

James Hogan (2):
  dt: binding: add specified-clock for discoverable rate clocks
  clk-fixed-rate: support specified-clock binding

 .../devicetree/bindings/clock/specified-clock.txt  | 38 ++++++++++++++++
 drivers/clk/clk-fixed-rate.c                       | 51 ++++++++++++++++++++++
 include/linux/clk-provider.h                       |  1 +
 3 files changed, 90 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/specified-clock.txt

-- 
1.8.1.2


--
To unsubscribe from this list: send the line "unsubscribe linux-metag" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
