From: Jean-Francois Moine <moinejf-GANU6spQydw@public.gmane.org>
Subject: [PATCH v3 0/4] regulator: axp20x: support AXP803/AXP813 variants
Date: Fri, 23 Sep 2016 10:58:27 +0200
Message-ID: <cover.1474621107.git.moinejf@free.fr>
Reply-To: moinejf-GANU6spQydw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCV6DL6LYMNBBO7DSO7QKGQERT2XWKY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patch series adds support for the X-Powers AXP803 and AXP813 PMICs.
It is based on the previous patch series
	regulator: axp20x: Simplify various code

v3:
- put the code of the new devices in new files instead of in the common
  axp20x file.
- fix errors about the regulators and interrupts
v2:
- fix lack of support of dcdc frequency
- notice that the AXP803 is also handled
- send the patch to the DT maintainers

Jean-Francois Moine (4):
  regulator: axp20x: move device independant parts to new files
  regulator: axp20x: duplicate the MFD axp20x-rsb code
  regulator: axp20x: add the AXP803
  regulator: axp20x: add the AXP813

 Documentation/devicetree/bindings/mfd/axp20x.txt |  29 ++-
 drivers/mfd/axp20x.c                             |  15 +
 drivers/regulator/Makefile                       |   3 +-
 drivers/regulator/axp-regulator.c                | 347 +++++++++++++++++++
 drivers/regulator/axp-regulator.h                | 133 ++++++++
 drivers/regulator/axp20x-regulator.c             | 415 ++---------------------
 drivers/regulator/axp803.c                       | 225 ++++++++++++
 drivers/regulator/axp813.c                       | 229 +++++++++++++
 include/linux/mfd/axp20x.h                       |   2 +
 9 files changed, 1012 insertions(+), 388 deletions(-)
 create mode 100644 drivers/regulator/axp-regulator.c
 create mode 100644 drivers/regulator/axp-regulator.h
 create mode 100644 drivers/regulator/axp803.c
 create mode 100644 drivers/regulator/axp813.c

-- 
2.10.0
