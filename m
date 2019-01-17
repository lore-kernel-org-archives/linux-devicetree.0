From: Rob Herring <robherring2@gmail.com>
Subject: [GIT PULL] Devicetree fixes for 5.0-rc
Date: Thu, 17 Jan 2019 08:26:36 -0600
Message-ID: <CAL_JsqLiE8-TCRSigXxaGonaJE=7j9Ywggniy9_QXR3qFSbojg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Frank Rowand <frowand.list@gmail.com>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Linus,

Please pull DT fixes for 5.0.

Rob

The following changes since commit bfeffd155283772bbe78c6a05dec7c0128ee500c:

  Linux 5.0-rc1 (2019-01-06 17:08:20 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git
tags/devicetree-fixes-for-5.0

for you to fetch changes up to 3705add0b783e0deeb6646ba0311bf214fe52b0a:

  dt-bindings: reset: meson-axg: fix SPDX license id (2019-01-16 12:50:27 -0600)

----------------------------------------------------------------
Devicetree fixes for v5.0:

- Remove now unused struct device_node.type pointer

- Fix meson-axg reset header SPDX tag

- Add missing of_node_put in of_graph_get_remote_port_parent

- Fix several binding doc file references and typos

----------------------------------------------------------------
Jerome Brunet (1):
      dt-bindings: reset: meson-axg: fix SPDX license id

Julia Lawall (1):
      OF: properties: add missing of_node_put

Krzysztof Kozlowski (1):
      dt-bindings: soc: qcom: Fix trivial language typos

Lubomir Rintel (1):
      dt-bindings: marvell,mmp2: fix typos in bindings doc

Otto Sabart (2):
      doc: bindings: fix bad reference to ARM CPU bindings
      doc: gpio-mvebu: fix broken reference to cp110-system-controller0.txt file

Rob Herring (1):
      of: Remove struct device_node.type pointer

 Documentation/devicetree/bindings/arm/cpu-capacity.txt                | 2 +-
 Documentation/devicetree/bindings/arm/idle-states.txt                 | 2 +-
 Documentation/devicetree/bindings/arm/sp810.txt                       | 2 +-
 Documentation/devicetree/bindings/arm/topology.txt                    | 2 +-
 Documentation/devicetree/bindings/clock/marvell,mmp2.txt              | 2 +-
 Documentation/devicetree/bindings/display/arm,pl11x.txt               | 2 +-
 Documentation/devicetree/bindings/gpio/gpio-mvebu.txt                 | 2 --
 Documentation/devicetree/bindings/interrupt-controller/arm,gic-v3.txt | 2 +-
 Documentation/devicetree/bindings/soc/qcom/qcom,glink.txt             | 2 +-
 Documentation/devicetree/bindings/soc/qcom/qcom,smp2p.txt             | 4 ++--
 drivers/of/dynamic.c                                                  | 3 ---
 drivers/of/fdt.c                                                      | 4 ----
 drivers/of/overlay.c                                                  | 3 ---
 drivers/of/pdt.c                                                      | 1 -
 drivers/of/property.c                                                 | 1 +
 include/dt-bindings/reset/amlogic,meson-axg-reset.h                   | 3 +--
 include/linux/of.h                                                    | 1 -
 17 files changed, 12 insertions(+), 26 deletions(-)
