From: Scott Shu <scott.shu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v4 4/8] ARM: multi_v7_defconfig: enable INFRACFG and SCPSYS modules
Date: Sun, 23 Aug 2015 17:01:03 +0800
Message-ID: <1440320467-26118-5-git-send-email-scott.shu@mediatek.com>
References: <1440320467-26118-1-git-send-email-scott.shu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1440320467-26118-1-git-send-email-scott.shu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, wsd_upstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, loda.chou-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, jades.shih-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, scott.shu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Scott Shu <scott.shu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The INFRACFG contains various infrastructure registers and the SCPSYS handles
several power management related tasks. Both are needed for SMP and CPU
hotplug on MT6580.

Signed-off-by: Scott Shu <scott.shu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
---
 arch/arm/configs/multi_v7_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index 6d83a1b..c272edd 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -596,6 +596,8 @@ CONFIG_KEYBOARD_NVEC=y
 CONFIG_SERIO_NVEC_PS2=y
 CONFIG_NVEC_POWER=y
 CONFIG_NVEC_PAZ00=y
+CONFIG_MTK_INFRACFG=y
+CONFIG_MTK_SCPSYS=y
 CONFIG_QCOM_GSBI=y
 CONFIG_QCOM_PM=y
 CONFIG_COMMON_CLK_QCOM=y
-- 
1.9.1

************* Email Confidentiality Notice ********************
The information contained in this e-mail message (including any 
attachments) may be confidential, proprietary, privileged, or otherwise
exempt from disclosure under applicable laws. It is intended to be 
conveyed only to the designated recipient(s). Any use, dissemination, 
distribution, printing, retaining or copying of this e-mail (including its 
attachments) by unintended recipient(s) is strictly prohibited and may 
be unlawful. If you are not an intended recipient of this e-mail, or believe 
that you have received this e-mail in error, please notify the sender 
immediately (by replying to this e-mail), delete any and all copies of 
this e-mail (including any attachments) from your system, and do not
disclose the content of this e-mail to any other person. Thank you!
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
