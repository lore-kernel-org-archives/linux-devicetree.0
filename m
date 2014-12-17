From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v2 00/13] sun6i: Add A31s and ir support
Date: Wed, 17 Dec 2014 18:18:11 +0100
Message-ID: <1418836704-15689-1-git-send-email-hdegoede@redhat.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBDRZXY4CYYORB2HVY2SAKGQEGVBXIXQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Cc: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Linux Media Mailing List <linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi All,

Here is v2 of my patch series to add sun6i A31s and ir support.

Changes in v2:

-"pinctrl: sun6i: Add some missing functions, fix i2c3 muxing":
 -Drop the changes to the muxing of i2c3 this was based on                 
  "A31s Datasheet v1.40.pdf", but all other A31 related info puts them at the
  pins where we already have them, so leave this as is
-"pinctrl: sun6i: Add A31s pinctrl support"
 -Sync i2c3 muxing with v2 of "pinctrl: sun6i: Add some missing functions"
 -Add myself to the copyright header
-"clk: sunxi: Make the mod0 clk driver also a platform driver"
 -New patch in v2 of the set
-"mfd: sun6i-prcm: Add support for the ir-clk"
 -New patch in v2 of the set
-"ARM: dts: sun6i: Add sun6i-a31s.dtsi"
 -include sun6i-a31.dtsi and override the pinctrl compatible, rather then
  copying everything
-"ARM: dts: sun6i: Add ir_clk node"
 -Use allwinner,sun4i-a10-mod0-clk as compatible, rather then a prcm
  specific compatible

Please queue this up for 3.20 .

Thanks,

Hans
