From: Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH 0/5] Add SYS-DMAC/INTC-EX/[H]SCIF/EAVB/RWDT support
Date: Thu, 23 Aug 2018 09:58:46 +0100
Message-ID: <1535014731-64472-1-git-send-email-biju.das@bp.renesas.com>
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

This patch series aims to add support for SYS-DMAC/INTC-EX/SCIF/HSCIF/
EAVB/RWDT on RZ/G2M SoC dtsi.

THis patch series based on renesas-devel-20180822-v4.18.

Biju Das (3):
  arm64: dts: renesas: r8a774a1: Add SYS-DMAC controller nodes
  arm64: dts: renesas: r8a774a1: Add INTC-EX device node
  arm64: dts: renesas: r8a774a1: Add RWDT node

Fabrizio Castro (2):
  arm64: dts: renesas: r8a774a1: Add SCIF and HSCIF nodes
  arm64: dts: renesas: r8a774a1: Add Ethernet AVB node

 arch/arm64/boot/dts/renesas/r8a774a1.dtsi | 358 ++++++++++++++++++++++++++++++
 1 file changed, 358 insertions(+)

-- 
2.7.4
