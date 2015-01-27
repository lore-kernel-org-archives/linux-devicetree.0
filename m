From: Zubair Lutfullah Kakakhel <Zubair.Kakakhel-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 0/3] usb: ohci: jz4740: Add DT support and a fix
Date: Tue, 27 Jan 2015 13:47:16 +0000
Message-ID: <1422366439-34641-1-git-send-email-Zubair.Kakakhel@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org
Cc: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Zubair.Kakakhel-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org
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

ZubairLK

Paul Burton (3):
  dt: usb: jz4740: Add DT binding document for OHCI
  usb: ohci: jz4740: add DT support
  usb: ohci: jz4740: prepare the clock before enabling it

 .../bindings/usb/ingenic,jz47xx-ohci.txt           | 28 ++++++++++++++++++++++
 drivers/usb/host/ohci-jz4740.c                     | 11 ++++++++-
 2 files changed, 38 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/usb/ingenic,jz47xx-ohci.txt

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
