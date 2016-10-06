From: Robin van der Gracht <robin-/Q/L1SwJa3aEVqv0pETR8A@public.gmane.org>
Subject: [PATCH v7 0/3] auxdisplay: Introduce ht16k33 driver
Date: Thu,  6 Oct 2016 13:53:30 +0200
Message-ID: <1475754813-1200-1-git-send-email-robin@protonic.nl>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Miguel Ojeda Sandonis <miguel.ojeda.sandonis-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Robin van der Gracht <robin-/Q/L1SwJa3aEVqv0pETR8A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patchset adds a new driver to the auxdisplay subsystem. It also adds
devicetree binding documentation and a new vendor prefix.

I added myself as maintainer to the MAINTAINERS file.

@Greg: Would you like to review and push this upstream?

Robin van der Gracht (3):
  of: add vendor prefix for Holtek Semiconductor
  auxdisplay: ht16k33: Driver for LED controller
  MAINTAINERS: auxdisplay: Added myself as maintainer for ht16k33 driver

 .../devicetree/bindings/display/ht16k33.txt        |  42 ++
 .../devicetree/bindings/vendor-prefixes.txt        |   1 +
 MAINTAINERS                                        |   6 +
 drivers/auxdisplay/Kconfig                         |   9 +
 drivers/auxdisplay/Makefile                        |   1 +
 drivers/auxdisplay/ht16k33.c                       | 563 +++++++++++++++++++++
 6 files changed, 622 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/ht16k33.txt
 create mode 100644 drivers/auxdisplay/ht16k33.c

-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
