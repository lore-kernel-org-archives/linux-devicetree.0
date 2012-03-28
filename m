From: Viresh Kumar <viresh.kumar@st.com>
Subject: [PATCH V2 3/7] SPEAr6xx: Add compilation support for dtbs using 'make
 dtbs'
Date: Wed, 28 Mar 2012 15:00:13 +0530
Message-ID: <bae0539600c2b9720b4d68dd9a19414a77d1626c.1332926608.git.viresh.kumar@st.com>
References: <cover.1332926608.git.viresh.kumar@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <cover.1332926608.git.viresh.kumar@st.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org, arnd@arndb.de
Cc: devicetree-discuss@ozlabs.org, spear-devel@list.st.com, viresh.linux@gmail.com, sr@denx.de, plagnioj@jcrosoft.com
List-Id: devicetree@vger.kernel.org

'make dtbs' compiles all dtbs for a family. For this we need to add entries for
all board dtb's in Makefile.boot file. This patch does it.

Signed-off-by: Viresh Kumar <viresh.kumar@st.com>
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
