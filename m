From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: [PATCH v5 00/12] mfd: axp20x: add AXP221 PMIC support
Date: Tue, 10 Mar 2015 19:59:11 +0800
Message-ID: <1425988764-23618-1-git-send-email-wens@csie.org>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCMILY6JWQBBBK5Z7OTQKGQEIWHC47Y-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi everyone,

This is v5 of the AXP221 series. I've taken over the work from Boris.
This version is based on v4.0-rc1, plus "mfd: AXP20x: Add bindings
documentation" which was posted a few weeks ago. I've worked on this
series for some time, so the changelog might not be completely accurate.

The AXP221 is a member of X-Powers' AXP PMIC family. They share the
same basic functionality and structure. The series adds system poweroff,
power button and regulator support for the AXP221. When Reduced Serial
Bus (RSB) support is introduced, the same code can be reused (except
for the probe interface) for the AXP223, which has the same core and
a different external host interface.

The p2wi controller dts patches have no dependency, and can go in
Maxime's tree.

The regulator bits depend on the mfd patches, which introduce new enums
and register definitions. The regulator dts patches should also be merged
_after_ the regulator bits, as the original axp20x regulator driver did
not check for supported variants. Maybe Lee and Mark can work out a shared
branch, or have Lee take all the driver bits?


Regards
ChenYu


Changes since v4:

  - Rebased onto v4.0-rc1 and axp20x bindings v10

  - Dropped regulator set registration patches

  - Group regmap ranges/tables by AXP variant

  - Fix AXP221 interrupt numbers to match datasheet

  - Handle AXP variants when setting DC-DC regulator work mode

  - Add "switch" type regulator DC1SW, which is a secondary output
    of DCDC1 with a separate on/off switch.

  - Add AXP221 to DT bindings


Boris BREZILLON (4):
  ARM: dts: sun6i: add p2wi controller node to dtsi
  mfd: axp20x: add AXP22x PMIC support
  regulator: axp20x: prepare support for multiple AXP chip families
  regulator: axp20x: add support for AXP22X regulators

Chen-Yu Tsai (8):
  ARM: dts: sun6i: hummingbird: Enable P2WI controller
  mfd: axp20x: update DT bindings with AXP22x compatibles
  ARM: dts: sun6i: hummingbird: Add AXP221 PMIC device node
  mfd: axp20x: Add AXP22x regulator information to DT bindings
  mfd: axp20x: Enable AXP22X regulators
  ARM: dts: sun6i: hummingbird: Add AXP221 regulator nodes
  ARM: dts: sun6i: Add pinmux settings for mmc1 to dtsi
  ARM: dts: sun6i: hummingbird: Enable the onboard WiFi module

 Documentation/devicetree/bindings/mfd/axp20x.txt |  34 +++-
 arch/arm/boot/dts/sun6i-a31-hummingbird.dts      |  91 ++++++++-
 arch/arm/boot/dts/sun6i-a31.dtsi                 |  29 +++
 drivers/mfd/axp20x.c                             | 100 ++++++++++
 drivers/regulator/axp20x-regulator.c             | 239 ++++++++++++++++++-----
 include/linux/mfd/axp20x.h                       |  86 ++++++++
 6 files changed, 526 insertions(+), 53 deletions(-)

-- 
2.1.4
