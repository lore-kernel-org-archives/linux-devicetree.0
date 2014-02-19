From: Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH RFC v1 0/3] clk: Support for DT assigned clk parent and rate
Date: Wed, 19 Feb 2014 17:58:41 +0100
Message-ID: <1392829124-25705-1-git-send-email-s.nawrocki@samsung.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, sw0312.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch set implements setting of parent clocks and clock frequencies
before a driver is bound to the device.  This is only for booting with the 
device tree case and the parent/rate configuration is supposed to be 
specified according to the DT binding previously discussed [1].

Patch 1/3 adds a variant of of_clk_get() function which accepts name of a DT 
property containing list of phandle to a clock controller node and the clock 
specifier pairs, as opposed to hard coded "clocks" property name in 
of_clk_get().  Any better names for the function are welcome.

Patch 2/3 just adds a macro definition for maximum length of a DT property 
name.  I couldn't find any already available and there are places where plain 
numbers are used.

Patch 3/3 actually adds the code parsing device nodes for related DT 
properties and performing re-parenting and/or clock frequency setting 
as required.

I wasn't sure whether it should be done in a notifier like this, or perhaps 
there should be direct calls added into driver core (similarly to pinctrl). 
So any errors can be passed up to the callers and driver probe can be retried, 
should it happen any required clocks are not yet available at probe() call 
time.

[1] http://www.spinics.net/lists/arm-kernel/msg302226.html

Sylwester Nawrocki (3):
  clk: Add function to parse an arbitrary clocks list property
  of: Add definition of maximum length of a property name
  clk: Add handling of clk parent and rate assigned from DT

 .../devicetree/bindings/clock/clock-bindings.txt   |   24 +++++
 drivers/clk/clk.c                                  |   92 ++++++++++++++++++++
 drivers/clk/clk.h                                  |    3 +
 drivers/clk/clkdev.c                               |   25 +++++-
 include/linux/of.h                                 |    3 +
 5 files changed, 143 insertions(+), 4 deletions(-)

-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
