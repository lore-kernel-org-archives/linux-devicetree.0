From: codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Subject: [PATCH 0/2] ARM: dts: sun4i: mk802 variant patches
Date: Tue,  8 Dec 2015 19:48:52 +0100
Message-ID: <1449600534-5098-1-git-send-email-codekipper@gmail.com>
Reply-To: codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCHNXO4F7MHBBGGMTSZQKGQEBIXFI2I-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Marcus Cooper <codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Marcus Cooper <codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

This patch series splits the mk802 dts into common include file which
can be shared with the mk802+ device. The only difference that I can
see between this and the original device is that it has an internal
microphone.

With that in mind we can either leave things as they are and enable
the capture to the original mk802 dts or apply this patch to distinguish
between the two devices.

CK

Marcus Cooper (2):
  ARM: dts: sun4i: Create common dtsi for mk802
  ARM: dts: sun4i: Add rikomagic mk802+ board

 arch/arm/boot/dts/Makefile                |   1 +
 arch/arm/boot/dts/sun4i-a10-mk802-1gb.dts |  50 ++++++++++++++
 arch/arm/boot/dts/sun4i-a10-mk802.dts     |  64 +-----------------
 arch/arm/boot/dts/sun4i-a10-mk802.dtsi    | 108 ++++++++++++++++++++++++++++++
 4 files changed, 160 insertions(+), 63 deletions(-)
 create mode 100644 arch/arm/boot/dts/sun4i-a10-mk802-1gb.dts
 create mode 100644 arch/arm/boot/dts/sun4i-a10-mk802.dtsi

-- 
1.9.1
