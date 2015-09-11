From: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Subject: [PATCH v2 0/6] Arizona extcon improvements
Date: Fri, 11 Sep 2015 13:14:12 +0100
Message-ID: <1441973658-26234-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: cw00.choi@samsung.com, lee.jones@linaro.org
Cc: myungjoo.ham@samsung.com, sameo@linux.intel.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, patches@opensource.wolfsonmicro.com
List-Id: devicetree@vger.kernel.org

This patch series does two major things:
 - Adds a fix that resolves an issue where the headphone
   detection accuracy is poor at high impedances (such as
   line loads)
 - Adds device tree bindings for some additional jack
   detection features specifically allowing the use of the
   second jack detection pin on GPIO5 and support for
   inverted polarity jack sockets

Thanks,
Charles

Charles Keepax (5):
  mfd: arizona: Add TST_CAP bits for headphone detection
  extcon: arizona: Additional settings to improve accuracy of HP detect
  extcon: arizona: Add device binding for jack detect polarity
    inversion
  extcon: arizona: Add device binding for second jack detect pin on
    GPIO5
  mfd: arizona: Update DT binding documentation for jack detection

Nariman Poushin (1):
  extcon: arizona: Ignore jd_invert for MICD_CLAMP_STS

 Documentation/devicetree/bindings/mfd/arizona.txt |    6 ++++
 drivers/extcon/extcon-arizona.c                   |   32 +++++++++++++++++----
 drivers/mfd/wm5110-tables.c                       |    2 +
 include/linux/mfd/arizona/registers.h             |    8 +++++
 4 files changed, 42 insertions(+), 6 deletions(-)

-- 
1.7.2.5
