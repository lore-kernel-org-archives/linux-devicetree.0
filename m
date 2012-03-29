From: Viresh Kumar <viresh.kumar-qxv4g6HH51o@public.gmane.org>
Subject: [PATCH V3 3/7] SPEAr6xx: Add compilation support for dtbs using 'make
 dtbs'
Date: Thu, 29 Mar 2012 16:11:01 +0530
Message-ID: <b60bcdd8cca9d6d2bca5741344708599cae4f591.1333017183.git.viresh.kumar@st.com>
References: <cover.1333017183.git.viresh.kumar@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <cover.1333017183.git.viresh.kumar-qxv4g6HH51o@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org
Cc: Viresh Kumar <viresh.kumar-qxv4g6HH51o@public.gmane.org>, devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, spear-devel-nkJGhpqTU55BDgjK7y7TUQ@public.gmane.org, viresh.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, sr-ynQEQJNshbs@public.gmane.org
List-Id: devicetree@vger.kernel.org

'make dtbs' compiles all dtbs for a family. For this we need to add entries for
all board dtb's in Makefile.boot file. This patch does it.

Signed-off-by: Viresh Kumar <viresh.kumar-qxv4g6HH51o@public.gmane.org>
---
 arch/arm/mach-spear6xx/Makefile.boot |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

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
1.7.9
