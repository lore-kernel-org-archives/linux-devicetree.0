From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH v4 0/3] Add R8A7791/Henninger board CAN DT support
Date: Sat, 27 Dec 2014 02:16:26 +0300
Message-ID: <6830301.90YaDPuTpx@wasted.cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-sh-owner@vger.kernel.org>
Sender: linux-sh-owner@vger.kernel.org
To: horms@verge.net.au, linux-sh@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devicetree@vger.kernel.org
Cc: magnus.damm@gmail.com, linux@arm.linux.org.uk, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hello.

   Here's the set of 3 patches against Simon Horman's 'renesas.git' repo,
'renesas-devel-20141223-v3.19-rc1' tag. Here we add the CAN device tree support
for the R8A7791-based Henninger board. It depends on the clk driver RCAN clock
patch posted recently in order to work.

[1/3] ARM: shmobile: r8a7791: add CAN clocks
[2/3] ARM: shmobile: r8a7791: add CAN DT support
[3/3] ARM: shmobile: henninger: add CAN0 DT support

WBR, Sergei

