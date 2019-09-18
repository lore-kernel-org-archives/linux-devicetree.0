From: Xingyu Chen <xingyu.chen@amlogic.com>
Subject: [PATCH 0/3] reset: meson: add Meson-A1 SoC support
Date: Wed, 18 Sep 2019 20:12:24 +0800
Message-ID: <1568808746-1153-1-git-send-email-xingyu.chen@amlogic.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Philipp Zabel <p.zabel@pengutronix.de>, Kevin Hilman <khilman@baylibre.com>
Cc: devicetree@vger.kernel.org, Hanjie Lin <hanjie.lin@amlogic.com>, Jianxin Pan <jianxin.pan@amlogic.com>, Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, Xingyu Chen <xingyu.chen@amlogic.com>, Jerome Brunet <jbrunet@baylibre.com>
List-Id: devicetree@vger.kernel.org

This patchset adds support for Meson-A1 SoC Reset Controller. A new struct
meson_reset_param is introduced to describe the register differences between
Meson-A1 and previous SoCs

This patchset is based on A1 DTBv4[1].
[1] https://lore.kernel.org/linux-amlogic/1568276370-54181-1-git-send-email-jianxin.pan@amlogic.com

Xingyu Chen (3):
  arm64: dts: meson: add reset controller for Meson-A1 SoC
  dt-bindings: reset: add bindings for the Meson-A1 SoC Reset Controller
  reset: add support for the Meson-A1 SoC Reset Controller

 .../bindings/reset/amlogic,meson-reset.txt         |  4 +-
 arch/arm64/boot/dts/amlogic/meson-a1.dtsi          |  6 +++
 drivers/reset/reset-meson.c                        | 35 ++++++++++---
 include/dt-bindings/reset/amlogic,meson-a1-reset.h | 59 ++++++++++++++++++++++
 4 files changed, 95 insertions(+), 9 deletions(-)
 create mode 100644 include/dt-bindings/reset/amlogic,meson-a1-reset.h

-- 
2.7.4
