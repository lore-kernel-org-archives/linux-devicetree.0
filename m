From: Alexandre Torgue <alexandre.torgue@st.com>
Subject: [PATCH v2 2/4] ARM: configs: stm32: remove XIP configuration
Date: Wed, 28 Feb 2018 14:10:56 +0100
Message-ID: <1519823458-27734-3-git-send-email-alexandre.torgue@st.com>
References: <1519823458-27734-1-git-send-email-alexandre.torgue@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1519823458-27734-1-git-send-email-alexandre.torgue@st.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>, arnd@arndb.de, robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk, patrice.chotard@st.com, lee.jones@linaro.org
Cc: devicetree@vger.kernel.org, vladimir.murzin@arm.com, Alexandre Torgue <alexandre.torgue@st.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Embedded flash becomes too small to be used as XIP support. SD card is now
available on most of stm32 boards and could be used as boot support.
Furthermore, ARM_MPU flags will be used by default and it imposes that XIP
image to be aligned on 1MB (which is not the case). For all those reasons
I prefer to remove XIP configuration from default stm32 config and let
user configure it if needed.

Signed-off-by: Alexandre Torgue <alexandre.torgue@st.com>

diff --git a/arch/arm/configs/stm32_defconfig b/arch/arm/configs/stm32_defconfig
index ba805b7..b162b8d 100644
--- a/arch/arm/configs/stm32_defconfig
+++ b/arch/arm/configs/stm32_defconfig
@@ -28,8 +28,6 @@ CONFIG_PREEMPT=y
 # CONFIG_ATAGS is not set
 CONFIG_ZBOOT_ROM_TEXT=0x0
 CONFIG_ZBOOT_ROM_BSS=0x0
-CONFIG_XIP_KERNEL=y
-CONFIG_XIP_PHYS_ADDR=0x08008000
 CONFIG_BINFMT_FLAT=y
 CONFIG_BINFMT_SHARED_FLAT=y
 # CONFIG_COREDUMP is not set
-- 
2.7.4
