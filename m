From: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Subject: [PATCH 0/6] Arizona Extcon Update Device Bindings
Date: Wed, 16 Sep 2015 10:56:38 +0100
Message-ID: <1442397404-7579-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: cw00.choi@samsung.com, lee.jones@linaro.org
Cc: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, myungjoo.ham@samsung.com, sameo@linux.intel.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi,

This patch chain adds device bindings for the jack and
microphone detection system specific settings.

Some of the bindings in this chain depend on features that
are being added in the following chain of patches:

https://lkml.org/lkml/2015/9/16/244

Thanks,
Charles

Charles Keepax (6):
  extcon: arizona: Add device binding to enable ADC mode micdet
  extcon: arizona: Add device binding for the general purpose switch
  extcon: arizona: Add device binding for jack detect polarity
    inversion
  extcon: arizona: Add device binding for second jack detect pin on
    GPIO5
  mfd: arizona: Update DT binding documentation for mic detection
  mfd: arizona: Update DT binding documentation for jack detection

 Documentation/devicetree/bindings/mfd/arizona.txt |   27 +++++++++++++++++++++
 drivers/extcon/extcon-arizona.c                   |   13 ++++++++++
 include/dt-bindings/mfd/arizona.h                 |    5 ++++
 3 files changed, 45 insertions(+), 0 deletions(-)

-- 
1.7.2.5
