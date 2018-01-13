From: Daniel Golle <daniel@makrotopia.org>
Subject: [PATCH] ARM: dts: rename oxnas dts files
Date: Sat, 13 Jan 2018 18:32:59 +0100
Message-ID: <20180113173253.GA30674@makrotopia.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: devicetree@vger.kernel.org, arm@kernel.org, linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>, Rob Herring <robh@kernel.org>
List-Id: devicetree@vger.kernel.org

Other platforms' device-tree files start with a platform prefix, such as
sun7i-a20-*.dts or at91-*.dts.
This naming scheme turns out to be handy when using multi-platform build
systems such as OpenWrt.
Prepend oxnas files with their platform prefix to comply with the naming
scheme already used for most other platforms.

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 arch/arm/boot/dts/{wd-mbwe.dts => ox810se-wd-mbwe.dts}                    | 0
 ...nes-pogoplug-series-3.dts => ox820-cloudengines-pogoplug-series-3.dts} | 0
 2 files changed, 0 insertions(+), 0 deletions(-)
 rename arch/arm/boot/dts/{wd-mbwe.dts => ox810se-wd-mbwe.dts} (100%)
 rename arch/arm/boot/dts/{cloudengines-pogoplug-series-3.dts => ox820-cloudengines-pogoplug-series-3.dts} (100%)

diff --git a/arch/arm/boot/dts/wd-mbwe.dts b/arch/arm/boot/dts/ox810se-wd-mbwe.dts
similarity index 100%
rename from arch/arm/boot/dts/wd-mbwe.dts
rename to arch/arm/boot/dts/ox810se-wd-mbwe.dts
diff --git a/arch/arm/boot/dts/cloudengines-pogoplug-series-3.dts b/arch/arm/boot/dts/ox820-cloudengines-pogoplug-series-3.dts
similarity index 100%
rename from arch/arm/boot/dts/cloudengines-pogoplug-series-3.dts
rename to arch/arm/boot/dts/ox820-cloudengines-pogoplug-series-3.dts
-- 
2.15.1
