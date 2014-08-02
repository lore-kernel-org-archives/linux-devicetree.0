From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH v2 0/2] Add VIN and ADV7180 device tree support for R8A7791/Henninger board
Date: Sat, 2 Aug 2014 04:02:13 +0400
Message-ID: <201408020402.14560.sergei.shtylyov@cogentembedded.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-sh-owner@vger.kernel.org>
Sender: linux-sh-owner@vger.kernel.org
To: horms@verge.net.au, linux-sh@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devicetree@vger.kernel.org
Cc: magnus.damm@gmail.com, linux@arm.linux.org.uk, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hello.

   Here's the set of 2 patches against Simon Horman's 'renesas.git' repo,
'renesas-devel-v3.16-rc7-20140731v2' tag. Here we add the VIN and ADV7180 video
decoder device tree support on the R8A7791/Henninger board. The patchset
requires Ben Dooks' 'rcar_vin' and 'soc_camera' DT support patches already
merged to the 'media_tree.git' in order to work.

[1/2] ARM: shmobile: r8a7791: add VIN DT support
[2/2] ARM: shmobile: henninger: add VIN0/ADV7180 DT support

WBR, Sergei
