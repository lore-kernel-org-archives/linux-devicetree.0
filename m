From: Kevin Brodsky <kevin.brodsky@arm.com>
Subject: [PATCH] arm64: dts: fast models: Increase clcd's max-memory-bandwidth
Date: Thu, 25 Jul 2019 15:50:40 +0100
Message-ID: <20190725145040.42182-1-kevin.brodsky@arm.com>
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
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Ruben Ayrapetyan <ruben.ayrapetyan@arm.com>, Linus Walleij <linus.walleij@linaro.org>, Kevin Brodsky <kevin.brodsky@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, dri-devel@lists.freedesktop.org, Sudeep Holla <sudeep.holla@arm.com>, Brian Starkey <brian.starkey@arm.com>
List-Id: devicetree@vger.kernel.org

It may be desirable on certain platforms, such as Android, to
use 32bpp buffers. Since there is no clear bandwidth limit for the
CLCD component on the fast model, let's increase
max-memory-bandwidth to allow using 32bpp buffers.

Reported-by: Ruben Ayrapetyan <ruben.ayrapetyan@arm.com>
Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
---
 arch/arm64/boot/dts/arm/fvp-base-revc.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/arm/fvp-base-revc.dts b/arch/arm64/boot/dts/arm/fvp-base-revc.dts
index 687707020ec1..3aee49ed6d88 100644
--- a/arch/arm64/boot/dts/arm/fvp-base-revc.dts
+++ b/arch/arm64/boot/dts/arm/fvp-base-revc.dts
@@ -269,7 +269,7 @@
 		motherboard {
 			iofpga@3,00000000 {
 				clcd@1f0000 {
-					max-memory-bandwidth = <130000000>; /* 16bpp @ 63.5MHz */
+					max-memory-bandwidth = <260000000>; /* 32bpp @ 63.5MHz */
 				};
 			};
 		};
-- 
2.22.0
