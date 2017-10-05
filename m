From: Phil Reid <preid-qgqNFa1JUf/o2iN0hyhwsIdd74u8MsAO@public.gmane.org>
Subject: [PATCH 0/2] gpio: mcp32s08: add support for mcp23018
Date: Thu,  5 Oct 2017 09:23:33 +0800
Message-ID: <1507166615-4530-1-git-send-email-preid@electromag.com.au>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, preid-qgqNFa1JUf/o2iN0hyhwsIdd74u8MsAO@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

This adds the required definitions for the mcp23018 which is the i2c
variant of the mcp23s18.


Phil Reid (2):
  gpio: dt-bindings: add mcp23018 to mcp23s08 documentation
  gpio: mcp32s08: add support for mcp23018

 Documentation/devicetree/bindings/gpio/gpio-mcp23s08.txt |  1 +
 drivers/gpio/gpio-mcp23s08.c                             | 15 ++++++++++++++-
 2 files changed, 15 insertions(+), 1 deletion(-)

-- 
1.8.3.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
