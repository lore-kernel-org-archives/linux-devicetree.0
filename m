From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH v3 0/3] dts: meson: add clock controllers input clocks
Date: Mon,  3 Dec 2018 18:16:37 +0100
Message-ID: <20181203171640.12110-1-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Neil Armstrong <narmstrong@baylibre.com>, Carlo Caione <carlo@caione.org>, Kevin Hilman <khilman@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This patchset is the first step that needs to be done so the
amlogic clock controllers properly claim their input clocks
through DT instead of relying on fixed names.

I'll be waiting for this hit mainline before sending the related
driver changes.

Changes since v1: [0]
- add clock-names for the main clock controller

Changes since v2: [1]
- add more inputs for the gx family external 32k references

[0]: https://lkml.kernel.org/r/20181129164524.18670-1-jbrunet@baylibre.com
[1]: https://lkml.kernel.org/r/20181203131850.31388-1-jbrunet@baylibre.com

Jerome Brunet (3):
  dt-bindings: clk: meson: add ao controller clock inputs
  dt-bindings: clk: meson: add main controller clock input
  arm64: dts: meson: add clock controller clock inputs

 .../devicetree/bindings/clock/amlogic,gxbb-aoclkc.txt  | 10 +++++++++-
 .../devicetree/bindings/clock/amlogic,gxbb-clkc.txt    |  5 +++++
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi             |  4 ++++
 arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi            |  4 ++++
 arch/arm64/boot/dts/amlogic/meson-gxl.dtsi             |  4 ++++
 5 files changed, 26 insertions(+), 1 deletion(-)

-- 
2.19.1
