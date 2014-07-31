From: Kever Yang <kever.yang@rock-chips.com>
Subject: [PATCH v2 0/2] Patches to add dr_mode for dwc2
Date: Wed, 30 Jul 2014 17:29:15 -0700
Message-ID: <1406766558-8156-1-git-send-email-kever.yang@rock-chips.com>
References: <963258>
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <963258>
Sender: linux-doc-owner@vger.kernel.org
To: Paul Zimmerman <paulz@synopsys.com>
Cc: dianders@chromium.org, Heiko Stuebner <heiko@sntech.de>, linux-arm-kernel@vger.kernel.org, Kever Yang <kever.yang@rock-chips.com>, devicetree@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>, Matt Porter <mporter@linaro.org>, Paul Zimmerman <Paul.Zimmerman@synopsys.com>, linux-doc@vger.kernel.org, linux-usb@vger.kernel.org, Kumar Gala <galak@codeaurora.org>, Stephen Warren <swarren@wwwdotorg.org>, linux-kernel@vger.kernel.org, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kishon Vijay Abraham I <kishon@ti.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

These two patches enable the dr_mode for the dwc2 usb
controller.  These are split from the patch series adding
rk3288 dwc2 support.

Changes in v2:
- Split out dr_mode and rk3288 bindings.
- put spaces around '+' operator
- expand the comment for dr_mode
- handle dr_mode is USB_DR_MODE_OTG

Kever Yang (2):
  Documentation: dt-bindings: add dt binding info for dwc2 dr_mode
  usb: dwc2: add dr_mode support for dwc2

 Documentation/devicetree/bindings/usb/dwc2.txt |    2 ++
 drivers/usb/dwc2/core.c                        |   18 ++++++++++++++++++
 drivers/usb/dwc2/core.h                        |    5 +++++
 drivers/usb/dwc2/platform.c                    |    4 ++++
 4 files changed, 29 insertions(+)

-- 
1.7.9.5


