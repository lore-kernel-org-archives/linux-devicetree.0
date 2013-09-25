From: Benoit Parrot <bparrot-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v3 1/1] ARM: dts: AM33XX: Add LCDC info into am335x-evm
Date: Wed, 25 Sep 2013 17:31:07 -0500
Message-ID: <20130925223107.GA2494@uda0270506>
References: <1377274436-3890-1-git-send-email-bparrot@ti.com>
 <20130903145516.GA30867@uda0270506>
 <52415B8F.40804@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <52415B8F.40804-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Benoit Cousson <bcousson-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, joelf-l0cyMroinI0@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Benoit,

On Tue, Sep 24, 2013 at 11:29:51AM +0200, Benoit Cousson wrote:
> Hi Benoit,
> 
> On 03/09/2013 16:55, Benoit Parrot wrote:
> >Hi,
> >
> >I have not received any feedback on this patch.
> >It has been pending since the end of June (first post).
> >Can I get an estimate when it will be included/accepted?
> 
> It looks good to me beside a minor comment below.
> 
> Could you just rebase it on my lastest git://git.kernel.org/pub/scm/linux/kernel/git/bcousson/linux-omap-dt.git
> for_3.13/dts branch because it conflicts with the cleanup done by
> Javier.
> 

I was going to rebase it to your for_3.13/dts branch, but Joel Frenandez has 
already included this patch as part of his most recent submission.
(http://marc.info/?l=devicetree&m=138014654925217&w=2) so I guess there is no
need to duplicate the work now.

Let me know if this causes any issue.

Thanks,
Benoit

> >
> >On Fri, Aug 23, 2013 at 11:13:56AM -0500, Benoit Parrot wrote:
> >>Add LCDC device node in DT for am33xx
> >>Add LCDC and Panel info in DT for am335x-evm
> >>
> >>Changes in v3:
> >>- rebase to 3.11-rc6
> >>
> >>Changes in v2:
> >>- remove redundant/unnecessary SoC specific setting in the board dts
> >>
> >>Signed-off-by: Benoit Parrot <bparrot-l0cyMroinI0@public.gmane.org>
> >>---
> >>  arch/arm/boot/dts/am335x-evm.dts |   72 ++++++++++++++++++++++++++++++++++++++
> >>  arch/arm/boot/dts/am33xx.dtsi    |    9 +++++
> >>  2 files changed, 81 insertions(+)
> >>
> >>diff --git a/arch/arm/boot/dts/am335x-evm.dts b/arch/arm/boot/dts/am335x-evm.dts
> >>index 3aee1a4..b0703f1 100644
> >>--- a/arch/arm/boot/dts/am335x-evm.dts
> >>+++ b/arch/arm/boot/dts/am335x-evm.dts
> >>@@ -149,6 +149,40 @@
> >>  				0x14c (PIN_INPUT_PULLDOWN | MUX_MODE7)
> >>  			>;
> >>  		};
> >>+
> >>+		lcd_pins_s0: lcd_pins_s0 {
> >>+			pinctrl-single,pins = <
> >>+				0x20 0x01	/* gpmc_ad8.lcd_data16, OUTPUT | MODE1 */
> >>+				0x24 0x01	/* gpmc_ad9.lcd_data17, OUTPUT | MODE1 */
> >>+				0x28 0x01	/* gpmc_ad10.lcd_data18, OUTPUT | MODE1 */
> >>+				0x2c 0x01	/* gpmc_ad11.lcd_data19, OUTPUT | MODE1 */
> >>+				0x30 0x01	/* gpmc_ad12.lcd_data20, OUTPUT | MODE1 */
> >>+				0x34 0x01	/* gpmc_ad13.lcd_data21, OUTPUT | MODE1 */
> >>+				0x38 0x01	/* gpmc_ad14.lcd_data22, OUTPUT | MODE1 */
> >>+				0x3c 0x01	/* gpmc_ad15.lcd_data23, OUTPUT | MODE1 */
> >>+				0xa0 0x00	/* lcd_data0.lcd_data0, OUTPUT | MODE0 */
> >>+				0xa4 0x00	/* lcd_data1.lcd_data1, OUTPUT | MODE0 */
> >>+				0xa8 0x00	/* lcd_data2.lcd_data2, OUTPUT | MODE0 */
> >>+				0xac 0x00	/* lcd_data3.lcd_data3, OUTPUT | MODE0 */
> >>+				0xb0 0x00	/* lcd_data4.lcd_data4, OUTPUT | MODE0 */
> >>+				0xb4 0x00	/* lcd_data5.lcd_data5, OUTPUT | MODE0 */
> >>+				0xb8 0x00	/* lcd_data6.lcd_data6, OUTPUT | MODE0 */
> >>+				0xbc 0x00	/* lcd_data7.lcd_data7, OUTPUT | MODE0 */
> >>+				0xc0 0x00	/* lcd_data8.lcd_data8, OUTPUT | MODE0 */
> >>+				0xc4 0x00	/* lcd_data9.lcd_data9, OUTPUT | MODE0 */
> >>+				0xc8 0x00	/* lcd_data10.lcd_data10, OUTPUT | MODE0 */
> >>+				0xcc 0x00	/* lcd_data11.lcd_data11, OUTPUT | MODE0 */
> >>+				0xd0 0x00	/* lcd_data12.lcd_data12, OUTPUT | MODE0 */
> >>+				0xd4 0x00	/* lcd_data13.lcd_data13, OUTPUT | MODE0 */
> >>+				0xd8 0x00	/* lcd_data14.lcd_data14, OUTPUT | MODE0 */
> >>+				0xdc 0x00	/* lcd_data15.lcd_data15, OUTPUT | MODE0 */
> >>+				0xe0 0x00	/* lcd_vsync.lcd_vsync, OUTPUT | MODE0 */
> >>+				0xe4 0x00	/* lcd_hsync.lcd_hsync, OUTPUT | MODE0 */
> >>+				0xe8 0x00	/* lcd_pclk.lcd_pclk, OUTPUT | MODE0 */
> >>+				0xec 0x00	/* lcd_ac_bias_en.lcd_ac_bias_en, OUTPUT | MODE0 */
> >>+			>;
> >>+		};
> >>+
> >>  	};
> >>
> >>  	ocp {
> >>@@ -311,6 +345,10 @@
> >>  				};
> >>  			};
> >>  		};
> >>+
> >>+		lcdc: lcdc@4830e000 {
> >>+			status = "okay";
> >>+		};
> >>  	};
> >>
> >>  	vbat: fixedregulator@0 {
> >>@@ -374,6 +412,40 @@
> >>  		brightness-levels = <0 51 53 56 62 75 101 152 255>;
> >>  		default-brightness-level = <8>;
> >>  	};
> >>+
> >>+	panel {
> >>+		compatible = "ti,tilcdc,panel";
> 
> Nit: There are a lots of TI here :-)
> Could you just name it: ti,lcdc,panel ?
> 
> Thanks,
> Benoit
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
