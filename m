From: Simon Glass <sjg@chromium.org>
Subject: [PATCH v4 06/10] tegra: fdt: Add keyboard controller
	definition
Date: Tue, 17 Apr 2012 12:01:33 -0700
Message-ID: <1334689297-13489-7-git-send-email-sjg@chromium.org>
References: <1334689297-13489-1-git-send-email-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <u-boot-bounces@lists.denx.de>
In-Reply-To: <1334689297-13489-1-git-send-email-sjg@chromium.org>
List-Unsubscribe: <http://lists.denx.de/mailman/options/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=unsubscribe>
List-Archive: <http://lists.denx.de/pipermail/u-boot>
List-Post: <mailto:u-boot@lists.denx.de>
List-Help: <mailto:u-boot-request@lists.denx.de?subject=help>
List-Subscribe: <http://lists.denx.de/mailman/listinfo/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=subscribe>
Sender: u-boot-bounces@lists.denx.de
Errors-To: u-boot-bounces@lists.denx.de
To: U-Boot Mailing List <u-boot@lists.denx.de>
Cc: Anton Staff <robotboy@chromium.org>, Jerry Van Baren <vanbaren@cideas.com>, Tom Warren <twarren@nvidia.com>, Devicetree Discuss <devicetree-discuss@lists.ozlabs.org>
List-Id: devicetree@vger.kernel.org

From: Anton Staff <robotboy@chromium.org>

The Tegra keyboard controller provides a simple interface to a matrix
keyboard.

Signed-off-by: Simon Glass <sjg@chromium.org>
---

 arch/arm/dts/tegra20.dtsi |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/arch/arm/dts/tegra20.dtsi b/arch/arm/dts/tegra20.dtsi
index 018a3c8..5d214f2 100644
--- a/arch/arm/dts/tegra20.dtsi
+++ b/arch/arm/dts/tegra20.dtsi
@@ -206,4 +206,9 @@
 		compatible = "nvidia,tegra20-nand";
 		reg = <0x70008000 0x100>;
 	};
+
+	kbc@7000e200 {
+		compatible = "nvidia,tegra20-kbc";
+		reg = <0x7000e200 0x0078>;
+	};
 };
-- 
1.7.7.3
