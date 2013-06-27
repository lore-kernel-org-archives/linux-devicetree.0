From: Tero Kristo <t-kristo@ti.com>
Subject: [PATCH 0/4] ARM: OMAP5 and DRA7 clock data
Date: Thu, 27 Jun 2013 11:38:15 +0300
Message-ID: <1372322299-25046-1-git-send-email-t-kristo@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-omap-owner@vger.kernel.org>
Sender: linux-omap-owner@vger.kernel.org
To: linux-omap@vger.kernel.org, paul@pwsan.com, tony@atomide.com, mturquette@linaro.org, nm@ti.com, rnayak@ti.com
Cc: linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

Hi,

These patches provide clock data for TI OMAP5 and DRA7 SoCs. Clock data
is mostly in device tree format, and only a small init portion is needed
under mach-omap2. These patches come on top of the base OMAP4 clock data
conversion I posted earlier this week:

  http://comments.gmane.org/gmane.linux.ports.arm.omap/100117

These patches need the basic SoC boot support before they are of any use.

Boot tested with private tree and compile tested against 3.10-rc6.

-Tero

