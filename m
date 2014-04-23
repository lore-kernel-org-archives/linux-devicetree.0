From: Rob Herring <robherring2@gmail.com>
Subject: [PATCH v2 05/21] ARM: dt: use default early_init_dt_alloc_memory_arch
Date: Tue, 22 Apr 2014 20:18:05 -0500
Message-ID: <1398215901-25609-6-git-send-email-robherring2@gmail.com>
References: <1398215901-25609-1-git-send-email-robherring2@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1398215901-25609-1-git-send-email-robherring2@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Grant Likely <grant.likely@linaro.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>, Russell King <linux@arm.linux.org.uk>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

From: Rob Herring <robh@kernel.org>

Now that ARM is using memblock instead of bootmem, the default version
of early_init_dt_alloc_memory_arch can be used.

Signed-off-by: Rob Herring <robh@kernel.org>
Cc: Russell King <linux@arm.linux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org
---
v2: no change

 arch/arm/kernel/devtree.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/arch/arm/kernel/devtree.c b/arch/arm/kernel/devtree.c
index c7419a5..dff9cc0 100644
--- a/arch/arm/kernel/devtree.c
+++ b/arch/arm/kernel/devtree.c
@@ -32,11 +32,6 @@ void __init early_init_dt_add_memory_arch(u64 base, u64 size)
 	arm_add_memory(base, size);
 }
 
-void * __init early_init_dt_alloc_memory_arch(u64 size, u64 align)
-{
-	return memblock_virt_alloc(size, align);
-}
-
 void __init arm_dt_memblock_reserve(void)
 {
 	u64 *reserve_map, base, size;
-- 
1.9.1
