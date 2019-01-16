From: Andreas Kemnade <andreas@kemnade.info>
Subject: [PATCH v3 0/6] gnss: sirf: add support for w2sg0004 + lna
Date: Wed, 16 Jan 2019 22:18:06 +0100
Message-ID: <20190116211812.6337-1-andreas@kemnade.info>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: letux-kernel@openphoenux.org, johan@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Andreas Kemnade <andreas@kemnade.info>
List-Id: devicetree@vger.kernel.org

Here is another chapter of the story to get gta04 gnss power
management into the mainline kernel.
There is a w2sg0004 without wakeup line in there, so power state
can only be determined indirectly by looking at the serial data lines.
Then there as also an lna which needs to be powered for real gps
reception.

Changes in v2:
  - do not change behavior of devices with wakeup line
    - do not keep serdev open if runtime is active and device is not used
  - style cleanup
  - locking of sirf_close() vs. gnss_insert_raw()
  - name reordering

Changes in v3:
  - more style cleanup
  - more locking
  - better regulator error handling
  - timeout logic cleaned up and problems documented
  - initial power off sorted out as a separate patch
  - renamed patch gnss: sirf: power on logic for devices without wakeup signal

Andreas Kemnade (6):
  gnss: sirf: write data to gnss only when the gnss device is open
  gnss: sirf: set power state initially off
  gnss: sirf: add support for configurations without wakeup signal
  dt-bindings: gnss: add w2sg0004 compatible string
  gnss: sirf: add a separate supply for a lna
  dt-bindings: gnss: add lna-supply property

 Documentation/devicetree/bindings/gnss/gnss.txt    |   1 +
 .../devicetree/bindings/gnss/sirfstar.txt          |   1 +
 drivers/gnss/sirf.c                                | 204 +++++++++++++++++----
 3 files changed, 175 insertions(+), 31 deletions(-)

-- 
2.11.0
