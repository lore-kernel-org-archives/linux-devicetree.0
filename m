From: qiaozhou <qiaozhou@asrmicro.com>
Subject: [PATCH 0/7] Add dts files for ASR8751C SoC
Date: Sat, 23 Mar 2019 22:01:21 +0800
Message-ID: <1553349688-1946-1-git-send-email-qiaozhou@asrmicro.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: qiaozhou <qiaozhou@asrmicro.com>
List-Id: devicetree@vger.kernel.org

Add dtsi file for ASR8751C SoC and dts file for ASR8751C AquilaC development
board. Also add necessary dt-bindings document, header files.

Will add more driver of ASR8751C SoC in later patches. 

Qiao Zhou (7):
  dt-bindings: arm: asr: add ASR8751C bindings
  dt-bindings: bus: add ASR8751C APB/AXI bindings
  dt-bindings: clocks: add ASR8751C bindings
  dt-bindings: serial: add ASR8751C serial bindings
  dt-bindings: Add header file of ASR8751C clock driver
  dt-bindings: add header file of ASR8751C pinctrl driver
  arm64: dts: add dts files for asr Aquilac SoC

 .../devicetree/bindings/arm/asr/asr-8751c.txt      |   9 +
 Documentation/devicetree/bindings/bus/asr,bus.txt  |  42 ++
 .../devicetree/bindings/clock/asr,clock.txt        |  31 ++
 .../devicetree/bindings/serial/asr-serial.txt      |  23 ++
 .../devicetree/bindings/vendor-prefixes.txt        |   1 +
 arch/arm64/boot/dts/Makefile                       |   1 +
 arch/arm64/boot/dts/asr/Makefile                   |   2 +
 arch/arm64/boot/dts/asr/asr8751c-aquilac.dts       |  58 +++
 arch/arm64/boot/dts/asr/asr8751c-pinctrl.dtsi      | 400 ++++++++++++++++++
 arch/arm64/boot/dts/asr/asr8751c.dtsi              | 460 +++++++++++++++++++++
 include/dt-bindings/clock/asr8751c-clk.h           | 252 +++++++++++
 include/dt-bindings/pinctrl/asr8751c-pinfunc.h     | 341 +++++++++++++++
 12 files changed, 1620 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/asr/asr-8751c.txt
 create mode 100644 Documentation/devicetree/bindings/bus/asr,bus.txt
 create mode 100644 Documentation/devicetree/bindings/clock/asr,clock.txt
 create mode 100644 Documentation/devicetree/bindings/serial/asr-serial.txt
 create mode 100644 arch/arm64/boot/dts/asr/Makefile
 create mode 100644 arch/arm64/boot/dts/asr/asr8751c-aquilac.dts
 create mode 100644 arch/arm64/boot/dts/asr/asr8751c-pinctrl.dtsi
 create mode 100644 arch/arm64/boot/dts/asr/asr8751c.dtsi
 create mode 100644 include/dt-bindings/clock/asr8751c-clk.h
 create mode 100644 include/dt-bindings/pinctrl/asr8751c-pinfunc.h

-- 
2.7.4
