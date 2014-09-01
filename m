From: Gyungoh Yoo <gyungoh@gmail.com>
Subject: [PATCH v2.2 0/2] regulator: sky81452: Adding compatible attribute in DT document
Date: Mon,  1 Sep 2014 11:40:16 +0900
Message-ID: <1409539218-5571-1-git-send-email-jack.yoo@skyworksinc.com>
References: <20140813190423.GI17528@sirena.org.uk>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20140813190423.GI17528@sirena.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: lgirdwood@gmail.com, broonie@kernel.org
Cc: grant.likely@linaro.org, robh+dt@kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Gyungoh Yoo <jack.yoo@skyworksinc.com>
List-Id: devicetree@vger.kernel.org

Adding comptiable attribute in DT document.
Splitted the patches for each subsystem.
Fixed typo in DT document.

Gyungoh Yoo (2):
  regulator: sky81452: Adding compatible attribute in DT
  dt-bindings: Adding compatible attribute for SKY81452 regulator

 .../bindings/regulator/sky81452-regulator.txt      |  4 +++-
 drivers/regulator/sky81452-regulator.c             | 22 ++++++++++++++++------
 2 files changed, 19 insertions(+), 7 deletions(-)

-- 
1.9.1
