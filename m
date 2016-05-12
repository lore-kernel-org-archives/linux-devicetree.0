From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH v3 0/6] Add R8A7794/SILK sound DT support
Date: Thu, 12 May 2016 23:38:08 +0300
Message-ID: <2378837.cigT3tNQPe@wasted.cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: horms@verge.net.au, linux-renesas-soc@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devicetree@vger.kernel.org
Cc: magnus.damm@gmail.com, linux@arm.linux.org.uk, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hello.

   Here's the set of 6 patches against Simon Horman's 'renesas.git' repo,
'renesas-devel-20160509-v4.6-rc7' tag. I'm adding the sound device tree support
for the R8A7794 SoC based SILK board.

[1/6] ARM: dts: r8a7794: add audio clocks
[2/6] ARM: dts: r8a7794: add MSTP5 clocks
[3/6] ARM: dts: r8a7794: add MSTP10 clocks
[4/6] ARM: dts: r8a7794: add Audio-DMAC support
[5/6] ARM: dts: r8a7794: add sound support
[6/6] ARM: dts: silk: add sound support

WBR, Sergei
