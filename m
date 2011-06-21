From: Nicolas Pitre <nico-vtqb6HGKxmzR7s880joybQ@public.gmane.org>
Subject: [PATCH 1/4] ARM: zImage: ensure it is always a multiple of 64 bits in
	size
Date: Tue, 21 Jun 2011 01:09:12 -0400
Message-ID: <1308632955-11070-2-git-send-email-nico@fluxnic.net>
References: <1308632955-11070-1-git-send-email-nico@fluxnic.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-reply-to: <1308632955-11070-1-git-send-email-nico-vtqb6HGKxmzR7s880joybQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Nicolas Pitre <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

This is needed for proper alignment when the DTB appending feature
is used.

Signed-off-by: Nicolas Pitre <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Acked-by: Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>
---
 arch/arm/boot/compressed/vmlinux.lds.in |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/arch/arm/boot/compressed/vmlinux.lds.in b/arch/arm/boot/compressed/vmlinux.lds.in
index ea80abe..6c02db1 100644
--- a/arch/arm/boot/compressed/vmlinux.lds.in
+++ b/arch/arm/boot/compressed/vmlinux.lds.in
@@ -47,6 +47,9 @@ SECTIONS
   .got			: { *(.got) }
   _got_end = .;
   .got.plt		: { *(.got.plt) }
+
+  /* ensure the zImage file size is always a multiple of 64 bits */
+  .pad			: { BYTE(0); . = ALIGN(8); }
   _edata = .;
 
   . = BSS_START;
-- 
1.7.4
