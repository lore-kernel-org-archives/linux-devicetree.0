From: Kevin Cernekee <cernekee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH/RFC 01/17] MIPS: BMIPS: Fix ".previous without corresponding .section" warnings
Date: Mon, 20 Oct 2014 21:27:51 -0700
Message-ID: <1413865687-15255-2-git-send-email-cernekee@gmail.com>
References: <1413865687-15255-1-git-send-email-cernekee@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1413865687-15255-1-git-send-email-cernekee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org
Cc: f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, mbizon-MmRyKUhfbQ9GWvitb5QawA@public.gmane.org, jogo-p3rKhJxN3npAfugRpC6u6w@public.gmane.org, jfraser-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Commit 078a55fc824c1 ("Delete __cpuinit/__CPUINIT usage from MIPS code")
removed our __CPUINIT directives, so now the ".previous" directives
are superfluous.  Remove them.

Signed-off-by: Kevin Cernekee <cernekee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 arch/mips/kernel/bmips_vec.S | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/mips/kernel/bmips_vec.S b/arch/mips/kernel/bmips_vec.S
index 290c23b..8649507 100644
--- a/arch/mips/kernel/bmips_vec.S
+++ b/arch/mips/kernel/bmips_vec.S
@@ -208,7 +208,6 @@ bmips_reset_nmi_vec_end:
 END(bmips_reset_nmi_vec)
 
 	.set	pop
-	.previous
 
 /***********************************************************************
  * CPU1 warm restart vector (used for second and subsequent boots).
@@ -281,5 +280,3 @@ LEAF(bmips_enable_xks01)
 	jr	ra
 
 END(bmips_enable_xks01)
-
-	.previous
-- 
2.1.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
