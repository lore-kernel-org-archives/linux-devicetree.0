From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: [PATCH 0/9] ARM: dts: sun7i: BPI-M1+ and Lamobo-R1 fixes
Date: Wed,  6 Jul 2016 17:10:41 +0800
Message-ID: <1467796250-22010-1-git-send-email-wens@csie.org>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCMILY6JWQBBBI4W6O5QKGQEEM2GUBI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Maxime,

These are a bunch of fixes I did to get my boards running. Some of them
are cleanups, while others enable hardware that we already support on
other boards, such as USB or the audio codec.

Regards
ChenYu

Chen-Yu Tsai (9):
  ARM: dts: sun7i: lamobo-r1: Fix USB-based WiFi module power
  ARM: dts: sun7i: lamobo-r1: Remove usb1 vbus regulator
  ARM: dts: sun7i: lamobo-r1: Fix GPIO flags in reg_ahci_5v
  ARM: dts: sun7i: lamobo-r1: Enable audio codec
  ARM: dts: sun7i: bananapi-m1-plus: Reindent whole file using tabs
  ARM: dts: sun7i: bananapi-m1-plus: Unify suffix for board specific
    labels
  ARM: dts: sun7i: bananapi-m1-plus: red LED is power LED
  ARM: dts: sun7i: bananapi-m1-plus: Add PMIC regulators and OPPs for
    cpufreq
  ARM: dts: sun7i: bananapi-m1-plus: Enable USB OTG

 arch/arm/boot/dts/sun7i-a20-bananapi-m1-plus.dts | 342 ++++++++++++++---------
 arch/arm/boot/dts/sun7i-a20-lamobo-r1.dts        |  20 +-
 2 files changed, 218 insertions(+), 144 deletions(-)

-- 
2.8.1
