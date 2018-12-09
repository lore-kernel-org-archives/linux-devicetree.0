From: Andreas Kemnade <andreas@kemnade.info>
Subject: [PATCH v2 0/5] gnss: sirf: add support for w2sg0004 + lna
Date: Sun,  9 Dec 2018 20:51:45 +0100
Message-ID: <20181209195150.5192-1-andreas@kemnade.info>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: johan@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Discussions about the Letux Kernel <letux-kernel@openphoenux.org>
Cc: Andreas Kemnade <andreas@kemnade.info>
List-Id: devicetree@vger.kernel.org

Here is another chapter of the story to get gta04 gnss power
management into the mainline kernel.
There is a w2sg0004 without wakeup line in there, so power state
can only be determined indirectly by looking at the serial data lines.
Then there as also an lna which needs to be powered for real gps
reception.

Depends on:
  gnss: sirf: fix activation retry handling

Changes in v2:
  - do not change behavior of devices with wakeup line
    - do not keep serdev open if runtime is active and device is not used
  - style cleanup
  - locking of sirf_close() vs. gnss_insert_raw()
  - name reordering

Andreas Kemnade (5):
  gnss: sirf: write data to gnss only when the gnss device is open
  gnss: sirf: power on logic for devices without wakeup signal
  dt-bindings: gnss: add w2sg0004 compatible string
  gnss: sirf: add a separate supply for a lna
  dt-bindings: gnss: add lna-supply property

 .../devicetree/bindings/gnss/sirfstar.txt          |   2 +
 drivers/gnss/sirf.c                                | 158 ++++++++++++++++++---
 2 files changed, 137 insertions(+), 23 deletions(-)

-- 
2.11.0
