From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: [PATCH 3.16-stable 80/87] MIPS: BMIPS: Fix ".previous without corresponding .section" warnings
Date: Fri,  5 May 2017 21:47:38 +0200
Message-ID: <20170505194745.3627137-81-arnd@arndb.de>
References: <20170505194745.3627137-1-arnd@arndb.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170505194745.3627137-1-arnd-r2nGTMty4D4@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ben Hutchings <ben-/+tVBieCtBitmTQ+vhA3Yw@public.gmane.org>
Cc: stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kevin Cernekee <cernekee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, mbizon-MmRyKUhfbQ9GWvitb5QawA@public.gmane.org, jogo-p3rKhJxN3npAfugRpC6u6w@public.gmane.org, jfraser-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Kevin Cernekee <cernekee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Commit dd9e0165f1edf9c5af0ceeabae592f9911a1569d upstream.

Commit 078a55fc824c1 ("Delete __cpuinit/__CPUINIT usage from MIPS code")
removed our __CPUINIT directives, so now the ".previous" directives
are superfluous.  Remove them.

Signed-off-by: Kevin Cernekee <cernekee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: mbizon-MmRyKUhfbQ9GWvitb5QawA@public.gmane.org
Cc: jogo-p3rKhJxN3npAfugRpC6u6w@public.gmane.org
Cc: jfraser-dY08KVG/lbpWk0Htik3J/w@public.gmane.org
Cc: linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Patchwork: https://patchwork.linux-mips.org/patch/8156/
Signed-off-by: Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>
Signed-off-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
---
 arch/mips/kernel/bmips_vec.S | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/mips/kernel/bmips_vec.S b/arch/mips/kernel/bmips_vec.S
index d4614d31d828..d9495f3f3fad 100644
--- a/arch/mips/kernel/bmips_vec.S
+++ b/arch/mips/kernel/bmips_vec.S
@@ -211,7 +211,6 @@ bmips_reset_nmi_vec_end:
 END(bmips_reset_nmi_vec)
 
 	.set	pop
-	.previous
 
 /***********************************************************************
  * CPU1 warm restart vector (used for second and subsequent boots).
@@ -286,5 +285,3 @@ LEAF(bmips_enable_xks01)
 	jr	ra
 
 END(bmips_enable_xks01)
-
-	.previous
-- 
2.9.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
