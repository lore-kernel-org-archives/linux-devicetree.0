Return-Path: <SRS0=BDCp=M3=gmail.com=ykaneko0929@kernel.org>
From: Yoshihiro Kaneko <ykaneko0929@gmail.com>
Subject: [PATCH/RFT 0/2] thermal: add suport for R8A77990
Date: Mon, 15 Oct 2018 23:11:57 +0900
Message-Id: <1539612719-9650-1-git-send-email-ykaneko0929@gmail.com>
To: linux-pm@vger.kernel.org
Cc: Zhang Rui <rui.zhang@intel.com>, Eduardo Valentin <edubezval@gmail.com>, Rob Herring <robh+dt@kernel.org>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

This series adds thermal support for R-Car E3 (R8A77990).

This series is based on the next branch of Eduardo Valentin's linux-soc-thermal
tree.

Yoshihiro Kaneko (2):
  dt-bindings: thermal: rcar-thermal: add R8A77990 support
  thermal: rcar_thermal: add R8A77990 support

 Documentation/devicetree/bindings/thermal/rcar-thermal.txt | 5 +++--
 drivers/thermal/rcar_thermal.c                             | 4 ++++
 2 files changed, 7 insertions(+), 2 deletions(-)

-- 
1.9.1
