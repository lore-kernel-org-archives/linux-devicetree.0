From: Nicolas Pitre <nicolas.pitre@linaro.org>
Subject: [PATCH 1/3] ARM: zImage: ensure it is always a multiple of 64 bits in
	size
Date: Sun, 12 Jun 2011 02:06:38 -0400
Message-ID: <1307858800-16712-2-git-send-email-nicolas.pitre@linaro.org>
References: <1307858800-16712-1-git-send-email-nicolas.pitre@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-reply-to: <1307858800-16712-1-git-send-email-nicolas.pitre@linaro.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org
Cc: John Bonesio <bones@secretlab.ca>, Tony Lindgren <tony@atomide.com>, Grant Likely <grant.likely@secretlab.ca>
List-Id: devicetree@vger.kernel.org

This is needed for proper alignment when the DTB appending feature
is used.

Signed-off-by: Nicolas Pitre <nicolas.pitre@linaro.org>
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
