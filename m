From: Hugues Fruchet <hugues.fruchet@st.com>
Subject: [PATCH v1 5/5] ARM: configs: stm32: DCMI + OV9655 camera support
Date: Thu, 22 Jun 2017 17:12:51 +0200
Message-ID: <1498144371-13310-6-git-send-email-hugues.fruchet@st.com>
References: <1498144371-13310-1-git-send-email-hugues.fruchet@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1498144371-13310-1-git-send-email-hugues.fruchet@st.com>
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

Enable DCMI camera interface and OV9655 camera sensor drivers.

Signed-off-by: Hugues Fruchet <hugues.fruchet@st.com>
---
 arch/arm/configs/stm32_defconfig | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/configs/stm32_defconfig b/arch/arm/configs/stm32_defconfig
index a097538..0c3cd01 100644
--- a/arch/arm/configs/stm32_defconfig
+++ b/arch/arm/configs/stm32_defconfig
@@ -55,6 +55,15 @@ CONFIG_I2C_STM32F4=y
 CONFIG_REGULATOR=y
 CONFIG_REGULATOR_FIXED_VOLTAGE=y
 # CONFIG_USB_SUPPORT is not set
+CONFIG_VIDEO_V4L2=y
+CONFIG_MEDIA_CONTROLLER=y
+CONFIG_VIDEO_V4L2_SUBDEV_API=y
+CONFIG_MEDIA_SUBDRV_AUTOSELECT=n
+CONFIG_V4L_PLATFORM_DRIVERS=y
+CONFIG_MEDIA_SUPPORT=y
+CONFIG_MEDIA_CAMERA_SUPPORT=y
+CONFIG_VIDEO_STM32_DCMI=y
+CONFIG_VIDEO_OV9650=y
 CONFIG_NEW_LEDS=y
 CONFIG_LEDS_CLASS=y
 CONFIG_LEDS_GPIO=y
-- 
1.9.1
