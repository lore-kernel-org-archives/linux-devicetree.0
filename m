From: Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: [PATCH v2 07/11] ARM: at91: select ATMEL_EBI when compiling a kernel
 for at91sam9 or sama5d3
Date: Wed,  5 Nov 2014 17:01:23 +0100
Message-ID: <1415203287-21517-8-git-send-email-boris.brezillon@free-electrons.com>
References: <1415203287-21517-1-git-send-email-boris.brezillon@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1415203287-21517-1-git-send-email-boris.brezillon@free-electrons.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, Nicolas Ferre <nicolas.ferre@atmel.com>, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Andrew Victor <linux@maxim.org.za>, Jean-Jacques Hiblot <jjhiblot@traphandler.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Boris Brezillon <boris.brezillon@free-electrons.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
---
 arch/arm/mach-at91/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/mach-at91/Kconfig b/arch/arm/mach-at91/Kconfig
index 0e6d548..a72402a 100644
--- a/arch/arm/mach-at91/Kconfig
+++ b/arch/arm/mach-at91/Kconfig
@@ -49,6 +49,7 @@ config SOC_AT91SAM9
 	select GENERIC_CLOCKEVENTS
 	select MEMORY if USE_OF
 	select ATMEL_SDRAMC if USE_OF
+	select ATMEL_EBI if USE_OF
 
 config SOC_SAMA5
 	bool
@@ -58,6 +59,7 @@ config SOC_SAMA5
 	select USE_OF
 	select MEMORY
 	select ATMEL_SDRAMC
+	select ATMEL_EBI
 
 menu "Atmel AT91 System-on-Chip"
 
-- 
1.9.1
