From: Andy Shevchenko <andriy.shevchenko-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: [PATCH v1] auxdisplay: Move arm-charlcd binding to correct folder
Date: Wed, 31 Jan 2018 16:02:55 +0200
Message-ID: <20180131140255.50268-1-andriy.shevchenko@linux.intel.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Miguel Ojeda Sandonis <miguel.ojeda.sandonis-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Andy Shevchenko <andriy.shevchenko-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This is a follow up to the commit

  00846a4425d3 ("auxdisplay: Move arm-charlcd.c to drivers/auxdisplay folder")

for Device Tree binding.

No functional change.

Signed-off-by: Andy Shevchenko <andriy.shevchenko-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
---
 Documentation/devicetree/bindings/{misc => auxdisplay}/arm-charlcd.txt | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename Documentation/devicetree/bindings/{misc => auxdisplay}/arm-charlcd.txt (100%)

diff --git a/Documentation/devicetree/bindings/misc/arm-charlcd.txt b/Documentation/devicetree/bindings/auxdisplay/arm-charlcd.txt
similarity index 100%
rename from Documentation/devicetree/bindings/misc/arm-charlcd.txt
rename to Documentation/devicetree/bindings/auxdisplay/arm-charlcd.txt
-- 
2.15.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
