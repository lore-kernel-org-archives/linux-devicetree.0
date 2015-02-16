From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH 0/2 resend] Add R8A7794/SILK board eMMC DT support
Date: Tue, 17 Feb 2015 01:57:37 +0300
Message-ID: <29687119.ELU9MoH02q@wasted.cogentembedded.com>
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
'renesas-devel-20150215-v3.19' tag. Here we add the eMMC device tree support
for the R8A7794-based SILK board. It depends on the other R8A7794/SILK patches
posted last week in order to apply, and on the R8A7794 MMCIF PFC driver patch
in order for the pins to be configured.

[1/2] ARM: shmobile: r8a7794: add MMCIF DT support
[2/2] ARM: shmobile: silk: add eMMC DT support

WBR, Sergei

