From: Alexey Firago <alexey_firago-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 0/2] clk: Add support for IDT 5P49V5935
Date: Tue, 4 Apr 2017 16:16:26 +0300
Message-ID: <1491311788-31905-1-git-send-email-alexey_firago@mentor.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Alexey Firago <alexey_firago-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This series adds support for IDT VersaClock 5P49V5935 programmable clock
generator to the existing clk-versaclock5 driver.

Patches were verified on Avnet UltraZed-EG board with IO Carrier Card. 

Alexey Firago (2):
  clk: vc5: Add bindings for IDT VersaClock 5P49V5935
  clk: vc5: Add support for IDT VersaClock 5P49V5935

 .../devicetree/bindings/clock/idt,versaclock5.txt  | 16 +++++--
 drivers/clk/clk-versaclock5.c                      | 50 +++++++++++++++++-----
 2 files changed, 53 insertions(+), 13 deletions(-)

-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
