From: Vitor Soares <Vitor.Soares@synopsys.com>
Subject: [PATCH v2 0/5] i3c: remove device if failed on pre_assign_dyn_addr()
Date: Tue,  3 Sep 2019 12:35:49 +0200
Message-ID: <cover.1567437955.git.vitor.soares@synopsys.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-i3c@lists.infradead.org
Cc: bbrezillon@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, pgaj@cadence.com, Joao.Pinto@synopsys.com, Vitor Soares <Vitor.Soares@synopsys.com>
List-Id: devicetree@vger.kernel.org

This patch series remove the devices that fail during
pre_assign_dyn_addr() and were being sent on DEFSVLS command.
With the change above, during the i3c_master_add_i3c_dev_locked() is
necessary to check if the device has i3c_boardinfo and try to assign the
i3c_dev_boardinfo->init_dyn_addr if there no oldev. This change will
allow to describe in DT device with preferable dynamic address but without
static address.

Change in v2:
  - Move out detach/free the i3c_dev_desc from pre_assign_dyn_addr()
  - Change i3c_master_search_i3c_boardinfo(newdev) to
  i3c_master_init_i3c_dev_boardinfo(newdev)
  - Add fixes, stable tags on patch 2
  - Add a note for no guarantee of 'assigned-address' use

Vitor Soares (5):
  i3c: master: detach and free device if pre_assign_dyn_addr() fails
  i3c: master: make sure ->boardinfo is initialized in
    add_i3c_dev_locked()
  dt-bindings: i3c: make 'assigned-address' valid if static address == 0
  dt-bindings: i3c: add a note for no guarantee of 'assigned-address' use
  i3c: master: dw: reattach device on first available location of
    address table

 Documentation/devicetree/bindings/i3c/i3c.txt | 15 ++++++--
 drivers/i3c/master.c                          | 49 ++++++++++++++++++++++-----
 drivers/i3c/master/dw-i3c-master.c            | 16 +++++++++
 3 files changed, 68 insertions(+), 12 deletions(-)

-- 
2.7.4
