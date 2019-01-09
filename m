From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: [PATCH 0/5] ARM: dts: sunxi: Enable Broadcom-based
 Bluetooth w/ serdev
Date: Wed,  9 Jan 2019 23:02:52 +0800
Message-ID: <20190109150257.12602-1-wens@csie.org>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBCMILY6JWQBBBJ423DQQKGQEBTWJO3Q-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi everyone,

This is the second batch of patches enabling Bluetooth for Broadcom
(AMPAK) modules using the new serdev bindings.

The patches are self-explanatory, so I won't go into the details here.

This pretty much covers all the boards I have that have AMPAK modules.
The only ones missing are the A80-based boards, which I haven't gotten
working yet.

Chen-Yu Tsai (5):
  ARM: dts: sun8i: r40: Add pinmux settings for UART3 on PG pingroup
  ARM: dts: sun8i: r40: Add pinmux setting for CLK_OUT_A
  ARM: dts: sun8i: r40: bananapi-m2-ultra: Fix WiFi regulator
    definitions
  ARM: dts: sun8i: r40: bananapi-m2-ultra: Add Bluetooth device node
  ARM: dts: sunxi: bananapi-m2-plus: Add Bluetooth device node

 .../boot/dts/sun8i-r40-bananapi-m2-ultra.dts  | 41 +++++++++++++++++++
 arch/arm/boot/dts/sun8i-r40.dtsi              | 15 +++++++
 arch/arm/boot/dts/sunxi-bananapi-m2-plus.dtsi | 16 +++++++-
 3 files changed, 71 insertions(+), 1 deletion(-)

-- 
2.20.1
