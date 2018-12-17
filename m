Return-Path: <SRS0=oElv=O2=gmail.com=ykaneko0929@kernel.org>
From: Yoshihiro Kaneko <ykaneko0929@gmail.com>
Subject: [PATCH/RFT v2 0/2] thermal: add suport for R8A77990
Date: Mon, 17 Dec 2018 23:50:19 +0900
Message-Id: <1545058221-22529-1-git-send-email-ykaneko0929@gmail.com>
To: linux-pm@vger.kernel.org
Cc: Zhang Rui <rui.zhang@intel.com>, Eduardo Valentin <edubezval@gmail.com>, Rob Herring <robh+dt@kernel.org>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

This series adds thermal support for R-Car E3 (R8A77990).

This series is based on the master branch of Linus Torvalds's linux tree.

v2 [Yoshihiro Kaneko]
- Rebased on latest Linus master branch

Yoshihiro Kaneko (2):
  dt-bindings: thermal: rcar-thermal: add R8A77990 support
  thermal: rcar_thermal: add R8A77990 support

 Documentation/devicetree/bindings/thermal/rcar-thermal.txt | 5 +++--
 drivers/thermal/rcar_thermal.c                             | 4 ++++
 2 files changed, 7 insertions(+), 2 deletions(-)

-- 
1.9.1
