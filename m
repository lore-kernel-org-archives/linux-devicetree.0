From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH v2 0/11] Add R8A7745/SK-RZG1E board support
Date: Sat, 05 Nov 2016 00:42:33 +0300
Message-ID: <2368353.xfo5beGC5E@wasted.cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: horms@verge.net.au, linux-renesas-soc@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org
Cc: magnus.damm@gmail.com, linux@arm.linux.org.uk, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hello.

   Here's the set of 11 patches against Simon Horman's 'renesas.git' repo's
'renesas-devel-201611104-v4.9-rc3' tag plus the R8A7743/SK-RZG1M patch series
posted earlier. I'm adding the device tree support for the R8A7745-based
SK-RZG1E board. The SoC is close to R8A7794 and the board seems identical to the
R8A7794/SILK board. The device tree patches depend on the R8A7745 CPG/MSSR
driver series in order to compile and work.

[01/11] ARM: shmobile: r8a7745: add power domain index macros
[02/11] soc: renesas: rcar-sysc: add R8A7745 support
[03/11] ARM: shmobile: r8a7745: basic SoC support
[04/11] ARM: dts: r8a7745: initial SoC device tree
[05/11] ARM: dts: r8a7745: add SYS-DMAC support
[06/11] ARM: dts: r8a7745: add [H]SCIF{|A|B} support
[07/11] ARM: dts: r8a7745: add Ether support
[08/11] ARM: dts: r8a7745: add IRQC support
[09/11] ARM: shmobile: document SK-RZG1E board
[10/11] ARM: dts: sk-rzg1e: initial device tree
[11/11] ARM: dts: sk-rzg1e: add Ether support

WBR, Sergei
