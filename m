From: Kevin Cernekee <cernekee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH/RFC 07/17] MIPS: Allow MIPS_CPU_SCACHE to be used with different line sizes
Date: Mon, 20 Oct 2014 21:27:57 -0700
Message-ID: <1413865687-15255-8-git-send-email-cernekee@gmail.com>
References: <1413865687-15255-1-git-send-email-cernekee@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1413865687-15255-1-git-send-email-cernekee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org
Cc: f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, mbizon-MmRyKUhfbQ9GWvitb5QawA@public.gmane.org, jogo-p3rKhJxN3npAfugRpC6u6w@public.gmane.org, jfraser-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

CONFIG_MIPS_CPU_SCACHE determines whether to build sc-mips.c.  However,
it is currently hardwired to use an L1_SHIFT of 6 (64 bytes).  Move the
L1_SHIFT selection into the CPU or SoC section so that other SoCs can
select different values.

Signed-off-by: Kevin Cernekee <cernekee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 arch/mips/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index ad6badb..37b085c 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -326,6 +326,7 @@ config MIPS_MALTA
 	select I8259
 	select MIPS_BONITO64
 	select MIPS_CPU_SCACHE
+	select MIPS_L1_CACHE_SHIFT_6
 	select PCI_GT64XXX_PCI0
 	select MIPS_MSC
 	select SWAP_IO_SPACE
@@ -1908,7 +1909,6 @@ config IP22_CPU_SCACHE
 config MIPS_CPU_SCACHE
 	bool
 	select BOARD_SCACHE
-	select MIPS_L1_CACHE_SHIFT_6
 
 config R5000_CPU_SCACHE
 	bool
-- 
2.1.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
