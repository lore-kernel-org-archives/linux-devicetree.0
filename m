From: Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH v4 0/3] usb: renesas_usbhs: More compat strings
Date: Wed, 16 Dec 2015 13:51:49 +0900
Message-ID: <1450241512-24699-1-git-send-email-horms+renesas@verge.net.au>
Return-path: <linux-sh-owner@vger.kernel.org>
Sender: linux-sh-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Magnus Damm <magnus.damm@gmail.com>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-sh@vger.kernel.org, Simon Horman <horms+renesas@verge.net.au>
List-Id: devicetree@vger.kernel.org


Hi,

this short series adds generic, and soc-specific r8a7792 and r8a7793 compat
strings to the Renesas USBHS driver. The intention is to provide a complete
set of compat strings for known R-Car SoCs.

Changes since v3:
* State that one or more compat string should be used

Changes since v2:
* Split documentation of SoC names into separate patch
* Use correct fallback compatibility string in example

Changes since v1:
* Add R-Car Gen2 and Gen3 fallback compatibility strings rather than
a single compatibility string for all of R-Car.

Simon Horman (3):
  usb: renesas_usbhs: add SoC names to compatibility string
    documentation
  usb: renesas_usbhs: add fallback compatibility strings
  usb: renesas_usbhs: add device tree support for r8a779[23]

 .../devicetree/bindings/usb/renesas_usbhs.txt      | 22 ++++++++++++++++------
 drivers/usb/renesas_usbhs/common.c                 |  9 +++++++++
 2 files changed, 25 insertions(+), 6 deletions(-)

-- 
2.1.4

