From: Ben Hutchings <ben@decadent.org.uk>
Subject: [PATCH 3.16 277/294] MIPS: BMIPS: Fix ".previous without
 corresponding .section" warnings
Date: Mon, 06 Nov 2017 23:03:02 +0000
Message-ID: <lsq.1510009382.234145624@decadent.org.uk>
References: <lsq.1510009377.526284287@decadent.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-mips-bounce@linux-mips.org>
Content-Disposition: inline
In-Reply-To: <lsq.1510009377.526284287@decadent.org.uk>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc: akpm@linux-foundation.org, Kevin Cernekee <cernekee@gmail.com>, jfraser@broadcom.com, linux-mips@linux-mips.org, f.fainelli@gmail.com, Arnd Bergmann <arnd@arndb.de>, mbizon@freebox.fr, Ralf Baechle <ralf@linux-mips.org>, devicetree@vger.kernel.org, jogo@openwrt.org
List-Id: devicetree@vger.kernel.org

3.16.50-rc1 review patch.  If anyone has any objections, please let me know.

------------------

From: Kevin Cernekee <cernekee@gmail.com>

commit 4ec8f9e9b08451303253249e4e302f10ee23d565 upstream.

Commit 078a55fc824c1 ("Delete __cpuinit/__CPUINIT usage from MIPS code")
removed our __CPUINIT directives, so now the ".previous" directives
are superfluous.  Remove them.

Signed-off-by: Kevin Cernekee <cernekee@gmail.com>
Cc: f.fainelli@gmail.com
Cc: mbizon@freebox.fr
Cc: jogo@openwrt.org
Cc: jfraser@broadcom.com
Cc: linux-mips@linux-mips.org
Cc: devicetree@vger.kernel.org
Patchwork: https://patchwork.linux-mips.org/patch/8156/
Signed-off-by: Ralf Baechle <ralf@linux-mips.org>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
---
 arch/mips/kernel/bmips_vec.S | 3 ---
 1 file changed, 3 deletions(-)

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
