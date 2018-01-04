From: =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 0/2] arm64: dts: r8a779[56]: update register size for thermal
Date: Thu,  4 Jan 2018 22:31:06 +0100
Message-ID: <20180104213108.24080-1-niklas.soderlund+renesas@ragnatech.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: devicetree@vger.kernel.org, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org, =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
List-Id: devicetree@vger.kernel.org

Hi,

This series updates the register size for the thermal hardware. In later 
versions of the datasheet one additional register is documented. This 
register is needed to be able to determine if calibration data should be 
read from register or if static values from the driver should be used.

There is already a posted RFC patch which make use of this additional 
register (THSCP) if the register size described in DT covers it.  
Currently no hardware where the calibration value is fused have been 
found so that patch is not tested and therefore kept back until such a 
system is found. In the mean time there is no harm in getting the 
correct register size described in DT now that it's documented in the 
datasheet (Rev 0.80).

Niklas Söderlund (2):
  arm64: dts: r8a7795: update register size for thermal
  arm64: dts: r8a7796: update register size for thermal

 arch/arm64/boot/dts/renesas/r8a7795.dtsi | 2 +-
 arch/arm64/boot/dts/renesas/r8a7796.dtsi | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
2.15.1
