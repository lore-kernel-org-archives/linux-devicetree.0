Return-Path: <SRS0=mJni=WF=vergenet.net=horms@kernel.org>
From: Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH v2 0/4] dt-bindings: i2c: renesas: Rename bindings documentation files
Date: Fri,  9 Aug 2019 14:30:00 -0700
Message-Id: <20190809213004.31181-1-horms+renesas@verge.net.au>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, Chris Brandt <chris.brandt@renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Magnus Damm <magnus.damm@gmail.com>, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Simon Horman <horms+renesas@verge.net.au>
List-ID: <devicetree@vger.kernel.org>

Rename the bindings documentation file for Renesas I2C controllers.

This is part of an ongoing effort to name bindings documentation files for
Renesas IP blocks consistently, in line with the compat strings they
document.

Based on v5.3-rc1

Changes since v1
* Accumulate review tags
* Correct changelogs

Simon Horman (4):
  dt-bindings: i2c: sh_mobile: Rename bindings documentation file
  dt-bindings: i2c: rcar: Rename bindings documentation file
  dt-bindings: i2c: riic: Rename bindings documentation file
  dt-bindings: i2c: i2c-emev2: Rename bindings documentation file

 .../devicetree/bindings/i2c/{i2c-rcar.txt => renesas,i2c.txt}     | 0
 .../bindings/i2c/{i2c-emev2.txt => renesas,iic-emev2.txt}         | 0
 .../bindings/i2c/{i2c-sh_mobile.txt => renesas,iic.txt}           | 0
 .../devicetree/bindings/i2c/{i2c-riic.txt => renesas,riic.txt}    | 0
 MAINTAINERS                                                       | 8 ++++----
 5 files changed, 4 insertions(+), 4 deletions(-)
 rename Documentation/devicetree/bindings/i2c/{i2c-rcar.txt => renesas,i2c.txt} (100%)
 rename Documentation/devicetree/bindings/i2c/{i2c-emev2.txt => renesas,iic-emev2.txt} (100%)
 rename Documentation/devicetree/bindings/i2c/{i2c-sh_mobile.txt => renesas,iic.txt} (100%)
 rename Documentation/devicetree/bindings/i2c/{i2c-riic.txt => renesas,riic.txt} (100%)

-- 
2.11.0
