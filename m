From: Fabien Lahoudere <fabien.lahoudere@collabora.co.uk>
Subject: [PATCH v5 0/2] usb: chipidea: imx: Add USB configuration for imx53
Date: Wed, 21 Sep 2016 11:07:05 +0200
Message-ID: <1474448827-8354-1-git-send-email-fabien.lahoudere@collabora.co.uk>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter.Chen@nxp.com
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Fabien Lahoudere <fabien.lahoudere@collabora.co.uk>
List-Id: devicetree@vger.kernel.org

Changes in V2:
	- Patches sent to early with bad contents
Changes in V3:
	- Change subject
	- Split "configure imx for ULPI phy" for disable-oc code
Changes in V4:
	- Fix "Change switch order" commit message
	- Indent switch/case (set case on the same column as switch)
	- Remove useless test in "Change switch order"
Changes in V5:
	- Squash "Change switch order" and "configure imx for ULPI phy"
	- Add device tree binding documentation

Fabien Lahoudere (2):
  usb: chipidea: imx: configure imx for ULPI phy
  usb: chipidea: imx: Add binding to disable USB 60Mhz clock

 .../devicetree/bindings/usb/ci-hdrc-usb2.txt       |  1 +
 drivers/usb/chipidea/ci_hdrc_imx.c                 |  7 ++
 drivers/usb/chipidea/ci_hdrc_imx.h                 |  2 +
 drivers/usb/chipidea/usbmisc_imx.c                 | 88 ++++++++++++++++++----
 4 files changed, 84 insertions(+), 14 deletions(-)

-- 
2.1.4
