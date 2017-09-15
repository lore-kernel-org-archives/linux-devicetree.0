From: Jules Maselbas <jules.maselbas-l+/54qjP3hgoQXW8ST3Jvw@public.gmane.org>
Subject: [PATCH 0/2] max3421: add devicetree support
Date: Fri, 15 Sep 2017 18:58:44 +0200
Message-ID: <cover.1505492941.git.jules.maselbas@grenoble-inp.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jules Maselbas <jules.maselbas-l+/54qjP3hgoQXW8ST3Jvw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

This patchset adds devicetree support to the max3421 driver.
Thoses modification are based on a previous (unapplied) patch
series by Alexander Amelkin [1].

Since I am not a kernel expert I would a like to have your feedbacks on:
1. Under which condition pdata must be freed (in max3421_probe) ?
2. If it neccessary to free platform_data in max3421_remove function ?

Thank you,

[1]: [https://lkml.org/lkml/2017/5/26/285]

---

Jules Maselbas (2):
  usb: max3421: Add devicetree support
  dt-bindings: max3421: Add bindings documentation

 .../devicetree/bindings/usb/maxim,max3421.txt      | 24 ++++++
 drivers/usb/host/max3421-hcd.c                     | 87 +++++++++++++++++++++-
 2 files changed, 110 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/usb/maxim,max3421.txt

-- 
2.14.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
