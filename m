From: Alexey Firago <alexey_firago-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v2 0/3] clk: Add support for IDT 5P49V5935
Date: Wed, 5 Apr 2017 14:46:56 +0300
Message-ID: <1491392819-698-1-git-send-email-alexey_firago@mentor.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Alexey Firago <alexey_firago-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This series adds support for IDT VersaClock 5P49V5935 programmable clock
generator to the existing clk-versaclock5 driver.

Patches were verified on Avnet UltraZed-EG board with IO Carrier Card.

Changes in V2:
- Introduce vc5_chip_info structure describing chip features
- Set vc5_chip_info for the supported chips using clk_vc5_of_match[].data
- Add 5P49V5935 support using vc5_chip_info approach
- Fix idx comparison in vc5_of_clk_get ('>' to '>=')

Alexey Firago (3):
  clk: vc5: Add structure to describe particular chip features
  clk: vc5: Add bindings for IDT VersaClock 5P49V5935
  clk: vc5: Add support for IDT VersaClock 5P49V5935

 .../devicetree/bindings/clock/idt,versaclock5.txt  | 16 ++++-
 drivers/clk/clk-versaclock5.c                      | 80 +++++++++++++++++-----
 2 files changed, 77 insertions(+), 19 deletions(-)

-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
