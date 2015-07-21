From: Jisheng Zhang <jszhang@marvell.com>
Subject: [PATCH 3/3] arm64: dts: freescale: remove paragraph about writing to FSF
Date: Tue, 21 Jul 2015 22:44:00 +0800
Message-ID: <1437489840-2368-4-git-send-email-jszhang@marvell.com>
References: <1437489840-2368-1-git-send-email-jszhang@marvell.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1437489840-2368-1-git-send-email-jszhang@marvell.com>
Sender: linux-kernel-owner@vger.kernel.org
To: catalin.marinas@arm.com, will.deacon@arm.com, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Jisheng Zhang <jszhang@marvell.com>
List-Id: devicetree@vger.kernel.org

Remove paragraph about writing to the Free Software Foundation's
mailing address from GPL notice.

Signed-off-by: Jisheng Zhang <jszhang@marvell.com>
---
 arch/arm64/boot/dts/freescale/fsl-ls2085a-simu.dts | 5 -----
 arch/arm64/boot/dts/freescale/fsl-ls2085a.dtsi     | 5 -----
 2 files changed, 10 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls2085a-simu.dts b/arch/arm64/boot/dts/freescale/fsl-ls2085a-simu.dts
index 82e2a6f..a2c1865 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls2085a-simu.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-ls2085a-simu.dts
@@ -20,11 +20,6 @@
  *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  *     GNU General Public License for more details.
  *
- *     You should have received a copy of the GNU General Public
- *     License along with this library; if not, write to the Free
- *     Software Foundation, Inc., 51 Franklin St, Fifth Floor, Boston,
- *     MA 02110-1301 USA
- *
  * Or, alternatively,
  *
  *  b) Permission is hereby granted, free of charge, to any person
diff --git a/arch/arm64/boot/dts/freescale/fsl-ls2085a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls2085a.dtsi
index e281ceb..ab69a5b 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls2085a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls2085a.dtsi
@@ -20,11 +20,6 @@
  *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  *     GNU General Public License for more details.
  *
- *     You should have received a copy of the GNU General Public
- *     License along with this library; if not, write to the Free
- *     Software Foundation, Inc., 51 Franklin St, Fifth Floor, Boston,
- *     MA 02110-1301 USA
- *
  * Or, alternatively,
  *
  *  b) Permission is hereby granted, free of charge, to any person
-- 
2.1.4
