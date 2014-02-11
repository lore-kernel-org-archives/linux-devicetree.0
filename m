From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: DeviceTree fixes for 3.14
Date: Tue, 11 Feb 2014 09:52:51 -0600
Message-ID: <CAL_JsqLW7YzMTcMw1bMqQ4bJeG6W61GgRNBwCiciyBMW5wU5uQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
Cc: "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Linus,

Please pull DT fixes for 3.14.

Rob

The following changes since commit 38dbfb59d1175ef458d006556061adeaa875=
1b72:

  Linus 3.14-rc1 (2014-02-02 16:42:13 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git
tags/dt-fixes-for-3.14

for you to fetch changes up to 860a445c25aa2f99aa5881603a1f4ed2cec64025=
:

  DT: Add vendor prefix for Spansion Inc. (2014-02-05 10:39:17 -0600)

----------------------------------------------------------------
DeviceTree fixes for 3.14:

- Fix compile error drivers/spi/spi-rspi.c with !CONFIG_OF
- Fix warnings for unused/uninitialized variables with !CONFIG_OF
- Fix PCIe bus matching for powerpc
- Add documentation for various vendor strings

----------------------------------------------------------------
Emilio L=F3pez (1):
      of: add vendor prefix for Allwinner Technology

Geert Uytterhoeven (2):
      of/device: Nullify match table in of_match_device() for CONFIG_OF=
=3Dn
      DT: Add vendor prefix for Spansion Inc.

Heiko Stuebner (1):
      dt-bindings: add vendor-prefix for neonode

Kleber Sacilotto de Souza (1):
      of: fix PCI bus match for PCIe slots

Kumar Gala (1):
      of: Update qcom vendor prefix description

Marek Belisko (1):
      of: add vendor prefix for Honeywell

Rob Herring (1):
      of: restructure for_each macros to fix compile warnings

 .../devicetree/bindings/vendor-prefixes.txt        |   6 +-
 drivers/of/address.c                               |   5 +-
 include/linux/of.h                                 | 153 +++++++++++--=
--------
 include/linux/of_device.h                          |   4 +-
 4 files changed, 95 insertions(+), 73 deletions(-)
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
