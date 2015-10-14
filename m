From: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
Subject: [PATCH 2/5] gpio/xilinx: enable for MIPS
Date: Wed, 14 Oct 2015 13:51:54 +0100
Message-ID: <1444827117-10939-3-git-send-email-Zubair.Kakakhel@imgtec.com>
References: <1444827117-10939-1-git-send-email-Zubair.Kakakhel@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-mips-bounce@linux-mips.org>
In-Reply-To: <1444827117-10939-1-git-send-email-Zubair.Kakakhel@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: ralf@linux-mips.org, robh+dt@kernel.org, linus.walleij@linaro.org
Cc: linux-mips@linux-mips.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Zubair.Kakakhel@imgtec.com
List-Id: devicetree@vger.kernel.org

MIPSfpga uses the axi gpio controller. Enable the driver for MIPS.

Signed-off-by: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
---
 drivers/gpio/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 8949b3f..58e9afd 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -508,7 +508,7 @@ config GPIO_XGENE_SB
 
 config GPIO_XILINX
 	tristate "Xilinx GPIO support"
-	depends on OF_GPIO && (PPC || MICROBLAZE || ARCH_ZYNQ || X86)
+	depends on OF_GPIO && (PPC || MICROBLAZE || ARCH_ZYNQ || X86 || MIPS)
 	help
 	  Say yes here to support the Xilinx FPGA GPIO device
 
-- 
1.9.1
