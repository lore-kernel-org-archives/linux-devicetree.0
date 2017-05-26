From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: [PATCH 0/3] clk: sunxi-ng: Add support for A83T's PRCM
Date: Fri, 26 May 2017 16:00:22 +0800
Message-ID: <20170526080025.28532-1-wens@csie.org>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBCMILY6JWQBBBHWBT7EQKGQE423CD7Y-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi everyone,

This series adds support for the A83T's PRCM to the existing sun8i-r-ccu
driver. When the sun8i-r-ccu driver was introduced, indices were reserved
for all the possible clocks and resets of the sun8i family. In patch 2
we simply pick existing clocks, and implement ones that are different or
missing.

Differences from other sun8i implementations include different clock parent
names, due to the A83T not having a proper 32.768 kHz oscillator, and
different predividers for the IR clock.

Patch 1 adds a compatible string for the A83T variant.

Patch 2 adds the driver support, as mentioned above.

Patch 3 adds a device node for the PRCM.


Regards
ChenYu


Chen-Yu Tsai (3):
  dt-bindings: clock: sunxi-ccu: Add compatible string for A83T PRCM
  clk: sunxi-ng: a83t: Add support for A83T's PRCM
  ARM: sun8i: a83t: Add device node for PRCM

 .../devicetree/bindings/clock/sunxi-ccu.txt        |   3 +-
 arch/arm/boot/dts/sun8i-a83t.dtsi                  |   9 ++
 drivers/clk/sunxi-ng/ccu-sun8i-r.c                 | 107 +++++++++++++++++++++
 3 files changed, 118 insertions(+), 1 deletion(-)

-- 
2.11.0
