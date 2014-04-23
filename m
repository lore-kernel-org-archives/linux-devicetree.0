From: Rob Herring <robherring2@gmail.com>
Subject: [PATCH v2 06/21] c6x: convert fdt pointers to opaque pointers
Date: Tue, 22 Apr 2014 20:18:06 -0500
Message-ID: <1398215901-25609-7-git-send-email-robherring2@gmail.com>
References: <1398215901-25609-1-git-send-email-robherring2@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1398215901-25609-1-git-send-email-robherring2@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Grant Likely <grant.likely@linaro.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>, Mark Salter <msalter@redhat.com>, Aurelien Jacquiot <a-jacquiot@ti.com>, linux-c6x-dev@linux-c6x.org
List-Id: devicetree@vger.kernel.org

From: Rob Herring <robh@kernel.org>

The architecture code does not need to access the internals of the FDT
blob, so make the pointer to it void *.

Signed-off-by: Rob Herring <robh@kernel.org>
Cc: Mark Salter <msalter@redhat.com>
Cc: Aurelien Jacquiot <a-jacquiot@ti.com>
Cc: linux-c6x-dev@linux-c6x.org
---
v2: remove unneeded casting

 arch/c6x/kernel/setup.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/c6x/kernel/setup.c b/arch/c6x/kernel/setup.c
index 731db4b..7571288 100644
--- a/arch/c6x/kernel/setup.c
+++ b/arch/c6x/kernel/setup.c
@@ -265,8 +265,8 @@ int __init c6x_add_memory(phys_addr_t start, unsigned long size)
  */
 notrace void __init machine_init(unsigned long dt_ptr)
 {
-	struct boot_param_header *dtb = __va(dt_ptr);
-	struct boot_param_header *fdt = (struct boot_param_header *)_fdt_start;
+	const void *dtb = __va(dt_ptr);
+	const void *fdt = _fdt_start;
 
 	/* interrupts must be masked */
 	set_creg(IER, 2);
-- 
1.9.1
