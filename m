From: Boris BREZILLON <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH v4 0/7] mfd: axp20x: add AXP221 PMIC support
Date: Tue, 17 Jun 2014 09:38:36 +0200
Message-ID: <1402990723-28138-1-git-send-email-boris.brezillon@free-electrons.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-sunxi+bncBCIPJ6FA2QLBBEXB76OAKGQEQBEVZCI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
To: Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>, Shuge <shuge-0TFLnhJekD6UEPyfVivIlAC/G2K4zDHf@public.gmane.org>, kevin-0TFLnhJekD6UEPyfVivIlAC/G2K4zDHf@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dev-3kdeTeqwOZ9EV1b7eY7vFQ@public.gmane.org, Boris BREZILLON <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello,

This patch series adds basic support for X-Powers' AXP221 PMIC.

At the moment the MFD device only exposes AXP221 regulators but other
subdevices might be added later.

Best Regards,

Boris

Changes since v3:
 - rework mfd probe to avoid multiple AXP variant tests
 - add new compatible string to the DT bindings doc

Changes since v2:
 - add helper functions for regulator set registration
 - fix a copy/paste error in the axp20x mfd driver

Changes since v1:
 - merge code with the axp20x driver

Boris BREZILLON (7):
  mfd: axp20x: add AXP221 PMIC support
  regulator: axp20x: prepare support for multiple AXP chip families
  regulator: axp20x: add support for AXP221 regulators
  regulator: axp20x: reset probe data before each probe
  regulator: add support for regulator set registration
  regulator: axp20x: make use of devm_regulator_set_register
  mfd: AXP20x: add "x-powers,axp221" compatible string to DT bindings
    doc

 Documentation/devicetree/bindings/mfd/axp20x.txt |   2 +-
 drivers/mfd/axp20x.c                             |  64 ++++++-
 drivers/regulator/axp20x-regulator.c             | 202 ++++++++++++++++-------
 drivers/regulator/core.c                         | 106 ++++++++++++
 drivers/regulator/devres.c                       |  68 ++++++++
 include/linux/mfd/axp20x.h                       |  56 +++++++
 include/linux/regulator/driver.h                 |  51 ++++++
 7 files changed, 483 insertions(+), 66 deletions(-)

-- 
1.8.3.2
