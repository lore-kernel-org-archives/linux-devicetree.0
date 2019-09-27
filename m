From: Nayna Jain <nayna@linux.ibm.com>
Subject: [PATCH v6 5/9] powerpc/ima: add measurement rules to ima arch specific policy
Date: Fri, 27 Sep 2019 10:25:56 -0400
Message-ID: <1569594360-7141-6-git-send-email-nayna@linux.ibm.com>
References: <1569594360-7141-1-git-send-email-nayna@linux.ibm.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1569594360-7141-1-git-send-email-nayna@linux.ibm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linuxppc-dev@ozlabs.org, linux-efi@vger.kernel.org, linux-integrity@vger.kernel.org, devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Jeremy Kerr <jk@ozlabs.org>, Matthew Garret <matthew.garret@nebula.com>, Mimi Zohar <zohar@linux.ibm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Claudio Carvalho <cclaudio@linux.ibm.com>, George Wilson <gcwilson@linux.ibm.com>, Elaine Palmer <erpalmer@us.ibm.com>, Eric Ricther <erichte@linux.ibm.com>, Oliver O'Halloran <oohall@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Nayna Jain <nayna@linux.ibm.com>
List-Id: devicetree@vger.kernel.org

This patch adds the measurement rules to the arch specific policies for the
systems with trusted boot.

Signed-off-by: Nayna Jain <nayna@linux.ibm.com>
---
 arch/powerpc/kernel/ima_arch.c | 44 +++++++++++++++++++++++++++++++---
 1 file changed, 41 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/kernel/ima_arch.c b/arch/powerpc/kernel/ima_arch.c
index 39401b67f19e..77c61b142042 100644
--- a/arch/powerpc/kernel/ima_arch.c
+++ b/arch/powerpc/kernel/ima_arch.c
@@ -12,8 +12,18 @@ bool arch_ima_get_secureboot(void)
 	return is_powerpc_os_secureboot_enabled();
 }
 
-/* Defines IMA appraise rules for secureboot */
+/*
+ * The "arch_rules" contains both the securebot and trustedboot rules for adding
+ * the kexec kernel image and kernel modules file hashes to the IMA measurement
+ * list and verifying the file signatures against known good values.
+ *
+ * The "appraise_type=imasig|modsig" option allows the good signature to be
+ * stored as an xattr or as an appended signature. The "template=ima-modsig"
+ * option includes the appended signature in the IMA measurement list.
+ */
 static const char *const arch_rules[] = {
+	"measure func=KEXEC_KERNEL_CHECK template=ima-modsig",
+	"measure func=MODULE_CHECK template=ima-modsig",
 	"appraise func=KEXEC_KERNEL_CHECK appraise_type=imasig|modsig",
 #if !IS_ENABLED(CONFIG_MODULE_SIG)
 	"appraise func=MODULE_CHECK appraise_type=imasig|modsig",
@@ -22,12 +32,40 @@ static const char *const arch_rules[] = {
 };
 
 /*
- * Returns the relevant IMA arch policies based on the system secureboot state.
+ * The "measure_rules" are enabled only on "trustedboot" enabled systems.
+ * These rules add the kexec kernel image and kernel modules file hashes to
+ * the IMA measurement list.
+ */
+static const char *const measure_rules[] = {
+	"measure func=KEXEC_KERNEL_CHECK",
+	"measure func=MODULE_CHECK",
+	NULL
+};
+
+/*
+ * Returns the relevant IMA arch policies based on the system secureboot
+ * and trustedboot state.
  */
 const char *const *arch_get_ima_policy(void)
 {
-	if (is_powerpc_os_secureboot_enabled())
+	const char *const *rules;
+	int offset = 0;
+
+	for (rules = arch_rules; *rules != NULL; rules++) {
+		if (strncmp(*rules, "appraise", 8) == 0)
+			break;
+		offset++;
+	}
+
+	if (is_powerpc_os_secureboot_enabled()
+	    && is_powerpc_trustedboot_enabled())
 		return arch_rules;
 
+	if (is_powerpc_os_secureboot_enabled())
+		return arch_rules + offset;
+
+	if (is_powerpc_trustedboot_enabled())
+		return measure_rules;
+
 	return NULL;
 }
-- 
2.20.1
