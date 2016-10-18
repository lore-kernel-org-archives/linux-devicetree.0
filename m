From: Zach Brown <zach.brown@ni.com>
Subject: [PATCH 0/2] Add device tree property and quirk for supporting sdhci
Date: Tue, 18 Oct 2016 10:37:04 -0500
Message-ID: <1476805026-677-1-git-send-email-zach.brown@ni.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-mmc-owner@vger.kernel.org>
Sender: linux-mmc-owner@vger.kernel.org
To: ulf.hansson@linaro.org
Cc: adrian.hunter@intel.com, robh+dt@kernel.org, mark.rutland@arm.com, linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, zach.brown@ni.com
List-Id: devicetree@vger.kernel.org

Some board configurations can not support sd highspeed mode due to the distance
between the card slot and the controller. The card and controller report that
they are capable of highspeed however, so we need a mechanism for specifying
that the setup is incapable of supporting highspeed mode.

The first patch adds documentation about a new devicetree property
broken-highspeed.

The second patch keeps the sd controller and card from going into highspeed
mode when the property is set.


Zach Brown (2):
  sdhci: Add device tree property broken-highspeed
  sdhci: Prevent SD from doing high-speed timing when broken-highspeed
    property is set

 Documentation/devicetree/bindings/mmc/mmc.txt | 2 ++
 drivers/mmc/host/sdhci.c                      | 4 +++-
 2 files changed, 5 insertions(+), 1 deletion(-)

-- 
2.7.4

