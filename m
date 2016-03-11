From: Franck Jullien <franck.jullien-EduPiq9onwdphFt5fpzH3laPQRlvutdw@public.gmane.org>
Subject: [RFC 1/8] arch/x86: Add Kconfig USE_OF
Date: Fri, 11 Mar 2016 16:56:08 +0100
Message-ID: <1457711775-6326-2-git-send-email-franck.jullien@odyssee-systemes.fr>
References: <1457711775-6326-1-git-send-email-franck.jullien@odyssee-systemes.fr>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1457711775-6326-1-git-send-email-franck.jullien-EduPiq9onwdphFt5fpzH3laPQRlvutdw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org, laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, Franck Jullien <franck.jullien-EduPiq9onwdphFt5fpzH3laPQRlvutdw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Franck Jullien <franck.jullien-EduPiq9onwdphFt5fpzH3laPQRlvutdw@public.gmane.org>
---
 arch/x86/Kconfig |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index c46662f..6948691 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -292,6 +292,13 @@ config X86_32_LAZY_GS
 	def_bool y
 	depends on X86_32 && !CC_STACKPROTECTOR
 
+config USE_OF
+	bool "Support for device tree"
+	select OF
+	select OF_EARLY_FLATTREE
+	---help---
+	  Device tree support on X86.
+
 config ARCH_HWEIGHT_CFLAGS
 	string
 	default "-fcall-saved-ecx -fcall-saved-edx" if X86_32
-- 
1.7.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
