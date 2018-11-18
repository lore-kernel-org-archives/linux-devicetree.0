From: Andreas Kemnade <andreas@kemnade.info>
Subject: [PATCH 0/5] gnss: sirf: add support for w2sg0004 + lna
Date: Sun, 18 Nov 2018 22:57:56 +0100
Message-ID: <20181118215801.12280-1-andreas@kemnade.info>
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
reception. That part needs probably more discussion, since it might
be an idea to have it more generalized since it has nothing todo
with the chip itself.
I marked the corresponding patches as RFC. The support for
the w2sg0004 without wakeup can imho go in without the lna first
because users of that chip without an additional lna power supply
can already benefit from it if we should do more discussion first.
I just kept them together so that the full picture can be seen.

Andreas Kemnade (5):
  gnss: sirf: write data to gnss only when the gnss device is open
  gnss: sirf: power on logic for devices without wakeup signal
  dt-bindings: gnss: add w2sg0004 compatible string
  gnss: sirf: add a separate supply for a lna
  dt-bindings: gnss: add lna-supply property

 .../devicetree/bindings/gnss/sirfstar.txt          |   2 +
 drivers/gnss/sirf.c                                | 126 +++++++++++++++------
 2 files changed, 96 insertions(+), 32 deletions(-)

-- 
2.11.0
