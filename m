From: Russell King <rmk+kernel@arm.linux.org.uk>
Subject: [PATCH 05/12] ARM: kdump: advertise boot aliased crash kernel
 resource
Date: Thu, 28 Apr 2016 10:28:09 +0100
Message-ID: <E1aviEz-0000j7-Gk@rmk-PC.arm.linux.org.uk>
References: <20160428092644.GX19428@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-ia64-owner@vger.kernel.org>
In-Reply-To: <20160428092644.GX19428@n2100.arm.linux.org.uk>
Content-Disposition: inline
Sender: linux-ia64-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org, Eric Biederman <ebiederm@xmission.com>, Fenghua Yu <fenghua.yu@intel.com>, Haren Myneni <hbabu@us.ibm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Jonathan Corbet <corbet@lwn.net>, kexec@lists.infradead.org, Kumar Gala <galak@codeaurora.org>, linux-doc@vger.kernel.org, linux-ia64@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <robh+dt@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>, Tony Luck <tony.luck@intel.com>, Vivek Goyal <vgoyal@redhat.com>
List-Id: devicetree@vger.kernel.org

Advertise a resource which describes where the crash kernel is located
in the boot view of RAM.  This allows kexec-tools to have this vital
information.

Signed-off-by: Russell King <rmk+kernel@arm.linux.org.uk>
---
 arch/arm/kernel/setup.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm/kernel/setup.c b/arch/arm/kernel/setup.c
index d9317eec1eba..19b25ad61385 100644
--- a/arch/arm/kernel/setup.c
+++ b/arch/arm/kernel/setup.c
@@ -1003,9 +1003,25 @@ static void __init reserve_crashkernel(void)
 		(unsigned long)(crash_base >> 20),
 		(unsigned long)(total_mem >> 20));
 
+	/* The crashk resource must always be located in normal mem */
 	crashk_res.start = crash_base;
 	crashk_res.end = crash_base + crash_size - 1;
 	insert_resource(&iomem_resource, &crashk_res);
+
+	if (arm_has_idmap_alias()) {
+		/*
+		 * If we have a special RAM alias for use at boot, we
+		 * need to advertise to kexec tools where the alias is.
+		 */
+		static struct resource crashk_boot_res = {
+			.name = "Crash kernel (boot alias)",
+			.flags = IORESOURCE_BUSY | IORESOURCE_MEM,
+		};
+
+		crashk_boot_res.start = phys_to_idmap(crash_base);
+		crashk_boot_res.end = crashk_boot_res.start + crash_size - 1;
+		insert_resource(&iomem_resource, &crashk_boot_res);
+	}
 }
 #else
 static inline void reserve_crashkernel(void) {}
-- 
2.1.0

