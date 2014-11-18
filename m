From: James Hogan <james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v3 0/2] add specified-clock DT binding
Date: Tue, 18 Nov 2014 23:59:45 +0000
Message-ID: <1416355187-11606-1-git-send-email-james.hogan@imgtec.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, James Hogan <james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Resurrecting a year old patchset I'm still interested in, which I didn't
get any review comments for with v2.

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

Changes in v3:
 * Remove unused & unimplemented gpios property. Not sure why it was
   there in the first place.

Changes in v2:
 * Split out bindings patch for ease of review.
 * Rewrite to use a fixed clock instead of an entirely new clock type.
 * Borrow bit-mask and bit-shift bindings from Mike's mux clock binding
   proposals.

James Hogan (2):
  dt: binding: add specified-clock for discoverable rate clocks
  clk-fixed-rate: support specified-clock binding

 .../devicetree/bindings/clock/specified-clock.txt  | 37 ++++++++++++++++
 drivers/clk/clk-fixed-rate.c                       | 51 ++++++++++++++++++++++
 include/linux/clk-provider.h                       |  1 +
 3 files changed, 89 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/specified-clock.txt

-- 
2.0.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
