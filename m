From: Nishanth Menon <nm@ti.com>
Subject: [PATCH 0/2] firmware: ti_sci: Add host-id as an optional parameter
Date: Tue, 19 Jun 2018 14:44:19 -0500
Message-ID: <20180619194421.3432-1-nm@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>, Tero Kristo <t-kristo@ti.com>
Cc: Nishanth Menon <nm@ti.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi,

Please find attached series to enable host-id as an optional dt property.

Changes Since RFC:
* Updated commit message based on feedback from Rob.

The series is based on v4.18-rc1 and is available here:
https://github.com/nmenon/linux-2.6-playground/commits/upstream/v4.18-rc1/k3-1-am6-tisci

Consolidated all patches (including all series) are available here:
https://github.com/nmenon/linux-2.6-playground/commits/upstream/v4.18-rc1/k3-am6-integ

Full Boot log (integrated of all series for AM654) is available here:
   https://pastebin.ubuntu.com/p/bBFmnzYtCd/

Nishanth Menon (2):
  Documentation: dt: keystone: ti-sci: Add optional host-id parameter
  firmware: ti_sci: Provide host-id as an optional dt parameter

 .../devicetree/bindings/arm/keystone/ti,sci.txt    |  4 ++++
 drivers/firmware/ti_sci.c                          | 24 ++++++++++++++++++----
 2 files changed, 24 insertions(+), 4 deletions(-)

-- 
2.15.1
