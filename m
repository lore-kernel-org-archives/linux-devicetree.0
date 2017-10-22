From: Serge Semin <fancer.lancer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 00/10 v3] usb: usb251xb: Add USB2517i hub support and fix some bugs
Date: Sun, 22 Oct 2017 23:38:02 +0300
Message-ID: <20171022203812.9379-1-fancer.lancer@gmail.com>
References: <20170916104220.3742-1-fancer.lancer@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170916104220.3742-1-fancer.lancer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: richard.leitner-WcANXNA0UjBBDgjK7y7TUQ@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org
Cc: Sergey.Semin-vHJ8rsvMqnUPfZBKTuL5GA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Serge Semin <fancer.lancer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Primarily it was intended to just add USB2517 hub support to the driver.
But after tests a bug and inconistency were discovered. So it was decided
to make the following changes:

Changelog v1:
- Add USB2517/i hub specifics support to the driver
- Fix property_u32 NULL-pointer dereference
- Add new {bus,self}-max-{power,curret} dts properties
- Replace legacy GPIO API usage with descriptor-based one

Changelog v2:
- Split first patch into smaller ones
- Fix invalid BOOST_14 register definition
- Combine copyrights adding patch into the last one

Changelog v3:
- Move bindings documentation updates to a separate patch
- Add "boolean" info to the corresponding properties
- Rename {sp,bp}-max-{power,current} with a better readable
{sp,bp}-max-{total,removable}-current-microamp
- Discard Copyright line
- Add better reason text for dev_warn()'s
- Set led-speed-mode being default
- Fix some types

Serge Semin (10):
  usb: usb251xb: Update usb251xb bindings
  usb: usb251xb: Add USB2517i specific struct and IDs
  usb: usb251xb: Add USB251x specific port count setting
  usb: usb251xb: Add 5,6,7 ports mapping def setting
  usb: usb251xb: Add 5,6,7 ports boost settings
  usb: usb251xb: Add battery enable setting flag
  usb: usb251xb: Add USB2517 LED settings
  usb: usb251xb: Fix property_u32 NULL pointer dereference
  usb: usb251xb: Add max power/current dts property support
  usb: usb251xb: Use GPIO descriptor consumer interface

 .../devicetree/bindings/usb/usb251xb.txt |  46 ++++--
 kernel/drivers/usb/misc/Kconfig          |   4 +-
 kernel/drivers/usb/misc/usb251xb.c       | 166 +++++++++++++++------
 3 files changed, 158 insertions(+), 58 deletions(-)

-- 
2.12.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
