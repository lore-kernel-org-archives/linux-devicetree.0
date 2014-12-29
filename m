From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH 0/2] Add R8A7790 CAN DT support
Date: Tue, 30 Dec 2014 01:03:10 +0300
Message-ID: <2616635.bsb7mLynhA@wasted.cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-sh-owner@vger.kernel.org>
Sender: linux-sh-owner@vger.kernel.org
To: horms@verge.net.au, linux-sh@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devicetree@vger.kernel.org
Cc: magnus.damm@gmail.com, linux@arm.linux.org.uk, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hello.

   Here's the set of 2 patches against Simon Horman's 'renesas.git' repo,
'renesas-devel-20141229-v3.19-rc2' tag. Here we add the CAN device tree support
for the R8A7790 SoC (unfortunately, it's impossible to test CAN on the Lager
board). It depends on the clk driver RCAN clock patch posted recently in order
to work.

[1/2] ARM: shmobile: r8a7790: add CAN clocks
[2/2] ARM: shmobile: r8a7790: add CAN DT support

WBR, Sergei

