From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: [PATCH resend 0/6] ARM: sunxi: Add support for A10/A20
 Video Engine clocks
Date: Sat,  5 Dec 2015 21:16:41 +0800
Message-ID: <1449321407-4531-1-git-send-email-wens@csie.org>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCMILY6JWQBBBVGHROZQKGQEMV44DMI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Emilio Lopez <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi everyone,

(Series resent with linux-arm-kernel list added.)

This series adds support for the clocks used by the Video Engine (VPU /
video codec hardware) on the Allwinner A10/A20. The series purposely
excludes sun5i (A10s/A13/R8) to avoid any conflicts with Maxime's KMS
driver series, but adding it should be easy. VE clocks for the newer
generation of SoCs are the same, except the reset control is moved to
the common bus reset controls. These can be supported later on.

The series is meant to get platform stuff out of the way so people who
want to work on a proper driver for the VPU can do so.

The patches are pretty self-explanatory.

Regards
ChenYu

Chen-Yu Tsai (6):
  clk: sunxi: Add DRAM gates support for sun4i-a10
  clk: sunxi: Add VE (Video Engine) module clock driver for sun[457]i
  ARM: dts: sun4i: Add DRAM gates
  ARM: dts: sun4i: Add VE (Video Engine) module clock node
  ARM: dts: sun7i: Add DRAM gates
  ARM: dts: sun7i: Add VE (Video Engine) module clock node

 Documentation/devicetree/bindings/clock/sunxi.txt |   5 +
 arch/arm/boot/dts/sun4i-a10.dtsi                  |  45 +++++-
 arch/arm/boot/dts/sun7i-a20.dtsi                  |  41 +++++-
 drivers/clk/sunxi/Makefile                        |   1 +
 drivers/clk/sunxi/clk-a10-ve.c                    | 171 ++++++++++++++++++++++
 drivers/clk/sunxi/clk-simple-gates.c              |  12 ++
 6 files changed, 268 insertions(+), 7 deletions(-)
 create mode 100644 drivers/clk/sunxi/clk-a10-ve.c

-- 
2.6.2
