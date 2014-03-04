From: Tero Kristo <t-kristo@ti.com>
Subject: [PATCHv2 00/14]: ARM: OMAP2: clock DT conversion
Date: Tue, 4 Mar 2014 11:18:06 +0200
Message-ID: <1393924700-6510-1-git-send-email-t-kristo@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-omap-owner@vger.kernel.org>
Sender: linux-omap-owner@vger.kernel.org
To: linux-omap@vger.kernel.org, tony@atomide.com, nm@ti.com, mturquette@linaro.org, paul@pwsan.com
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi,

Changes compared to v1:
- fixed OMAP2 only build issues
- fixed OMAP2420 boot issues
- added patch #13 and #14 to remove legacy clock data for OMAP2/OMAP3
- fixed smatch + DT bindings documentation problems reported by Nishanth

This set is un-tested on OMAP2 hardware as I don't have access to any. So,
any testing feedback welcome.

Test branch available:
tree: https://github.com/t-kristo/linux-pm.git
branch: 3.14-rc4-omap2-dt-clks-v2

-Tero

