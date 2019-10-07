From: Jolly Shah <jolly.shah@xilinx.com>
Subject: [PATCH v2 0/2] drivers: firmware: xilinx: Add support for versal soc
Date: Mon,  7 Oct 2019 11:52:21 -0700
Message-ID: <1570474343-21524-1-git-send-email-jolly.shah@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: ard.biesheuvel@linaro.org, mingo@kernel.org, gregkh@linuxfoundation.org, matt@codeblueprint.co.uk, sudeep.holla@arm.com, hkallweit1@gmail.com, keescook@chromium.org, dmitry.torokhov@gmail.com, michal.simek@xilinx.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: rajanv@xilinx.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Jolly Shah <jolly.shah@xilinx.com>
List-Id: devicetree@vger.kernel.org

Versal is xilinx's next generation soc. This patch adds
driver support required to be compatible with versal device

v2:
  No changes. Resending to include DT maintaners

Jolly Shah (2):
  dt-bindings: firmware: Add bindings for Versal firmware
  drivers: firmware: xilinx: Add support for versal soc

 .../bindings/firmware/xilinx/xlnx,zynqmp-firmware.txt    | 16 +++++++++++++++-
 drivers/firmware/xilinx/zynqmp.c                         |  8 ++++++--
 2 files changed, 21 insertions(+), 3 deletions(-)

-- 
2.7.4
