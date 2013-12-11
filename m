From: Sherman Yin <syin@broadcom.com>
Subject: [PATCH v3 0/6] Add Broadcom Capri pinctrl driver
Date: Wed, 11 Dec 2013 10:37:15 -0800
Message-ID: <1386787041-6035-1-git-send-email-syin@broadcom.com>
References: <1381174108-25168-1-git-send-email-syin@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1381174108-25168-1-git-send-email-syin@broadcom.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <rob.herring@calxeda.com>, =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Landley <rob@landley.net>, Christian Daudt <bcm@fixthebug.org>, Russell King <linux@arm.linux.org.uk>, Linus Walleij <linus.walleij@linaro.org>, Grant Likely <grant.likely@linaro.org>, Matt Porter <matt.porter@linaro.org>
Cc: devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Sherman Yin <syin@broadcom.com>, bcm-kernel-feedback-list@broadcom.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

The following patches adds a pinctrl driver for Broadcom Capri (BCM281xx) SoCs.
The first patch, adding the void * to pinctrl_pin_desc, has been previously
discussed with LinusW.  See this thread:

http://lists.infradead.org/pipermail/linux-arm-kernel/2013-April/165880.html
---
v3: Re-worked driver to be based on generic pinconfig, addressed review
    comments and other supporting changes:
    - moved config selection from Kconfig to defconfig
    - added slew-rate, input enable, input disable properties for generic
      pinconfig
    - added a description for PINCTRL config
v2: Use hyphens instead of underscore in DT property names.

Sherman Yin (6):
  pinctrl: Add void * to pinctrl_pin_desc
  pinctrl: Adds slew-rate, input-enable/disable
  pinctrl: Make PINCTRL selectable by defconfig/menuconfig
  pinctrl: Add pinctrl binding for Broadcom Capri SoCs
  ARM: pinctrl: Add Broadcom Capri pinctrl driver
  pinctrl: Enable pinctrl for Broadcom Capri SoCs

 .../bindings/pinctrl/brcm,capri-pinctrl.txt        |  429 ++++++
 .../bindings/pinctrl/pinctrl-bindings.txt          |    3 +
 arch/arm/boot/dts/bcm11351.dtsi                    |    4 +
 arch/arm/configs/bcm_defconfig                     |    5 +
 drivers/pinctrl/Kconfig                            |   13 +-
 drivers/pinctrl/Makefile                           |    1 +
 drivers/pinctrl/pinconf-generic.c                  |    4 +
 drivers/pinctrl/pinctrl-capri.c                    | 1408 ++++++++++++++++++++
 include/linux/pinctrl/pinconf-generic.h            |    4 +
 include/linux/pinctrl/pinctrl.h                    |    2 +
 10 files changed, 1872 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/brcm,capri-pinctrl.txt
 create mode 100644 drivers/pinctrl/pinctrl-capri.c

-- 
1.7.9.5
