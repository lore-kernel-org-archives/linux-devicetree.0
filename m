From: Jolly Shah <jolly.shah@xilinx.com>
Subject: [PATCH 0/2] Rename dt header and move clock binding
Date: Wed, 27 Feb 2019 12:51:08 -0800
Message-ID: <1551300670-6949-1-git-send-email-jollys@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org
Cc: michal.simek@xilinx.com, rajanv@xilinx.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Jolly Shah <jollys@xilinx.com>
List-Id: devicetree@vger.kernel.org

This patchset renames clock dt include file to align with other incldues.
Other patch moves clock binding to a separate file under clock directory to
align with other firmware child binding documenetation.

Jolly Shah (1):
  include: dt-binding: clock: Rename zynqmp header file

Rajan Vaja (1):
  dt-bindings: xilinx: Separate clock binding from firmware doc

 .../devicetree/bindings/clock/xlnx,zynqmp-clk.txt  |  63 +++++++++++
 .../firmware/xilinx/xlnx,zynqmp-firmware.txt       |  54 +--------
 include/dt-bindings/clock/xlnx,zynqmp-clk.h        | 116 -------------------
 include/dt-bindings/clock/xlnx-zynqmp-clk.h        | 126 +++++++++++++++++++++
 4 files changed, 190 insertions(+), 169 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/xlnx,zynqmp-clk.txt
 delete mode 100644 include/dt-bindings/clock/xlnx,zynqmp-clk.h
 create mode 100644 include/dt-bindings/clock/xlnx-zynqmp-clk.h

-- 
2.7.4
