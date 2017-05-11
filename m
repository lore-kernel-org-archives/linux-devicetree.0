From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH for 4.13 0/5] phy: bcm-ns-usb3: add MDIO driver
Date: Thu, 11 May 2017 15:29:20 +0200
Message-ID: <20170511132925.14564-1-zajec5@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
Cc: Yendapally Reddy Dhananjaya Reddy <yendapally.reddy-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Jon Mason <jonmason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Rafał Miłecki <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>

As explained in the commit 9200c6f177638 ("Revert "phy: Add USB3 PHY support
for Broadcom NSP SoC"") this module should be modified to use MDIO bus as
this is how PHY is really attached.

This should allow reusing this driver on NSP and any other platform with
MDIO bus and this particular PHY.

This is material for the next merge window (4.13 kernel) obviously.

Rafał Miłecki (5):
  phy: bcm-ns-usb3: always wait for idle after writing to the PHY reg
  phy: bcm-ns-usb3: use pointer for PHY writing function
  phy: bcm-ns-usb3: enable MDIO in the platform specific code
  dt-bindings: phy: Modify Broadcom NS USB 3.0 PHY binding to use MDIO
  phy: bcm-ns-usb3: add MDIO driver using proper bus layer

 .../devicetree/bindings/phy/bcm-ns-usb3-phy.txt    |  27 ++-
 drivers/phy/Kconfig                                |   1 +
 drivers/phy/phy-bcm-ns-usb3.c                      | 223 +++++++++++++++------
 3 files changed, 179 insertions(+), 72 deletions(-)

-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
