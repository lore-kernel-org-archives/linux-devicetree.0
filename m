From: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Subject: [PATCH 0/2] Misc function enhance to Banana Pi M2 Zero board
Date: Wed, 11 Jul 2018 21:22:31 +0800
Message-ID: <20180711132233.42301-1-icenowy@aosc.io>
Reply-To: icenowy-h8G6r0blFSE@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDS6XAN6ZADRBA4KTDNAKGQE3ZPBN6A-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patchset adds two device-tree based function enhancements to the
Banana Pi M2 Zero board.

PATCH 1 adds the HDMI output. (Note: although the connector type is set
to "c" in the device tree, currently sun8i-dw-hdmi doesn't check it and
still set the type to HDMI-A).

PATCH 2 adds VDD-CPUX regulator, and link it to DVFS.

Icenowy Zheng (2):
  ARM: sun8i: h3: enable HDMI output on Banana Pi M2 Zero
  ARM: sun8i: h3: add SY8113B regulator on Banana Pi M2 Zero board

 .../dts/sun8i-h2-plus-bananapi-m2-zero.dts    | 46 +++++++++++++++++++
 1 file changed, 46 insertions(+)

-- 
2.17.1
