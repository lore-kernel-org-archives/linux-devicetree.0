From: Samuel Holland <samuel-RkNLwX/CsU9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v3 00/15] Allwinner sunxi message box support
Date: Fri,  1 Mar 2019 22:29:36 -0600
Message-ID: <20190302042951.53671-1-samuel@sholland.org>
Reply-To: samuel-RkNLwX/CsU9g9hUCZPvPmw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDA2PU6QWEARBQ4N5DRQKGQELBT7BVQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Samuel Holland <samuel-RkNLwX/CsU9g9hUCZPvPmw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This series adds support for the "hardware message box" in sun8i, sun9i,
and sun50i SoCs, used for communication with the ARISC management
processor (the platform's equivalent of the ARM SCP). The end goal is to
use the arm_scpi driver as a client, communicating with firmware running
on the AR100 CPU, or to use the mailbox to forward NMIs that the
firmware picks up from R_INTC.

Unfortunately, the ARM SCPI client no longer works with this driver
since it now exposes all 8 hardware FIFOs individually. The SCPI client
could be made to work (and I posted proof-of-concept code to that effect
with v1 of this series), but that is a low priority, as Linux does not
directly use SCPI with the current firmware version; all SCPI use goes
through ATF via PSCI.

An example usage is included at the end of this patch series. The IRQ
forwarding code is WIP and not even RFC quality yet, but it does work.
To build the firmware component, run:

  git clone https://github.com/crust-firmware/meta meta
  git clone https://github.com/smaeul/crust -b linux-mailbox-example meta/crust
  cd meta
  make

That will by default produce a U-Boot + ATF + SCP firmware image in
[meta/]build/pinebook/u-boot-sunxi-with-spl.bin. See the top-level README.md
for more information (like cross-compiler setup). The IRQ-forwarding mailbox
server is implemented in [meta/crust/]common/irqf.c.

With that firmware and the full patch series here (on top of
torvalds/master), Linux boots and is able to receive NMIs from the PMIC
(i.e. use `showkey` to see that the power button works, and see that
/proc/interrupts updates). As an added bonus, suspend/resume also mostly
works :)

Changes from v2:
  - Merge patches 1-3
  - Add a comment in the code explaining the CLK_IS_CRITICAL usage
  - Add a patch to mark the AR100 clocks as critical
  - Use YAML for the device tree binding
  - Include a not-for-merge example usage of the mailbox.

Changes from v1:
  - Marked message box clocks as critical instead of hacks in the driver
  - 8 unidirectional channels instead of 4 bidirectional pairs
  - Use per-SoC compatible strings and an A31 fallback compatible
  - Dropped the mailbox framework patch
  - Include DT patches for SoCs that document the message box

Samuel Holland (15):
  clk: sunxi-ng: Mark msgbox clocks as critical
  clk: sunxi-ng: Mark AR100 clocks as critical
  dt-bindings: mailbox: Add a sunxi message box binding
  mailbox: sunxi-msgbox: Add a new mailbox driver
  ARM: dts: sunxi: a80: Add msgbox node
  ARM: dts: sunxi: a83t: Add msgbox node
  ARM: dts: sunxi: h3/h5: Add msgbox node
  arm64: dts: allwinner: a64: Add msgbox node
  arm64: dts: allwinner: h6: Add msgbox node
  [NOT FOR MERGE] clk: sunxi-ng: sun8i: Avoid turning off unused PRCM
    gates
  [NOT FOR MERGE] dt-bindings: Add a binding for a mailbox-backed
    interrupt controller
  [NOT FOR MERGE] irqchip/mbox: Introduce a mailbox-backed irqchip
    driver
  [NOT FOR MERGE] arm64: dts: allwinner: a64: Add interrupt controller
    node
  [NOT FOR MERGE] arm64: dts: allwinner: a64: Convert DTS to use
    msgbox_intc
  [NOT FOR MERGE] arm64: dts: allwinner: a64: Remove unused r_intc

 .../interrupt-controller/mbox-intc.txt        |  33 ++
 .../mailbox/allwinner,sunxi-msgbox.yaml       |  79 +++++
 arch/arm/boot/dts/sun8i-a83t.dtsi             |  10 +
 arch/arm/boot/dts/sun9i-a80.dtsi              |  10 +
 arch/arm/boot/dts/sunxi-h3-h5.dtsi            |  10 +
 .../allwinner/sun50i-a64-amarula-relic.dts    |   4 +-
 .../dts/allwinner/sun50i-a64-bananapi-m64.dts |   4 +-
 .../dts/allwinner/sun50i-a64-nanopi-a64.dts   |   4 +-
 .../dts/allwinner/sun50i-a64-olinuxino.dts    |   4 +-
 .../dts/allwinner/sun50i-a64-orangepi-win.dts |   4 +-
 .../boot/dts/allwinner/sun50i-a64-pine64.dts  |   4 +-
 .../dts/allwinner/sun50i-a64-pinebook.dts     |   4 +-
 .../boot/dts/allwinner/sun50i-a64-sopine.dtsi |   4 +-
 .../boot/dts/allwinner/sun50i-a64-teres-i.dts |   4 +-
 arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi |  27 +-
 arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi  |  10 +
 drivers/clk/sunxi-ng/ccu-sun50i-a64.c         |   3 +-
 drivers/clk/sunxi-ng/ccu-sun50i-h6-r.c        |   2 +-
 drivers/clk/sunxi-ng/ccu-sun50i-h6.c          |   3 +-
 drivers/clk/sunxi-ng/ccu-sun8i-a23.c          |   3 +-
 drivers/clk/sunxi-ng/ccu-sun8i-a33.c          |   3 +-
 drivers/clk/sunxi-ng/ccu-sun8i-a83t.c         |   3 +-
 drivers/clk/sunxi-ng/ccu-sun8i-h3.c           |   3 +-
 drivers/clk/sunxi-ng/ccu-sun8i-r.c            |  20 +-
 drivers/clk/sunxi-ng/ccu-sun9i-a80.c          |   3 +-
 drivers/irqchip/Kconfig                       |   9 +
 drivers/irqchip/Makefile                      |   1 +
 drivers/irqchip/irq-mbox.c                    | 199 +++++++++++
 drivers/mailbox/Kconfig                       |  11 +
 drivers/mailbox/Makefile                      |   2 +
 drivers/mailbox/sunxi-msgbox.c                | 315 ++++++++++++++++++
 31 files changed, 750 insertions(+), 45 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/mbox-intc.txt
 create mode 100644 Documentation/devicetree/bindings/mailbox/allwinner,sunxi-msgbox.yaml
 create mode 100644 drivers/irqchip/irq-mbox.c
 create mode 100644 drivers/mailbox/sunxi-msgbox.c

-- 
2.19.2
