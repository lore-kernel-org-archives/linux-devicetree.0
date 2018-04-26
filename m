Return-Path: <SRS0=DPw9=HP=ragnatech.se=niklas.soderlund+renesas@kernel.org>
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v2 0/2] thermal: rcar_gen3_thermal: add r8a77965 support
Date: Thu, 26 Apr 2018 21:42:00 +0200
Message-Id: <20180426194202.31662-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: Rob Herring <robh+dt@kernel.org>, Eduardo Valentin <edubezval@gmail.com>, linux-pm@vger.kernel.org, devicetree@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org, =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
List-ID: <devicetree@vger.kernel.org>

Hi,

This series adds DT documentation and driver support to the 
rcar-gen3-thermal driver for r8a77965.

See each patch for individual changelog.

Niklas Söderlund (2):
  dt-bindings: thermal: rcar-gen3-thermal: add r8a77965
  thermal: rcar_gen3_thermal: add r8a77965 support

 .../devicetree/bindings/thermal/rcar-gen3-thermal.txt          | 3 ++-
 drivers/thermal/rcar_gen3_thermal.c                            | 1 +
 2 files changed, 3 insertions(+), 1 deletion(-)

-- 
2.17.0
