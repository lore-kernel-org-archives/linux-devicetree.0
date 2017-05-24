From: Sudeep Holla <sudeep.holla@arm.com>
Subject: [PATCH v2 0/6] mailbox: arm_mhu: add support for doorbell mode
Date: Wed, 24 May 2017 11:16:37 +0100
Message-ID: <1495621003-4291-1-git-send-email-sudeep.holla@arm.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, Jassi Brar <jassisinghbrar@gmail.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>, devicetree@vger.kernel.org, Alexey Klimov <alexey.klimov@arm.com>
List-Id: devicetree@vger.kernel.org


Hi,

This series adds doorbell support to ARM MHU mailbox controller driver.
Since we need to callback the different client based on the doorbel bits
triggered from the remote, we can manage with single channel for the set
of 32 doorbells.

Regards,
Sudeep

v1->v2:
	- Removed the notion od subchannels
	- Treat each bit in the MHU register as a doorbell and hence
	  different channel with respect to mailbox framework

v1: https://www.spinics.net/lists/kernel/msg2500461.html

Sudeep Holla (6):
  mailbox: arm_mhu: reorder header inclusion and drop unneeded ones
  Documentation: devicetree: add bindings to support ARM MHU doorbells
  mailbox: arm_mhu: migrate to threaded irq handler
  mailbox: arm_mhu: re-factor data structure to add doorbell support
  mailbox: arm_mhu: add full support for the doorbells
  mailbox: arm_mhu: add support to read and record mbox-name

 .../devicetree/bindings/mailbox/arm-mhu.txt        |  46 ++-
 drivers/mailbox/arm_mhu.c                          | 386 ++++++++++++++++++---
 2 files changed, 383 insertions(+), 49 deletions(-)

--
2.7.4
