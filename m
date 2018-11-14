From: hao_zhang <hao5781286-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v0 0/2] Initial Allwinner T3 support.
Date: Wed, 14 Nov 2018 16:20:33 +0800
Message-ID: <20181114082033.GA20712@arx-s1>
Reply-To: hao5781286-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDKITZOARQMBB5VVV7PQKGQEXWSBURQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org
Cc: linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, icenowy-h8G6r0blFSE@public.gmane.org
List-Id: devicetree@vger.kernel.org

Initial Allwinner T3 support.

Allwinner T3 (sun8i) SoC features a Quad-Core Cortex-A7 ARM CPU, and a
Mali400 MP2 GPU from ARM. It is a not-pin-compatible quad core sucessor
of the A20). It's also known as the Allwinner R40 for In-Car
Entertainment usage.

hao_zhang (2):
  ARM: dts: sun8i: Add board dts file for t3-cqa3t-bv3.
  Documentation: ARM: sunxi: Add Allwinner SoC T3.

 Documentation/devicetree/bindings/arm/sunxi.txt |   3 +-
 arch/arm/boot/dts/Makefile                      |   1 +
 arch/arm/boot/dts/sun8i-t3-cqa3t-bv3.dts        | 226 ++++++++++++++++++++++++
 3 files changed, 229 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm/boot/dts/sun8i-t3-cqa3t-bv3.dts

-- 
2.7.4
