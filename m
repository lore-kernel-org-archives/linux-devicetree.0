Return-Path: <SRS0=Zx4x=R6=pengutronix.de=mfe@kernel.org>
From: Marco Felsch <m.felsch@pengutronix.de>
Subject: [PATCH 0/4] ADS7846 add general touchscreen features
Date: Wed, 27 Mar 2019 14:39:23 +0100
Message-Id: <20190327133927.1340-1-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: dmitry.torokhov@gmail.com, robh+dt@kernel.org
Cc: kernel@pengutronix.de, linux-input@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Hi,

The main purpose of this small set is to add support for the general
touchscreen dt-properties. During this work I also changed the memory
allocation methods to the devm_* ones to cleanup the error-paths.

Regards,
Marco

Marco Felsch (4):
  Input: ads7846 - convert to devm_ alloc functions
  dt-bindings: input: ads7846: fix property description
  dt-bindings: input: ads7846: replace vendor-bindings by general ones
  Input: ads7846 - add support for general touchscreen bindings

 .../bindings/input/touchscreen/ads7846.txt    | 29 +++++--
 drivers/input/touchscreen/ads7846.c           | 75 +++++++++++--------
 2 files changed, 66 insertions(+), 38 deletions(-)

-- 
2.20.1
