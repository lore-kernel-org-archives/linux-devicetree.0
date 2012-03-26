From: Viresh Kumar <viresh.kumar-qxv4g6HH51o@public.gmane.org>
Subject: [PATCH 1/5] SPEAr6xx: Add compilation support for dtbs using 'make
 dtbs'
Date: Mon, 26 Mar 2012 17:13:57 +0530
Message-ID: <7f41195f813f788d9c72f139fcef2f024bf20a6a.1332762103.git.viresh.kumar@st.com>
References: <cover.1332762103.git.viresh.kumar@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <cover.1332762103.git.viresh.kumar-qxv4g6HH51o@public.gmane.org>
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
Cc: Viresh Kumar <viresh.kumar-qxv4g6HH51o@public.gmane.org>, devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, spear-devel-nkJGhpqTU55BDgjK7y7TUQ@public.gmane.org, viresh.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, sr-ynQEQJNshbs@public.gmane.org
List-Id: devicetree@vger.kernel.org

'make dtbs' compiles all dtbs for a family. For this we need to add entries for
all board dtb's in Makefile.boot file. This patch does it.

Signed-off-by: Viresh Kumar <viresh.kumar-qxv4g6HH51o@public.gmane.org>
---
 arch/arm/mach-spear6xx/Makefile.boot |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/mach-spear6xx/Makefile.boot b/arch/arm/mach-spear6xx/Makefile.boot
index 4674a4c..af493da 100644
--- a/arch/arm/mach-spear6xx/Makefile.boot
+++ b/arch/arm/mach-spear6xx/Makefile.boot
@@ -1,3 +1,5 @@
 zreladdr-y	+= 0x00008000
 params_phys-y	:= 0x00000100
 initrd_phys-y	:= 0x00800000
+
+dtb-$(CONFIG_BOARD_SPEAR600_DT)	+= spear600-evb.dtb
-- 
1.7.10.rc2.10.gb47606
