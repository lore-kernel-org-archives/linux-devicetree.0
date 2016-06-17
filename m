From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH V3 0/4] clk: Combine MAX77686 and MAX77802 driver and extend for MAX77620
Date: Fri, 17 Jun 2016 16:21:03 +0530
Message-ID: <1466160667-28451-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The clock IP used on the Maxim PMICs max77686 and max77802 are
same. The configuration of clock register is also same except
the number of clocks.
    
Part of common code utilisation, there is 3 files for these chips
clock driver, one for common and two files for driver registration.
    
Combine both drivers into single file and move common code into
same common file reduces the 2 files and make max77686 and max77802
clock driver in single fine. This driver does not depends on the
parent driver structure. The regmap handle is acquired through
regmap APIs for the register access.

After comining the driver and DT files, extend the support to MAX77620.


This series is based on discussion from the series
	clk: max77620: Add clock driver for MAX77620/MAX20024
On this series, it is proposed to combine all files together.

Changes form V1:
- Incorporated all review comment.
- Collected Testedby/reviewed by.

Changes from V2:
- Nit fixes and colleced all RB/TB

Laxman Dewangan (4):
  clk: max77686: Combine Maxim max77686 and max77802 driver
  clk: Combine DT binding doc for max77686 and max77802
  clk: max77686: Add DT binding details for PMIC MAX77620
  clk: max77686: Add support for MAX77620 clocks

 .../devicetree/bindings/clock/maxim,max77686.txt   | 118 ++++++++--
 .../devicetree/bindings/clock/maxim,max77802.txt   |  44 ----
 drivers/clk/Kconfig                                |  18 +-
 drivers/clk/Makefile                               |   2 -
 drivers/clk/clk-max-gen.c                          | 194 ---------------
 drivers/clk/clk-max-gen.h                          |  32 ---
 drivers/clk/clk-max77686.c                         | 262 ++++++++++++++++++++-
 drivers/clk/clk-max77802.c                         |  96 --------
 include/dt-bindings/clock/maxim,max77620.h         |  21 ++
 9 files changed, 368 insertions(+), 419 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/maxim,max77802.txt
 delete mode 100644 drivers/clk/clk-max-gen.c
 delete mode 100644 drivers/clk/clk-max-gen.h
 delete mode 100644 drivers/clk/clk-max77802.c
 create mode 100644 include/dt-bindings/clock/maxim,max77620.h

-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
