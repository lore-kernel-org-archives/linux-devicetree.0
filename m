From: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
Subject: [PATCH_V2 0/3] usb: ohci: jz4740: Add DT support and a fix
Date: Tue, 27 Jan 2015 14:02:33 +0000
Message-ID: <1422367356-38012-1-git-send-email-Zubair.Kakakhel@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: stern@rowland.harvard.edu
Cc: gregkh@linuxfoundation.org, lars@metafoo.de, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, Zubair.Kakakhel@imgtec.com
List-Id: devicetree@vger.kernel.org

Hi,

Here are a few simple patches for the jz4740.

First adds a simple DT binding.
Seconds adds DT support.
Third is a minor fix in clock enabling.

Patches are based on 3.19-rc6. Quite disjoint and stay within jz4740 
so should apply easily on other trees.

If you would like to have them rebased to a different tree, please tell.

Thank-you

V2 changes
Removed an interrupt parent binding. Forgot a binding
Unprepared clock when disabling

ZubairLK

Paul Burton (3):
  dt: usb: jz4740: Add DT binding document for OHCI
  usb: ohci: jz4740: add DT support
  usb: ohci: jz4740: prepare the clock before enabling it

 .../bindings/usb/ingenic,jz47xx-ohci.txt           | 26 ++++++++++++++++++++++
 drivers/usb/host/ohci-jz4740.c                     | 15 ++++++++++---
 2 files changed, 38 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/usb/ingenic,jz47xx-ohci.txt

-- 
1.9.1
