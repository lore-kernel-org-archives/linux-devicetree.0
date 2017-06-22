From: Hugues Fruchet <hugues.fruchet@st.com>
Subject: [PATCH v1 0/6] Add support of OV9655 camera
Date: Thu, 22 Jun 2017 17:05:36 +0200
Message-ID: <1498143942-12682-1-git-send-email-hugues.fruchet@st.com>
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
To: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, " H. Nikolaus Schaller" <hns@goldelico.com>, Guennadi Liakhovetski <g.liakhovetski@gmx.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Yannick Fertre <yannick.fertre@st.com>, Benjamin Gaignard <benjamin.gaignard@linaro.org>, Hugues Fruchet <hugues.fruchet@st.com>, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This patchset enables OV9655 camera support.

OV9655 support has been tested using STM32F4DIS-CAM extension board
plugged on connector P1 of STM32F746G-DISCO board.
Due to lack of OV9650/52 hardware support, the modified related code
could not have been checked for non-regression.

First patches upgrade current support of OV9650/52 to prepare then
introduction of OV9655 variant patch.
Because of OV9655 register set slightly different from OV9650/9652,
not all of the driver features are supported (controls). Supported
resolutions are limited to VGA, QVGA, QQVGA.
Supported format is limited to RGB565.
Controls are limited to color bar test pattern for test purpose.

OV9655 initial support is based on a driver written by H. Nikolaus Schaller [1].
OV9655 registers sequences come from STM32CubeF7 embedded software [2].

[1] http://git.goldelico.com/?p=gta04-kernel.git;a=shortlog;h=refs/heads/work/hns/video/ov9655
[2] https://developer.mbed.org/teams/ST/code/BSP_DISCO_F746NG/file/e1d9da7fe856/Drivers/BSP/Components/ov9655/ov9655.c

===========
= history =
===========
version 1:
  - Initial submission.

H. Nikolaus Schaller (1):
  DT bindings: add bindings for ov965x camera module

Hugues Fruchet (5):
  [media] ov9650: add device tree support
  [media] ov9650: select the nearest higher resolution
  [media] ov9650: use write_array() for resolution sequences
  [media] ov9650: add multiple variant support
  [media] ov9650: add support of OV9655 variant

 .../devicetree/bindings/media/i2c/ov965x.txt       |  37 +
 drivers/media/i2c/Kconfig                          |   6 +-
 drivers/media/i2c/ov9650.c                         | 792 +++++++++++++++++----
 3 files changed, 704 insertions(+), 131 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ov965x.txt

-- 
1.9.1
