From: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Subject: [PATCH v3 0/6] Arizona Extcon Update Device Bindings
Date: Thu, 19 Nov 2015 15:45:34 +0000
Message-ID: <1447947940-3054-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: cw00.choi@samsung.com
Cc: myungjoo.ham@samsung.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, patches@opensource.wolfsonmicro.com
List-Id: devicetree@vger.kernel.org

This patch chain adds device bindings for the jack and
microphone detection system specific settings.

Changes since v2:
 - Now moved things over to the new extcon binding document

Thanks,
Charles

Charles Keepax (6):
  extcon: arizona: Add device binding to enable ADC mode micdet
  extcon: arizona: Add device binding for the general purpose switch
  extcon: arizona: Add device binding for jack detect polarity
    inversion
  extcon: arizona: Add device binding for second jack detect pin on
    GPIO5
  extcon: arizona: Update DT binding documentation for mic detection
  extcon: arizona: Update DT binding documentation for jack detection

 .../devicetree/bindings/extcon/extcon-arizona.txt  |   26 ++++++++++++++++++++
 drivers/extcon/extcon-arizona.c                    |   13 ++++++++++
 2 files changed, 39 insertions(+), 0 deletions(-)

-- 
1.7.2.5
