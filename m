From: Chen-Yu Tsai <wens@kernel.org>
Subject: [PATCH 0/6] nvmem: sunxi_sid: native format and A83T/H5 support
Date: Mon, 18 Mar 2019 15:33:48 +0800
Message-ID: <20190318073354.12151-1-wens@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Maxime Ripard <maxime.ripard@bootlin.com>
Cc: linux-sunxi@googlegroups.com, Chen-Yu Tsai <wens@csie.org>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Chen-Yu Tsai <wens@csie.org>

Hi everyone,

This series converts the sunxi_sid driver to read out data in native
endianness for all Allwinner SoCs. It was already the case for the H3,
which used a different read-out method. The endianness for this hardware
was found to be either native or little endian [1], based on the data
layout for the thermal sensor calibration data stored within. Some SoCs
have either 1 or 3 sensors, and calibration data for each sensor is 2
bytes wide, with data for 2 sensors packed into 1 word.

The first three patches do some clean-up and improvements of the code
overall. The fourth patch converts the driver to reading out data in
native endianness. The fifth adds support for the A83T and H5. These
two were already listed in the device tree bindings. The last patch
adds a device node for it on H3 and H5.

Please have a look.

Regards
ChenYu

[1] https://lkml.org/lkml/2019/2/18/134

Chen-Yu Tsai (6):
  nvmem: sunxi_sid: Read out SID for randomness without looping
  nvmem: sunxi_sid: Optimize register read-out method
  nvmem: sunxi_sid: Dynamically allocate nvmem_config structure
  nvmem: sunxi_sid: Read out data in native format
  nvmem: sunxi_sid: Support SID on A83T and H5
  ARM: dts: sunxi: h3/h5: Add device node for SID

 arch/arm/boot/dts/sun8i-h3.dtsi              |  4 +
 arch/arm/boot/dts/sunxi-h3-h5.dtsi           |  5 +
 arch/arm64/boot/dts/allwinner/sun50i-h5.dtsi |  4 +
 drivers/nvmem/sunxi_sid.c                    | 98 ++++++++------------
 4 files changed, 52 insertions(+), 59 deletions(-)

-- 
2.20.1
