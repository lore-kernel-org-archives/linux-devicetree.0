From: Dhaval Shah <dhaval.shah@xilinx.com>
Subject: [PATCH v3 0/2] Documentation and driver of logicoreIP
Date: Wed, 13 Dec 2017 21:55:18 -0800
Message-ID: <1513230920-9005-1-git-send-email-dshah@xilinx.com>
References: <200703.nxabyfcjbswwbp4v@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <200703.nxabyfcjbswwbp4v@rob-hp-laptop>
Sender: linux-kernel-owner@vger.kernel.org
To: arnd@arndb.de, gregkh@linuxfoundation.org, pombredanne@nexb.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, michal.simek@xilinx.com, hyunk@xilinx.com, Dhaval Shah <dshah@xilinx.com>
List-Id: devicetree@vger.kernel.org

1st patch provide Device Tree binding document for logicoreIP
2nd patch provide the xlnx_vcu logicoreIP driver, Kconfig changes
and Makefile changes for the driver.

Dhaval Shah (2):
  Documentation: devicetree: Add DT bindings to xlnx_vcu driver
  misc: Add Xilinx ZYNQMP VCU logicoreIP init driver

 .../devicetree/bindings/misc/xlnx,vcu.txt          |  31 +
 drivers/misc/Kconfig                               |  15 +
 drivers/misc/Makefile                              |   1 +
 drivers/misc/xlnx_vcu.c                            | 629 +++++++++++++++++++++
 4 files changed, 676 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/misc/xlnx,vcu.txt
 create mode 100644 drivers/misc/xlnx_vcu.c

-- 
2.7.4
