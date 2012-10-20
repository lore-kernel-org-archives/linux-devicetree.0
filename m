From: Tony Prisk <linux-ci5G2KO2hbZ+pU9mqzGVBQ@public.gmane.org>
Subject: [PATCH v2 0/2] Update ehci-platform driver to support devicetree
Date: Sun, 21 Oct 2012 11:10:30 +1300
Message-ID: <1350771032-11527-1-git-send-email-linux@prisktech.co.nz>
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Florian Fainelli <florian-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Tony Prisk <linux-ci5G2KO2hbZ+pU9mqzGVBQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patchset updates the ehci-platform.c driver to allow device tree probing.
I have dropped support for the three function pointers (power_on, power_off
and power_suspend). If someone has knowledge of the power sequence functions
that are being implemented, these functions could be replaced (Sorry, I don't
know anything about implementing it).

port_power_(on_off) properties are not supported in DT as Alan Stern indicated
they are going to be removed.

v2:
* Add error checking for pdata memory allocation, and memory freeing in remove()

* Add no_io_watchdog field to usb_ehci_pdata as required by Florian Fainelli's
upcoming patchset and DT parsing for the field. This means we don't need to
patch this driver again after applying Florian's patchset, but will create a
minor merge-conflict.

* Changed compatible string to 'linux,ehci-platform' as a lot of the DT
properties are linux-specific.

* Changed properties to match those expected in usb-ehci binding.


Tony Prisk (2):
  USB: Update EHCI-platform driver to devicetree.
  USB: doc: Binding document for ehci-platform driver

 .../devicetree/bindings/usb/ehci-platform.txt      |   27 ++++
 drivers/usb/host/ehci-hcd.c                        |    5 -
 drivers/usb/host/ehci-platform.c                   |   61 ++++++-
 drivers/usb/host/ehci-vt8500.c                     |  171 --------------------
 include/linux/usb/ehci_pdriver.h                   |    1 +
 5 files changed, 88 insertions(+), 177 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/usb/ehci-platform.txt
 delete mode 100644 drivers/usb/host/ehci-vt8500.c

-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
