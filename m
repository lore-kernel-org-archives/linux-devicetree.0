From: Karsten Merker <merker-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 0/3] ARM: dts: sun7i: Olimex A20-SOM-EVB:
 LRADC-keys, MMC3 and typo fix in the sunxi LRADC binding
Date: Thu, 10 Dec 2015 21:31:58 +0100
Message-ID: <1449779521-754-1-git-send-email-merker@debian.org>
Reply-To: merker-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBDP2XNNJ7IFBBAGDU6ZQKGQE73XLCRQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dev-3kdeTeqwOZ9EV1b7eY7vFQ@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Karsten Merker <merker-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello,

the Olimex A20-SOM-EVB is an evaluation board for the Olimex
A20-SOM system-on-module. This patchset adds/enables some more
hardware features in the board dts:

  - Patch 1 adds support for the LRADC-keys on the baseboard.

  - Patch 2 enables the MMC3 controller to allow use of the
    full-size SD card socket on the baseboard.

While adding the LRADC-keys support, I have stumbled over
a typo in the bindings documentation. Patch 3 fixes that.

Regards,
Karsten

Karsten Merker (3):
  ARM: dts: sun7i: Olimex A20-SOM-EVB: Add LRADC keys
  ARM: dts: sun7i: Olimex A20-SOM-EVB: Enable mmc3 (baseboard SD socket)
  ARM: dts: sunxi: allwinner,sun4i-a10-lradc-keys binding: typo fix

 .../devicetree/bindings/input/sun4i-lradc-keys.txt |  2 +-
 arch/arm/boot/dts/sun7i-a20-olimex-som-evb.dts     | 73 ++++++++++++++++++++++
 2 files changed, 74 insertions(+), 1 deletion(-)

-- 
2.1.4
