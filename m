From: Siarhei Siamashka <siarhei.siamashka-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 0/3] ARM: dts: sun4i: Enable USB DRC and
 voltage-scaling on pcDuino1/2
Date: Fri,  9 Oct 2015 14:09:36 +0300
Message-ID: <1444388979-12072-1-git-send-email-siarhei.siamashka@gmail.com>
Reply-To: siarhei.siamashka-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCH4DA7NUEBBB6GA32YAKGQEEPKMKJQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Zoltan HERPAI <wigyori-1V5s5g7wVVk@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello,

This is the v2 of the older patches from:
    http://lists.infradead.org/pipermail/linux-arm-kernel/2015-October/374377.html

Changes since v1:
- The voltage scaling patch (AXP209 PMU regulators) has been already
  applied by Maxime, so it is not included in this patch set anymore.
- A new patch with a separate dts for pcDuino2 has been added,
  as had been requested during the previous review round.
- Instead of removing "usb1_vbus-supply" and "usb2_vbus-supply",
  they now refer to "reg_vcc5v0" (this had been discussed on IRC).

Siarhei Siamashka (3):
  ARM: dts: sun4i: Allow to use the PH6 pin for GPIO on pcDuino1/2
  ARM: sun4i: dt: Add new LinkSprite pcDuino2 board
  ARM: dts: sun4i: Enable USB DRC on pcDuino1/2

 arch/arm/boot/dts/Makefile               |  3 +-
 arch/arm/boot/dts/sun4i-a10-pcduino.dts  | 29 ++++++++----
 arch/arm/boot/dts/sun4i-a10-pcduino2.dts | 78 ++++++++++++++++++++++++++++++++
 3 files changed, 100 insertions(+), 10 deletions(-)
 create mode 100644 arch/arm/boot/dts/sun4i-a10-pcduino2.dts

-- 
2.4.9
