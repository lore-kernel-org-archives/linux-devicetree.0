From: Kevin Cernekee <cernekee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH V6 14/25] MIPS: Reorder MIPS_L1_CACHE_SHIFT priorities
Date: Thu, 25 Dec 2014 09:49:09 -0800
Message-ID: <1419529760-9520-15-git-send-email-cernekee@gmail.com>
References: <1419529760-9520-1-git-send-email-cernekee@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1419529760-9520-1-git-send-email-cernekee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org
Cc: f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jaedon.shin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org, jogo-p3rKhJxN3npAfugRpC6u6w@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Enabling support for more than one BMIPS CPU in the same build may
result in different L1_CACHE_SHIFT values, e.g.

    CPU_BMIPS5000 selects MIPS_L1_CACHE_SHIFT_7
    CPU_BMIPS4380 selects MIPS_L1_CACHE_SHIFT_6
    anything else defaults to MIPS_L1_CACHE_SHIFT_5

Ensure that if more than one MIPS_L1_CACHE_SHIFT_x option is selected,
Kconfig sets CONFIG_MIPS_L1_CACHE_SHIFT to the highest value.

Signed-off-by: Kevin Cernekee <cernekee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 arch/mips/Kconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 31bbec0..d28c29e 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -1193,10 +1193,10 @@ config MIPS_L1_CACHE_SHIFT_7
 
 config MIPS_L1_CACHE_SHIFT
 	int
-	default "4" if MIPS_L1_CACHE_SHIFT_4
-	default "5" if MIPS_L1_CACHE_SHIFT_5
-	default "6" if MIPS_L1_CACHE_SHIFT_6
 	default "7" if MIPS_L1_CACHE_SHIFT_7
+	default "6" if MIPS_L1_CACHE_SHIFT_6
+	default "5" if MIPS_L1_CACHE_SHIFT_5
+	default "4" if MIPS_L1_CACHE_SHIFT_4
 	default "5"
 
 config HAVE_STD_PC_SERIAL_PORT
-- 
2.1.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
