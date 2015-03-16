From: Gabriel FERNANDEZ <gabriel.fernandez@st.com>
Subject: [PATCH v2 1/5] ARM: STi: Kconfig update for PCIe support
Date: Mon, 16 Mar 2015 15:20:31 +0100
Message-ID: <1426515635-9466-2-git-send-email-gabriel.fernandez@linaro.org>
References: <1426515635-9466-1-git-send-email-gabriel.fernandez@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1426515635-9466-1-git-send-email-gabriel.fernandez@linaro.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Srinivas Kandagatla <srinivas.kandagatla@gmail.com>, Maxime Coquelin <maxime.coquelin@st.com>, Patrice Chotard <patrice.chotard@st.com>, Russell King <linux@arm.linux.org.uk>, Bjorn Helgaas <bhelgaas@google.com>, Mohit Kumar <mohit.kumar@st.com>, Jingoo Han <jg1.han@samsung.com>, Lucas Stach <l.stach@pengutronix.de>, Fabrice Gasnier <fabrice.gasnier@st.com>, Kishon Vijay Abraham I <kishon@ti.com>, Andrew Morton <akpm@linux-foundation.org>, " David S. Miller" <davem@davemloft.net>, Greg KH <gregkh@linuxfoundation.org>, Mauro Carvalho Chehab <mchehab@osg.samsung.com>, Joe Perches <joe@perches.com>, Tejun Heo <tj@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Viresh Kumar <viresh.kumar@linar>
Cc: devicetree@vger.kernel.org, kernel@stlinux.com, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, Gabriel Fernandez <gabriel.fernandez@linaro.org>, Lee Jones <lee.jones@linaro.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Update Kconfig:
- MIGHT_HAVE_PCI
- PCI_DOMAINS

Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>
---
 arch/arm/mach-sti/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/mach-sti/Kconfig b/arch/arm/mach-sti/Kconfig
index 3b1ac46..7f9b432 100644
--- a/arch/arm/mach-sti/Kconfig
+++ b/arch/arm/mach-sti/Kconfig
@@ -8,6 +8,8 @@ menuconfig ARCH_STI
 	select ARCH_HAS_RESET_CONTROLLER
 	select HAVE_ARM_SCU if SMP
 	select ARCH_REQUIRE_GPIOLIB
+	select PCI_DOMAINS if PCI
+	select MIGHT_HAVE_PCI
 	select ARM_ERRATA_754322
 	select ARM_ERRATA_764369 if SMP
 	select ARM_ERRATA_775420
-- 
1.9.1
