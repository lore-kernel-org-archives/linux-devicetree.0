From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH 0/2] Add R8A7794/SILK board SDHI DT support
Date: Sun, 22 Feb 2015 01:25:09 +0300
Message-ID: <10037494.4LD4T2QGPX@wasted.cogentembedded.com>
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
'renesas-devel-20150220-v3.19' tag. Here we add the SDHI device tree support
for the R8A7794-based SILK board. It depends on the other R8A7794/SILK patches
in order to apply, on the R8A7794 GPIO patches in order to apply/compile, and
on the R8A7794 SDHI PFC driver patch in order for the pins to be configured.

[1/2] ARM: shmobile: r8a7794: add SDHI DT support
[2/2] ARM: shmobile: silk: add SDHI0/1 DT support

WBR, Sergei

