From: Clement Perrochaud <clement.perrochaud-3arQi8VN3Tc@public.gmane.org>
Subject: [PATCH v3 0/2] NFC: pn544_i2c: Add device-tree support to PN544
Date: Mon, 31 Mar 2014 12:20:13 +0000
Message-ID: <4742358a45e14bfa8725203d119a48bd@AMXPR04MB136.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org" <linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch brings device-tree support to the pn544_i2c device
driver.

It has been successfully tested on a BeagleBone Black board - a
common ARM-Based SoC - both as a module and built-in.
Testing involved enabling and disabling the chip, as well as
reading a Type 4 NFC tag. Firmware download could not be tested
due to issues in the pn544_i2c device driver unrelated to this
patch.

The submission is broken into two patches: the first one for code
itself and the second one for DTS documentation.

It is based on 48761f6db88da9e733e4405ce9842c0769e4d4ac
(NFC: st21nfca: Implement load_session HCI hook) from the nfc-next mast=
er
branch.

Changes from v2:
 - Forgotten documentation patch has been added.
 - pn544_hci_i2c_of_request_resources is now static and takes a struct
i2c_client as argument instead of a struct pn544_i2c_phy.
 - Spacing around operators has been added.
 - Test for device-tree use instead of platform data has been improved.

Changes from v1:
 - Incorrect resource freeing on module removal has been fixed.
 - Compatibility table variable name has been corrected to match
standard pattern.

Cl=E9ment Perrochaud (2):
  NFC: pn544_i2c: Add device-tree (Open Firmware) support to PN544
  NFC: pn544_i2c: Add DTS Documentation

 .../devicetree/bindings/net/nfc/pn544.txt          |  32 ++++
 drivers/nfc/pn544/i2c.c                            | 162 +++++++++++++=
+++++---
 2 files changed, 177 insertions(+), 17 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/nfc/pn544.txt

--=20
1.9.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
