From: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: [PATCH v7 0/3] add devicetree support to ath9k
Date: Sun,  2 Oct 2016 23:47:40 +0200
Message-ID: <20161002214743.2263-1-martin.blumenstingl@googlemail.com>
References: <20160906214623.20424-1-martin.blumenstingl@googlemail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160906214623.20424-1-martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: ath9k-devel-xDcbHBWguxHbcTqmT+pZeQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ath9k-devel-A+ZNKFmMK5xy9aJCnZT0Uw@public.gmane.org
Cc: mcgrof-3uybbJdB1yH774rrrx3eTA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, chunkeey-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org, arend.vanspriel-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, julian.calaby-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, bjorn-yOkvZcmFvRU@public.gmane.org, linux-YEK0n+YFykbzxQdaRaTXBw@public.gmane.org, nbd-Vt+b4OUoWG0@public.gmane.org, Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This series adds support for configuring ath9k based devices via
devicetree. This was tested on PCI(e) based devices. This should work
for AHB based devices as well (adding more AHB specific properties may
still be needed) as soon as the ath79 platform is ready to populate the
ath9k wmac via devicetree.

Changes since v6:
- updated documentation to reflect that "reg" is a mandatory attribute
- dropped "qca,clk-25mhz" as it is only useful for AHB devices. OF
  support for AHB devices needs more work, so we can still introduce it
  later
- removed qca,disable-2ghz and qca,disable-5ghz as these will be
  introduced as generic bindings in a separate series


Changes since v5:
- updated the example in the documentation (keeping it at a bare
  minimum: removed the PCI bridge, use a better real-world example with
  less-confusing device/fn numbers, added the actual size of the config
  space to the reg property)


Martin Blumenstingl (3):
  Documentation: dt: net: add ath9k wireless device binding
  ath9k: add a helper to get the string representation of ath_bus_type
  ath9k: parse the device configuration from an OF node

 .../devicetree/bindings/net/wireless/qca,ath9k.txt | 30 ++++++++++++++++
 drivers/net/wireless/ath/ath.h                     |  6 ++++
 drivers/net/wireless/ath/ath9k/init.c              | 42 ++++++++++++++++++++++
 drivers/net/wireless/ath/main.c                    |  7 ++++
 4 files changed, 85 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/wireless/qca,ath9k.txt

-- 
2.10.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
