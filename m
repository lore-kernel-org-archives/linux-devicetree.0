From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: [PATCH RESEND v6 0/6] mfd: axp20x: add AXP221 PMIC support
Date: Fri, 10 Apr 2015 12:09:00 +0800
Message-ID: <1428638946-24890-1-git-send-email-wens@csie.org>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCMILY6JWQBBB3UZTWUQKGQE7DFYKLA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Lee,

This is a resend of the AXP221 PMIC series, rebased onto the latest
for-mfd-next.

Original changelog

Changes since v5:

    - Rebased onto mfd-for-next (ba867bc60a44)

    - Dropped dts patches

    - Removed double line spacing

Changes since v4:

  - Rebased onto v4.0-rc1 and axp20x bindings v10

  - Dropped regulator set registration patches

  - Group regmap ranges/tables by AXP variant

  - Fix AXP221 interrupt numbers to match datasheet

  - Handle AXP variants when setting DC-DC regulator work mode

  - Add "switch" type regulator DC1SW, which is a secondary output
    of DCDC1 with a separate on/off switch.

  - Add AXP221 to DT bindings


Regards
ChenYu

Boris BREZILLON (3):
  mfd: axp20x: add AXP22x PMIC support
  regulator: axp20x: prepare support for multiple AXP chip families
  regulator: axp20x: add support for AXP22X regulators

Chen-Yu Tsai (3):
  mfd: axp20x: update DT bindings with AXP22x compatibles
  mfd: axp20x: Add AXP22x regulator information to DT bindings
  mfd: axp20x: Enable AXP22X regulators

 Documentation/devicetree/bindings/mfd/axp20x.txt |  32 ++-
 drivers/mfd/axp20x.c                             | 100 ++++++++++
 drivers/regulator/axp20x-regulator.c             | 239 ++++++++++++++++++-----
 include/linux/mfd/axp20x.h                       |  86 ++++++++
 4 files changed, 405 insertions(+), 52 deletions(-)

-- 
2.1.4
