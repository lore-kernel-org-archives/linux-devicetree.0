From: Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH 0/3] Add USB support
Date: Fri, 24 Aug 2018 11:43:46 +0100
Message-ID: <1535107429-5458-1-git-send-email-biju.das@bp.renesas.com>
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
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>, devicetree@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, Biju Das <biju.das@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, Simon Horman <horms@verge.net.au>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

This patch series aims to add USB2.0/USB3.0 Host/Function support
for RZ/G2M SoC. RZ/G2M SoC is similar to R-Car Gen3 M3-W SoC.

---
This patch series depend on
https://patchwork.kernel.org/patch/10574109/
---

Biju Das (3):
  arm64: dts: renesas: r8a774a1: Add USB2.0 phy and host(EHCI/OHCI)
    device nodes
  arm64: dts: renesas: r8a774a1: Add USB-DMAC and HSUSB device nodes
  arm64: dts: renesas: r8a774a1: Add USB3.0 device nodes

 arch/arm64/boot/dts/renesas/r8a774a1.dtsi | 153 ++++++++++++++++++++++++++++++
 1 file changed, 153 insertions(+)

-- 
2.7.4
