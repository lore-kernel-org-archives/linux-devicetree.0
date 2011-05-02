From: Grant Likely <grant.likely@secretlab.ca>
Subject: [RFC PATCH 1/4] arm/dt: Add dt machine definition
Date: Sun, 01 May 2011 23:07:45 -0600
Message-ID: <20110502050745.24800.32800.stgit@ponder>
References: <20110502045207.24800.91172.stgit@ponder>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20110502045207.24800.91172.stgit@ponder>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Nicolas Pitre <nicolas.pitre@linaro.org>, Russell King <linux@arm.linux.org.uk>, linux-arm-kernel@lists.infradead.org
Cc: devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, John Linn <john.linn@xilinx.com>
List-Id: devicetree@vger.kernel.org

This patch adds a DT_MACHINE_START macro to use instead of
MACHINE_START when creating a machine_desc that supports using the
device tree.

Signed-off-by: Grant Likely <grant.likely@secretlab.ca>
---
 arch/arm/include/asm/mach/arch.h |    9 +++++++++
 1 files changed, 9 insertions(+), 0 deletions(-)

diff --git a/arch/arm/include/asm/mach/arch.h b/arch/arm/include/asm/mach/arch.h
index 946f4d7..858d269 100644
--- a/arch/arm/include/asm/mach/arch.h
+++ b/arch/arm/include/asm/mach/arch.h
@@ -70,4 +70,13 @@ static const struct machine_desc __mach_desc_##_type	\
 #define MACHINE_END				\
 };
 
+#define MACH_TYPE_DT	0xffffffff
+
+#define DT_MACHINE_START(_name, _namestr)		\
+static const struct machine_desc __mach_desc_##_name	\
+ __used							\
+ __attribute__((__section__(".arch.info.init"))) = {	\
+	.nr		= MACH_TYPE_DT,			\
+	.name		= _namestr,
+
 #endif
