From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: [PATCH 0/2] ARM: dts: sun6i: Disable display pipeline
 by default
Date: Thu, 24 Nov 2016 14:43:37 +0800
Message-ID: <20161124064339.12615-1-wens@csie.org>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCMILY6JWQBBBH4Y3LAQKGQEGBILI6Q-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

While we now support the internal display pipeline found on sun6i, it
is possible that we are unable to enable the display for some boards,
due to a lack of drivers for the panels or bridges found on them. If
the display pipeline is enabled, the driver will try to enable, and
possibly screw up the simple framebuffer U-boot had configured.

This series disables the display pipeline by default, and re-enables
it for the A31 Hummingbird, which already had its display pipeline
enabled.

The series can go in after 4.10-rc1, as a fix, but should not be delayed
till the next release.

Regards
ChenYu

Chen-Yu Tsai (2):
  ARM: dts: sun6i: Disable display pipeline by default
  ARM: dts: sun6i: hummingbird: Enable display engine again

 arch/arm/boot/dts/sun6i-a31-hummingbird.dts | 4 ++++
 arch/arm/boot/dts/sun6i-a31.dtsi            | 1 +
 2 files changed, 5 insertions(+)

-- 
2.10.2
