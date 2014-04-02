From: Clement Perrochaud <clement.perrochaud-3arQi8VN3Tc@public.gmane.org>
Subject: [PATCH v4 0/2] NFC: pn544_i2c: Add device-tree support to PN544
Date: Wed, 2 Apr 2014 09:01:05 +0000
Message-ID: <060c5ba8ed98462d835a641ce8d83af9@AMXPR04MB136.eurprd04.prod.outlook.com>
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
reading a Type 4 NFC tag. Firmware download has been tested
successfully but was only possible after heavy code modification
out of the scope of this patch.

The submission is broken into two patches: one for code itself and
the second for DTS documentation.

It is based on 48761f6db88da9e733e4405ce9842c0769e4d4ac
(NFC: st21nfca: Implement load_session HCI hook) from the nfc-next mast=
er
branch.

Changes from v3:
 - Better handling of errors in case of absence of both platform-data a=
nd
device-tree.
 - Implementation of Open Firmware interrupts.
 - Modification if the compatible string to fit device-tree guidelines.
 - Modification of the properties to fit device-tree naming conventions=
=2E

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

 .../devicetree/bindings/net/nfc/pn544.txt          |  35 +++++
 drivers/nfc/pn544/i2c.c                            | 148 +++++++++++++=
+++++---
 2 files changed, 166 insertions(+), 17 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/nfc/pn544.txt

--=20
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
