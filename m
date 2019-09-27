From: Nayna Jain <nayna@linux.ibm.com>
Subject: [PATCH v6 8/9] ima: deprecate permit_directio, instead use appraise_flag
Date: Fri, 27 Sep 2019 10:25:59 -0400
Message-ID: <1569594360-7141-9-git-send-email-nayna@linux.ibm.com>
References: <1569594360-7141-1-git-send-email-nayna@linux.ibm.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1569594360-7141-1-git-send-email-nayna@linux.ibm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linuxppc-dev@ozlabs.org, linux-efi@vger.kernel.org, linux-integrity@vger.kernel.org, devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Jeremy Kerr <jk@ozlabs.org>, Matthew Garret <matthew.garret@nebula.com>, Mimi Zohar <zohar@linux.ibm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Claudio Carvalho <cclaudio@linux.ibm.com>, George Wilson <gcwilson@linux.ibm.com>, Elaine Palmer <erpalmer@us.ibm.com>, Eric Ricther <erichte@linux.ibm.com>, Oliver O'Halloran <oohall@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Nayna Jain <nayna@linux.ibm.com>
List-Id: devicetree@vger.kernel.org

This patch deprecates the existing permit_directio flag, instead adds
it as possible value to appraise_flag parameter.
For eg.
appraise_flag=permit_directio

Signed-off-by: Nayna Jain <nayna@linux.ibm.com>
---
 Documentation/ABI/testing/ima_policy | 4 ++--
 security/integrity/ima/ima_policy.c  | 2 ++
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/ABI/testing/ima_policy b/Documentation/ABI/testing/ima_policy
index 4c97afcc0f3c..9a2a140dc561 100644
--- a/Documentation/ABI/testing/ima_policy
+++ b/Documentation/ABI/testing/ima_policy
@@ -24,8 +24,8 @@ Description:
 				[euid=] [fowner=] [fsname=]]
 			lsm:	[[subj_user=] [subj_role=] [subj_type=]
 				 [obj_user=] [obj_role=] [obj_type=]]
-			option:	[[appraise_type=]] [template=] [permit_directio]
-				[appraise_flag=[check_blacklist]]
+			option:	[[appraise_type=]] [template=] [permit_directio(deprecated)]
+				[appraise_flag=[check_blacklist]|[permit_directio]]
 		base: 	func:= [BPRM_CHECK][MMAP_CHECK][CREDS_CHECK][FILE_CHECK][MODULE_CHECK]
 				[FIRMWARE_CHECK]
 				[KEXEC_KERNEL_CHECK] [KEXEC_INITRAMFS_CHECK]
diff --git a/security/integrity/ima/ima_policy.c b/security/integrity/ima/ima_policy.c
index ad3b3af69460..d9df54c75d46 100644
--- a/security/integrity/ima/ima_policy.c
+++ b/security/integrity/ima/ima_policy.c
@@ -1177,6 +1177,8 @@ static int ima_parse_rule(char *rule, struct ima_rule_entry *entry)
 			ima_log_string(ab, "appraise_flag", args[0].from);
 			if (strstr(args[0].from, "blacklist"))
 				entry->flags |= IMA_CHECK_BLACKLIST;
+			if (strstr(args[0].from, "permit_directio"))
+				entry->flags |= IMA_PERMIT_DIRECTIO;
 			break;
 		case Opt_permit_directio:
 			entry->flags |= IMA_PERMIT_DIRECTIO;
-- 
2.20.1
