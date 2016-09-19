From: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH v6] drm: bridge/dw_hdmi: add dw hdmi i2c bus adapter
 support
Date: Mon, 19 Sep 2016 09:09:25 +0200
Message-ID: <1474268965.3117.9.camel@pengutronix.de>
References: <1472017597-11221-1-git-send-email-vladimir_zapolskiy@mentor.com>
         <20160829155006.GA27342@rob-hp-laptop>
         <749c8858-9fd2-dcbc-d980-1652c4682e31@mentor.com>
         <1474039310.2491.77.camel@pengutronix.de>
         <f3ca3e02-43b8-e6fa-d4cd-023f9d50fabb@mentor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <f3ca3e02-43b8-e6fa-d4cd-023f9d50fabb-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vladimir Zapolskiy <vladimir_zapolskiy-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
Cc: Russell King <rmk+kernel-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: devicetree@vger.kernel.org

Am Freitag, den 16.09.2016, 20:38 +0300 schrieb Vladimir Zapolskiy:
> Hi Philipp,
[...]
> >> as far as I know David accepts pull requests from you, can you please
> >> create and send a pull request for v4.9 containing these changes?
> >>
> >>     https://patchwork.kernel.org/patch/9284717/ -- with Russell's ack
> >
> > Is that a forward looking statement? I don't see Russell's ack.
> 
> Here it is: http://www.spinics.net/lists/dri-devel/msg115880.html

Thank you.

> Please don't bother about two other commits from that series, at least
> there are official maintainers for the changes. And by the way please
> consider to add youself as a maintainer of DW HDMI.
> 
> >>     https://patchwork.kernel.org/patch/9296883/ -- with Rob's ack and yours tested-by
> >>
> >> Some users anticipate this change, for example see https://lkml.org/lkml/2016/9/14/55
> >
> > Those I see. I can re-test and prepare a pull request.

Re-tested on Nitrogen6X with this patch applied:

----------8<----------
diff --git a/arch/arm/boot/dts/imx6qdl-nitrogen6x.dtsi b/arch/arm/boot/dts/imx6qdl-nitrogen6x.dtsi
index 97d9c33..5d60c14 100644
--- a/arch/arm/boot/dts/imx6qdl-nitrogen6x.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-nitrogen6x.dtsi
@@ -292,7 +292,6 @@
 };
 
 &hdmi {
-	ddc-i2c-bus = <&i2c2>;
 	status = "okay";
 };
 
@@ -439,8 +438,8 @@
 
 		pinctrl_i2c2: i2c2grp {
 			fsl,pins = <
-				MX6QDL_PAD_KEY_COL3__I2C2_SCL		0x4001b8b1
-				MX6QDL_PAD_KEY_ROW3__I2C2_SDA		0x4001b8b1
+				MX6QDL_PAD_KEY_COL3__HDMI_TX_DDC_SCL	0x4001b8b1
+				MX6QDL_PAD_KEY_ROW3__HDMI_TX_DDC_SDA	0x4001b8b1
 			>;
 		};
 
---------->8----------

I'll send a pull request shortly.

regards
Philipp

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
