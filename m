From: Kieran Bingham <kieran@ksquared.org.uk>
Subject: [PATCH 0/4] RCar r8a7795 FCPF support
Date: Fri, 27 May 2016 18:19:20 +0100
Message-ID: <1464369565-12259-1-git-send-email-kieran@bingham.xyz>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: laurent.pinchart@ideasonboard.com, linux-renesas-soc@vger.kernel.org, kieran@ksquared.org.uk
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

An RCar FCP driver is available with support for the FCPV module for VSP.
This series updates that driver to support the FCPF and then provide the
relevant nodes in the r8a7795 device tree.

Checkpatch generates a warning on these DT references but they are
documented under Documentation/devicetree/bindings/media/renesas,fcp.txt

These patches are based on Geert's renesas-drivers tree, and are pushed
to a branch at git@github.com:kbingham/linux.git renesas/fcpf for
convenience.

Kieran Bingham (4):
  v4l: Extend FCP compatible list to support the FDP
  dt-bindings: Update Renesas R-Car FCP DT binding
  dt-bindings: Document Renesas R-Car FCP power-domains usage
  arm64: dts: r8a7795: add FCPF device nodes

 .../devicetree/bindings/media/renesas,fcp.txt       |  6 +++++-
 arch/arm64/boot/dts/renesas/r8a7795.dtsi            | 21 +++++++++++++++++++++
 drivers/media/platform/rcar-fcp.c                   |  1 +
 3 files changed, 27 insertions(+), 1 deletion(-)

-- 
2.5.0
