From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH v2 0/5] Add R8A7794 sound DT support
Date: Wed, 10 Feb 2016 00:52:09 +0300
Message-ID: <12033353.rt0nolnBmD@wasted.cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: horms@verge.net.au, linux-renesas-soc@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devicetree@vger.kernel.org
Cc: magnus.damm@gmail.com, linux@arm.linux.org.uk, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hello.

   Here's the set of 5 patches against Simon Horman's 'renesas.git' repo,
'renesas-devel-20160208-v4.5-rc3' tag. I'm adding the sound device tree support
for the R8A7794 SoC. The sound patch for the SILK board will be posted RSN. :-)

[1/5] ARM: dts: r8a7794: add audio clocks
[2/5] ARM: dts: r8a7794: add MSTP5 clocks
[3/5] ARM: dts: r8a7794: add MSTP10 clocks
[4/5] ARM: dts: r8a7794: add Audio-DMAC support
[5/5] ARM: dts: r8a7794 add sound support

WBR, Sergei
