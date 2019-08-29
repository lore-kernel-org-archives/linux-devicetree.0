From: Vitor Soares <Vitor.Soares@synopsys.com>
Subject: [PATCH 0/4] i3c: remove device if failed on pre_assign_dyn_addr()
Date: Thu, 29 Aug 2019 12:19:31 +0200
Message-ID: <cover.1567071213.git.vitor.soares@synopsys.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-i3c@lists.infradead.org
Cc: bbrezillon@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, Joao.Pinto@synopsys.com, Vitor Soares <Vitor.Soares@synopsys.com>
List-Id: devicetree@vger.kernel.org

This patch series remove the devices that fail during
pre_assign_dyn_addr() and were being sent on DEFSVLS command.
With the change above, during the i3c_master_add_i3c_dev_locked() is
necessary to check if the device has i3c_boardinfo and try to assign the
i3c_dev_boardinfo->init_dyn_addr if there no oldev. This change will
allow to describe in DT device with preferable dynamic address but without
static address.

Vitor Soares (4):
  "i3c: detach and free device if pre_assign_dyn_addr fails "
  i3c: check i3c_boardinfo during i3c_master_add_i3c_dev_locked
  update i3c bingins
  i3c: master: dw: Reattach device on first empty location of DAT

 Documentation/devicetree/bindings/i3c/i3c.txt | 13 ++++++++---
 drivers/i3c/master.c                          | 33 ++++++++++++++++++++++++---
 drivers/i3c/master/dw-i3c-master.c            | 16 +++++++++++++
 3 files changed, 56 insertions(+), 6 deletions(-)

-- 
2.7.4
