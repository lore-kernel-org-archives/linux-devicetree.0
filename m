From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] ARM: dts: versatile: use #include "..." to include local DT
Date: Wed, 24 May 2017 14:10:10 +0900
Message-ID: <1495602610-18667-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: arm@kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Russell King <linux@armlinux.org.uk>, Masahiro Yamada <yamada.masahiro@socionext.com>, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Most of DT files in ARM use #include "..." to make pre-processor
include DT in the same directory, but this is one of the exceptional
files that use #include <...> for that.

Fix it to remove -I$(srctree)/arch/$(SRCARCH)/boot/dts path from
dtc_cpp_flags.

ARM: dts: versatile: use #include "..." to include DT in the same directory

Most of DT files in ARM use #include "..." to make pre-processor
include DT in the same directory, but we have 3 exceptional files
that use #include <...> for that.

They must be fixed to remove -I$(srctree)/arch/$(SRCARCH)/boot/dts
path from dtc_cpp_flags.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Arnd, Olof,
I could not find a sub-arch maintainer for versatile.
If nobody picks up this, could you take care of this?



 arch/arm/boot/dts/versatile-pb.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/versatile-pb.dts b/arch/arm/boot/dts/versatile-pb.dts
index 33a8eb28374e..06e2331f666d 100644
--- a/arch/arm/boot/dts/versatile-pb.dts
+++ b/arch/arm/boot/dts/versatile-pb.dts
@@ -1,4 +1,4 @@
-#include <versatile-ab.dts>
+#include "versatile-ab.dts"
 
 / {
 	model = "ARM Versatile PB";
-- 
2.7.4
