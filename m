From: Michal Simek <michal.simek@xilinx.com>
Subject: [PATCH 0/5] arm64: zynqmp: dtsi changes next
Date: Thu,  3 Aug 2017 13:36:46 +0200
Message-ID: <cover.1501760202.git.michal.simek@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: =?UTF-8?q?S=C3=B6ren=20Brinkmann?= <soren.brinkmann@xilinx.com>, Marc Zyngier <marc.zyngier@arm.com>, monstr@monstr.eu, Alexander Graf <agraf@suse.de>, "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>, Naga Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com>, devicetree@vger.kernel.org, Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>, Kedareswara rao Appana <appanad@xilinx.com>, linux-kernel@vger.kernel.org, Alistair Francis <alistair.francis@xilinx.com>, Bharat Kumar Gogada <bharat.kumar.gogada@xilinx.com>, Moritz Fischer <mdf@kernel.org>, Rob Herring <robh+dt@kernel.org>, Stefan Krsmanovic <stefan.krsmanovic@aggios.com>, Will Deacon <will.deacon@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Mark Rutland <mark.rutland@arm.com>, VNSL
List-Id: devicetree@vger.kernel.org

Hi,

I have cherry-picked others patches from xilinx soc vendor tree which are
ready for submission.
This patchset targets zynqmp.dtsi and ep108 platform.

Thanks,
Michal


Alistair Francis (1):
  arm64: zynqmp: Use C pre-processor for includes

Michal Simek (2):
  arm64: zynqmp: Add fpd/lpd dmas
  arm64: zynqmp: Add missing mmc aliases in ep108

Naga Sureshkumar Relli (1):
  arm64: zynqmp: Enable can1 for ep108

VNSL Durga (1):
  arm64: zynqmp: Added clocks to DT for ep108

 arch/arm64/boot/dts/xilinx/zynqmp-ep108-clk.dtsi |  48 +++++++
 arch/arm64/boot/dts/xilinx/zynqmp-ep108.dts      |  10 +-
 arch/arm64/boot/dts/xilinx/zynqmp.dtsi           | 165 +++++++++++++++++++++++
 3 files changed, 221 insertions(+), 2 deletions(-)

-- 
1.9.1
