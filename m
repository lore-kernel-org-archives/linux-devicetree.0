From: Guodong Xu <guodong.xu@linaro.org>
Subject: [PATCH v5 1/8] mfd: hi6421-pmic: cleanup: change license text to shorter form
Date: Wed,  7 Jun 2017 15:05:59 +0800
Message-ID: <20170607070606.8889-2-guodong.xu@linaro.org>
References: <20170607070606.8889-1-guodong.xu@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170607070606.8889-1-guodong.xu@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: lee.jones@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, xuwei5@hisilicon.com, catalin.marinas@arm.com, will.deacon@arm.com, lgirdwood@gmail.com, broonie@kernel.org, khilman@baylibre.com, arnd@arndb.de, gregory.clement@free-electrons.com, horms+renesas@verge.net.au, olof@lixom.net, thomas.petazzoni@free-electrons.com, yamada.masahiro@socionext.com, riku.voipio@linaro.org, treding@nvidia.com, krzk@kernel.org, eric@anholt.net, damm+renesas@opensource.se, ard.biesheuvel@linaro.org, linus.walleij@linaro.org, geert+renesas@glider.be
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Guodong Xu <guodong.xu@linaro.org>
List-Id: devicetree@vger.kernel.org

Change license text to a shorter form of GPLv2.

Signed-off-by: Guodong Xu <guodong.xu@linaro.org>
---
 drivers/mfd/hi6421-pmic-core.c | 13 ++-----------
 1 file changed, 2 insertions(+), 11 deletions(-)

diff --git a/drivers/mfd/hi6421-pmic-core.c b/drivers/mfd/hi6421-pmic-core.c
index 3fd703f..ad9e3d8 100644
--- a/drivers/mfd/hi6421-pmic-core.c
+++ b/drivers/mfd/hi6421-pmic-core.c
@@ -9,17 +9,8 @@
  * Author: Guodong Xu <guodong.xu@linaro.org>
  *
  * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program.  If not, see <http://www.gnu.org/licenses/>.
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
  */
 
 #include <linux/device.h>
-- 
2.10.2
