From: Arun Kumar K <arun.kk@samsung.com>
Subject: [PATCH] Add MFC device tree support
Date: Thu, 25 Oct 2012 14:54:13 +0530
Message-ID: <1351157054-19428-1-git-send-email-arun.kk@samsung.com>
Return-path: <linux-media-owner@vger.kernel.org>
Sender: linux-media-owner@vger.kernel.org
To: linux-media@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
Cc: k.debski@samsung.com, jtp.park@samsung.com, s.nawrocki@samsung.com, ch.naveen@samsung.com, arun.kk@samsung.com, joshi@samsung.com
List-Id: devicetree@vger.kernel.org

This patch adds device tree support for MFC driver.
The arch side patch for Exynos5250 adding MFC DT node
is applied to linux-samsung tree. [1]

[1]http://www.mail-archive.com/linux-samsung-soc@vger.kernel.org/msg12672.html

Arun Kumar K (1):
  s5p-mfc: Add device tree support

 drivers/media/platform/s5p-mfc/s5p_mfc.c |  100 +++++++++++++++++++++++++-----
 1 files changed, 84 insertions(+), 16 deletions(-)
