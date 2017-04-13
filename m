From: Sebastian Reichel <sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCHv4 0/2] Nokia H4+ support
Date: Thu, 13 Apr 2017 02:26:57 +0200
Message-ID: <20170413002659.25821-1-sre@kernel.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sebastian Reichel <sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Marcel Holtmann <marcel-kz+m5ild9QBg9hUCZPvPmw@public.gmane.org>, Gustavo Padovan <gustavo-THi1TnShQwVAfugRpC6u6w@public.gmane.org>, Johan Hedberg <johan.hedberg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>, linux-bluetooth-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

Here is the fourth revision of the nokia bluetooth patchset. Compared
to the previous one the following things have changed:

 * Drop patch 1-8 (applied by Marcel) and update Cc/To for patchset
 * Order includes in the driver alphabetically
 * Explicitly include <linux/of.h> in the nokia bluetooth driver

-- Sebastian

Sebastian Reichel (2):
  dt-bindings: net: bluetooth: Add nokia-bluetooth
  Bluetooth: add nokia driver

 .../devicetree/bindings/net/nokia-bluetooth.txt    |  51 ++
 drivers/bluetooth/Kconfig                          |  12 +
 drivers/bluetooth/Makefile                         |   2 +
 drivers/bluetooth/hci_nokia.c                      | 820 +++++++++++++++++++++
 4 files changed, 885 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/nokia-bluetooth.txt
 create mode 100644 drivers/bluetooth/hci_nokia.c

-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
