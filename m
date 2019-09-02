Return-Path: <SRS0=sI6G=W5=vger.kernel.org=devicetree-owner@kernel.org>
Received: from uho.ysoft.cz ([81.19.3.130]:43734 "EHLO uho.ysoft.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729623AbfIBLko (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 2 Sep 2019 07:40:44 -0400
From: =?UTF-8?q?Michal=20Vok=C3=A1=C4=8D?= <michal.vokac@ysoft.com>
Subject: [PATCH input-next 0/4] Add polling mode to the MPR121 touchkey
Date: Mon,  2 Sep 2019 13:40:13 +0200
Message-Id: <1567424417-3914-1-git-send-email-michal.vokac@ysoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh+dt@kernel.org>
Cc: Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>, linux-input@vger.kernel.org, devicetree@vger.kernel.org, =?UTF-8?q?Michal=20Vok=C3=A1=C4=8D?= <michal.vokac@ysoft.com>
List-ID: <devicetree@vger.kernel.org>

This series is another attempt to use the MPR121 touch sensor
controller in polling mode. This version uses the brand new
input-poller API that is currently queued in input/next.

Michal Vokáč (4):
  dt-bindings: input: Convert mpr121 binding to json-schema
  dt-bindings: input: mpr121: Add poll-interval property
  Input: mpr121: Add polling mode
  ARM: dts: imx6dl-yapp4: Enable the MPR121 touchkey controller on Hydra

 .../bindings/input/fsl,mpr121-touchkey.yaml        | 82 ++++++++++++++++++++++
 .../devicetree/bindings/input/mpr121-touchkey.txt  | 30 --------
 arch/arm/boot/dts/imx6dl-yapp4-common.dtsi         | 13 ++++
 arch/arm/boot/dts/imx6dl-yapp4-hydra.dts           |  4 ++
 drivers/input/keyboard/mpr121_touchkey.c           | 68 +++++++++++++-----
 5 files changed, 149 insertions(+), 48 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/input/fsl,mpr121-touchkey.yaml
 delete mode 100644 Documentation/devicetree/bindings/input/mpr121-touchkey.txt

-- 
2.1.4
