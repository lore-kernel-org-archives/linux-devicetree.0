From: Jules Maselbas <jules.maselbas-l+/54qjP3hgoQXW8ST3Jvw@public.gmane.org>
Subject: [PATCH v3 0/2] max3421: add devicetree support
Date: Tue, 24 Oct 2017 01:08:41 +0200
Message-ID: <cover.1508798984.git.jules.maselbas@grenoble-inp.org>
References: <cover.1508108927.git.jules.maselbas@grenoble-inp.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1508108927.git.jules.maselbas-l+/54qjP3hgoQXW8ST3Jvw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org
Cc: robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, julia.lawall-L2FTfq7BK8M@public.gmane.org, sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jules Maselbas <jules.maselbas-l+/54qjP3hgoQXW8ST3Jvw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

This patchset adds devicetree support to the max3421 driver.
Theses modification are based on a previous (unapplied) patch
series by Alexander Amelkin [1].

Changes in v3:
 * Documentation modification, interrupt-parent is optional.

Changes in v2:
 * The platform_data is no longer freed in max3421_remove() as it is
   allocated with devm_kzalloc.
 * Removed the dev_err print if devm_kzalloc fail.
 * Removed a test for platform_data null pointer in max3421_hub_control()
   as the driver probe will fail if no platform_data is found.

Thank you.

[1]: [https://lkml.org/lkml/2017/5/26/285]

---

Jules Maselbas (2):
  usb: max3421: Add devicetree support
  dt-bindings: max3421: Add bindings documentation

 .../devicetree/bindings/usb/maxim,max3421.txt      | 25 ++++++++
 drivers/usb/host/max3421-hcd.c                     | 75 +++++++++++++++++++++-
 2 files changed, 99 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/usb/maxim,max3421.txt

-- 
2.14.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
