From: Maxime Jourdan <mjourdan@baylibre.com>
Subject: [PATCH v2 0/2] arm64: dts: meson: add simple-framebuffer nodes
Date: Mon,  7 Jan 2019 10:53:05 +0100
Message-ID: <20190107095307.15233-1-mjourdan@baylibre.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org
Cc: Maxime Jourdan <mjourdan@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, Rob Herring <robh@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
List-Id: devicetree@vger.kernel.org

This patch series adds support for simplefb for the GXBB and GXL chips.

simple-framebuffer allows sharing a framebuffer already setup by the
firmware to the kernel for a seamless boot transition.

It goes along with a u-boot patch series adding display support to
GXBB & GXL that is not sent yet.

Changes since v1 [1]:
 - added cover letter
 - added simple-framebuffer compatible fallback to the bindings
 - Updated node names and removed the unit-address
 - Consolidated base nodes in meson-gx.dtsi
 
[1] https://patchwork.kernel.org/patch/10720879/

Maxime Jourdan (2):
  dt-bindings: meson: add specific simplefb bindings
  arm64: dts: meson-gx: add support for simplefb

 .../display/simple-framebuffer-meson.txt      | 33 +++++++++++++++++++
 arch/arm64/boot/dts/amlogic/meson-gx.dtsi     | 22 +++++++++++++
 arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi   |  6 ++++
 arch/arm64/boot/dts/amlogic/meson-gxl.dtsi    |  6 ++++
 4 files changed, 67 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/simple-framebuffer-meson.txt

-- 
2.20.1
