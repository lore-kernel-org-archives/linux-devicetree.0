From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: [PATCH v2 0/3] regulator: axp20x: Drop AXP221
 DC1SW/DC5LDO supplies from bindings
Date: Wed, 30 Sep 2015 14:39:44 +0800
Message-ID: <1443595188-1283-1-git-send-email-wens@csie.org>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCMILY6JWQBBBZMIV2YAKGQEGFILFKA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "moderated list:ARM PORT" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi everyone,

This is v2 of "regulators: axp20x: Rename AXP221 DC1SW and DC5LDO supply
names". v2 removes the regulator supply properties for AXP221 DC1SW
and DC5LDO, instead of renaming them. These 2 regulators are secondary
outputs for DCDC1 and DCDC5 buck regulators, respectively, so they are
connected to them internally. This relationship should not be represented
in the device tree.


Patch 1 drops the AXP22X DC1SW/DC5LDO supply properties from the axp20x
DT bindings.

Patch 2 updates the axp20x regulator driver.

Patch 3 updates the only dts, the Hummingbird A31, that uses these
bindings.

If everything's ok, could we merge this for 4.4?

Thanks.


Regards,
ChenYu


Chen-Yu Tsai (3):
  mfd: axp20x: Drop AXP221 DC1SW and DC5LDO regulator supplies from
    bindings
  regulator: axp20x: set supply names for AXP22X DC1SW/DC5LDO internally
  ARM: dts: sun6i: hummingbird: Drop AXP221 DC1SW and DC5LDO supplies

 Documentation/devicetree/bindings/mfd/axp20x.txt |  4 +-
 arch/arm/boot/dts/sun6i-a31-hummingbird.dts      |  2 -
 drivers/regulator/axp20x-regulator.c             | 54 ++++++++++++++++++++++--
 3 files changed, 52 insertions(+), 8 deletions(-)

-- 
2.5.3
