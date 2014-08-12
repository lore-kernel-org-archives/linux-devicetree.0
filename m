From: sergei.shtylyov@cogentembedded.com
Subject: [PATCH v5 0/2] Add VIN and ADV7180 device tree support for R8A7790/Lager board
Date: Wed, 13 Aug 2014 00:10:19 +0400
Message-ID: <1793694.Z8xUpkGDQx@wasted.cogentembedded.com>
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
'renesas-devel-v3.16-20140811' tag. Here Ben Dooks adds the VIN and ADV7180
video decoder device tree support on the R8A7790/Lager board. The patchset
requires Ben Dooks' 'rcar_vin' and 'soc_camera' DT support patches (already
merged to the 'media_tree.git' repo) in order to work.

[1/2] ARM: shmobile: r8a7790: add VIN device nodes
[2/2] ARM: shmobile: lager: add VIN1/ADV7180 device nodes

WBR, Sergei

