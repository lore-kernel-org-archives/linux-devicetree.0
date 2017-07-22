From: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Subject: [PATCH v2 0/2] AXP803 regulators support for Pine64 and SoPine
Date: Sat, 22 Jul 2017 10:18:41 +0800
Message-ID: <20170722021843.6768-1-icenowy@aosc.io>
Reply-To: icenowy-h8G6r0blFSE@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDS6XAN6ZADRBE7MZLFQKGQEF3AGL7I-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The Pine64 and SoPine w/ baseboard boards have an AXP803 PMIC, and the
regulators of the PMIC are used.

This patchset adds the regulators to the device tree of these two boards.

The first patch is for Pine64 and the second if for SoPine w/ official
baseboard.

The patches that drop the dummy regulators in v1 are removed.

Icenowy Zheng (2):
  arm64: allwinner: a64: enable AXP803 regulators for Pine64
  arm64: allwinner: a64: add AXP803 PMIC support to SoPine and the
    baseboard

 .../arm64/boot/dts/allwinner/sun50i-a64-pine64.dts | 102 +++++++++++++++++++++
 .../dts/allwinner/sun50i-a64-sopine-baseboard.dts  |  23 +++++
 .../boot/dts/allwinner/sun50i-a64-sopine.dtsi      |  86 +++++++++++++++++
 3 files changed, 211 insertions(+)

-- 
2.13.0
