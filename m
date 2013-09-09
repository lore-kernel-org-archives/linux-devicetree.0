From: Guennadi Liakhovetski <g.liakhovetski@gmx.de>
Subject: [PATCH 0/2] regulator: da9210: support Device Tree initialisation
Date: Mon,  9 Sep 2013 17:51:58 +0200
Message-ID: <1378741920-11085-1-git-send-email-g.liakhovetski@gmx.de>
Return-path: <linux-sh-owner@vger.kernel.org>
Sender: linux-sh-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Magnus Damm <magnus.damm@gmail.com>, linux-sh@vger.kernel.org, Mark Brown <broonie@kernel.org>, devicetree@vger.kernel.org, Grant Likely <grant.likely@linaro.org>, Rob Herring <rob.herring@calxeda.com>, Guennadi Liakhovetski <g.liakhovetski+renesas@gmail.com>
List-Id: devicetree@vger.kernel.org

The first patch just adds a vendor prefix for Dialog Semiconductor PLC, the
second one actually implements DT support in da9210.

Cc: Guennadi Liakhovetski <g.liakhovetski+renesas@gmail.com>

Guennadi Liakhovetski (2):
  DT: add a vendor prefix for Dialog Semiconductor
  regulator: da9210: add Device Tree support

 .../devicetree/bindings/vendor-prefixes.txt        |    1 +
 drivers/regulator/da9210-regulator.c               |    9 ++++++---
 2 files changed, 7 insertions(+), 3 deletions(-)

-- 
1.7.2.5

Thanks
Guennadi
---
Guennadi Liakhovetski, Ph.D.
Freelance Open-Source Software Developer
http://www.open-technology.de/
