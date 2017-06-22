From: Hugues Fruchet <hugues.fruchet@st.com>
Subject: [PATCH v1 0/5] Camera support on STM32F746G-DISCO board
Date: Thu, 22 Jun 2017 17:12:46 +0200
Message-ID: <1498144371-13310-1-git-send-email-hugues.fruchet@st.com>
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
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Yannick Fertre <yannick.fertre@st.com>, Benjamin Gaignard <benjamin.gaignard@linaro.org>, Hugues Fruchet <hugues.fruchet@st.com>, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This patchset enables OV9655 camera support of STM32F4DIS-CAM extension
board plugged on connector P1 of STM32F746G-DISCO board.

Tested by doing a fullscreen preview with a modified version of yavta [1]
which redirects captured frames to framebuffer:
 yavta -s 480x272 -n 1 --capture=-1 /dev/video0 -D (note the unofficial
 "-D" option for "Display output")

First part of patches brings few fixes in DCMI driver and introduces
internal crop support in order to enable fullscreen preview (480x272)
by cropping VGA sensor output.

Second part relates to devicetree and configuration to enable DCMI on
STM32F746 MCU then enable DCMI and OV9655 support on STM32F746G-DISCO [2].

[1] http://git.ideasonboard.org/?p=yavta.git;a=summary
[2] due to STM32F746G-DISCO support not yet in media tree (4.13-rc1),
    devicetree patches related to STM32F746G-DISCO are not yet provided.

===========
= history =
===========
version 1:
  - Initial submission for code review with restrictions [2].


Hugues Fruchet (5):
  [media] stm32-dcmi: catch dma submission error
  [media] stm32-dcmi: revisit control register handling
  [media] stm32-dcmi: crop sensor image to match user resolution
  ARM: dts: stm32: Enable DCMI support on STM32F746 MCU
  ARM: configs: stm32: DCMI + OV9655 camera support

 arch/arm/boot/dts/stm32f746.dtsi          | 31 +++++++++++++
 arch/arm/configs/stm32_defconfig          |  9 ++++
 drivers/media/platform/stm32/stm32-dcmi.c | 72 ++++++++++++++++++++++++++-----
 3 files changed, 101 insertions(+), 11 deletions(-)

-- 
1.9.1
