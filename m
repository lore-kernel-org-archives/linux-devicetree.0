From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH 00/13] Add R8A7794/SILK board eMMC DT support
Date: Wed, 01 Jun 2016 01:06:37 +0300
Message-ID: <13205049.n7pM8utpHF@wasted.cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: horms@verge.net.au, linux-renesas-soc@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devicetree@vger.kernel.org
Cc: magnus.damm@gmail.com, linux@arm.linux.org.uk, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hello.

   Here's the set of 13 patches against Simon Horman's 'renesas.git' repo,
'renesas-devel-20160530-v4.7-rc1' tag. We add the device tree support for
the R8A7792-based Blanche board. The R-Car 'clk' driver patch was posted last
week separately...

[01/13] ARM: shmobile: r8a7792: add clock index macros
[02/13] ARM: shmobile: r8a7792: add power domain index macros
[03/13] soc: renesas: rcar-sysc: add R8A7792 support
[04/13] ARM: shmobile: r8a7792: basic SoC support
[05/13] DT: clock: rcar-gen2-cpg-clocks: document R8A7792 support
[06/13] DT: clock: cpg-mstp-clocks: document-R8A7792-support
[07/13] ARM: dts: r8a7792: initial SoC device tree
[08/13] ARM: dts: r8a7792: add SYS-DMAC support
[09/13] ARM: dts: r8a7792: add [H]SCIF support
[10/13] ARM dts: r8a7792: add IRQC support
[11/13] DT: arm: shmobile: document Blanche board
[12/13] ARM: dts: blanche: initial device tree
[13/13] ARM: dts: blanche: add Ethernet support

WBR, Sergei
