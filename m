From: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Subject: [PATCH v2 0/5] Arizona Extcon Update Device Bindings
Date: Fri, 2 Oct 2015 17:29:18 +0100
Message-ID: <1443803363-3251-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: lee.jones@linaro.org, cw00.choi@samsung.com
Cc: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, myungjoo.ham@samsung.com, broonie@kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, patches@opensource.wolfsonmicro.com
List-Id: devicetree@vger.kernel.org

This patch chain adds device bindings for the jack and
microphone detection system specific settings.

Mark, I have added you on the chain as getting a DT ack is
proving challenging and Lee said he would appreciate your
opinion on these, hope that is ok. Note that some of the
changes backing the DT doc updates in the first of the two
MFD changes have already been merged hence why they are
not in this series.

Changes since v1:
 - I have removed the stuff for the second jack detect pin
   from the series. It seems that it will probably be better
   to get these bindings in first as I can't see anyway they
   could be contentious then we can deal with that and if it
   needs to be a pinmux/gpio thing later.

Thanks,
Charles

Charles Keepax (5):
  extcon: arizona: Add device binding to enable ADC mode micdet
  extcon: arizona: Add device binding for the general purpose switch
  extcon: arizona: Add device binding for jack detect polarity
    inversion
  mfd: arizona: Update DT binding documentation for mic detection
  mfd: arizona: Update DT binding document for jack detection invert

 Documentation/devicetree/bindings/mfd/arizona.txt |   23 +++++++++++++++++++++
 drivers/extcon/extcon-arizona.c                   |    8 +++++++
 include/dt-bindings/mfd/arizona.h                 |    5 ++++
 3 files changed, 36 insertions(+), 0 deletions(-)

-- 
1.7.2.5
