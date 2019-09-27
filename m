From: Nayna Jain <nayna@linux.ibm.com>
Subject: [PATCH v6 4/9] powerpc: detect the trusted boot state of the system
Date: Fri, 27 Sep 2019 10:25:55 -0400
Message-ID: <1569594360-7141-5-git-send-email-nayna@linux.ibm.com>
References: <1569594360-7141-1-git-send-email-nayna@linux.ibm.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1569594360-7141-1-git-send-email-nayna@linux.ibm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linuxppc-dev@ozlabs.org, linux-efi@vger.kernel.org, linux-integrity@vger.kernel.org, devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Jeremy Kerr <jk@ozlabs.org>, Matthew Garret <matthew.garret@nebula.com>, Mimi Zohar <zohar@linux.ibm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Claudio Carvalho <cclaudio@linux.ibm.com>, George Wilson <gcwilson@linux.ibm.com>, Elaine Palmer <erpalmer@us.ibm.com>, Eric Ricther <erichte@linux.ibm.com>, Oliver O'Halloran <oohall@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Nayna Jain <nayna@linux.ibm.com>
List-Id: devicetree@vger.kernel.org

PowerNV systems enables the IMA measurement rules only if the
trusted boot is enabled on the system.

This patch adds the function to detect if the system has trusted
boot enabled.

Signed-off-by: Nayna Jain <nayna@linux.ibm.com>
---
 arch/powerpc/include/asm/secure_boot.h |  6 ++++++
 arch/powerpc/kernel/secure_boot.c      | 14 ++++++++++++++
 2 files changed, 20 insertions(+)

diff --git a/arch/powerpc/include/asm/secure_boot.h b/arch/powerpc/include/asm/secure_boot.h
index 4e8e2b08a993..192caaedbe7a 100644
--- a/arch/powerpc/include/asm/secure_boot.h
+++ b/arch/powerpc/include/asm/secure_boot.h
@@ -14,6 +14,7 @@
 
 bool is_powerpc_os_secureboot_enabled(void);
 int get_powerpc_os_sb_node(struct device_node **node);
+bool is_powerpc_trustedboot_enabled(void);
 
 #else
 
@@ -27,5 +28,10 @@ static inline int get_powerpc_os_sb_node(struct device_node **node)
 	return -ENOENT;
 }
 
+static inline bool is_powerpc_os_trustedboot_enabled(void)
+{
+	return false;
+}
+
 #endif
 #endif
diff --git a/arch/powerpc/kernel/secure_boot.c b/arch/powerpc/kernel/secure_boot.c
index 45ca19f5e836..9d452e1550ae 100644
--- a/arch/powerpc/kernel/secure_boot.c
+++ b/arch/powerpc/kernel/secure_boot.c
@@ -80,3 +80,17 @@ bool is_powerpc_os_secureboot_enabled(void)
 	pr_info("secureboot mode disabled\n");
 	return false;
 }
+
+bool is_powerpc_trustedboot_enabled(void)
+{
+	struct device_node *node;
+
+	node = get_powerpc_fw_sb_node();
+	if (node && (of_find_property(node, "trusted-enabled", NULL))) {
+		pr_info("trustedboot mode enabled\n");
+		return true;
+	}
+
+	pr_info("trustedboot mode disabled\n");
+	return false;
+}
-- 
2.20.1
