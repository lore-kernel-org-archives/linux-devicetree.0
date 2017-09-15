From: Serge Semin <fancer.lancer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 0/5] usb: usb251xb: Add USB2517i hub support and fix some bugs
Date: Sat, 16 Sep 2017 02:31:08 +0300
Message-ID: <20170915233113.17855-1-fancer.lancer@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: richard.leitner-WcANXNA0UjBBDgjK7y7TUQ@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org
Cc: Sergey.Semin-vHJ8rsvMqnUPfZBKTuL5GA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Serge Semin <fancer.lancer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Primarily it was intended to just add USB2517 hub support to the driver.
But after tests a bug and inconistency were discovered. So it was decided
to perform following changes:

Changelog v1:
- Add USB2517/i hub specifics support to the driver
- Fix property_u32 NULL-pointer dereference
- Add new {bus,self}-max-{power,curret} dts properties
- Replace legacy GPIO API usage with descriptor-based one

Serge Semin (5):
  usb: usb251xb: Add USB2517/i hub support
  usb: usb251xb: Fix property_u32 NULL pointer dereference
  usb: usb251xb: Add max power/current dts nodes
  usb: usb251xb: Use GPIO descriptor consumer interface
  usb: usb251xb: Add copyrights

 Documentation/devicetree/bindings/usb/usb251xb.txt |  12 +-
 drivers/usb/misc/usb251xb.c                        | 154 +++++++++++++++------
 2 files changed, 123 insertions(+), 43 deletions(-)

-- 
2.12.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
