From: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Subject: Re: [PATCH v2 2/2] ARM: Dove: Add the audio device to the Cubox DT
Date: Tue, 8 Oct 2013 14:16:47 -0400
Message-ID: <20131008181647.GW5402@titan.lakedaemon.net>
References: <20131008194232.7d74b9e6@armhf>
 <525448DE.5030004@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <525448DE.5030004-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Jean-Francois Moine <moinejf-GANU6spQydw@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Ian Campbell <ian.campbell-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Oct 08, 2013 at 08:03:10PM +0200, Sebastian Hesselbarth wrote:
> On 10/08/2013 07:42 PM, Jean-Francois Moine wrote:
> >This patch activates the audio device of the Cubox.
> >
> >The audio flow (pin mpp_audio1) is output on both I2S and S/PDIF.
> >
> >The third si5351 clock (#2, pin mpp13) is used as the external clock.
> >
> >Signed-off-by: Jean-Francois Moine <moinejf-GANU6spQydw@public.gmane.org>
> >---
> >  arch/arm/boot/dts/dove-cubox.dts | 20 ++++++++++++++++++++
> >  1 file changed, 20 insertions(+)
> >
> >diff --git a/arch/arm/boot/dts/dove-cubox.dts b/arch/arm/boot/dts/dove-cubox.dts
> >index 022646e..bb38a24 100644
> >--- a/arch/arm/boot/dts/dove-cubox.dts
> >+++ b/arch/arm/boot/dts/dove-cubox.dts
> >@@ -132,3 +132,23 @@
> >  		reg = <0>;
> >  	};
> >  };
> >+
> >+&pinctrl {
> >+	pmx_gpio_13_audio1: pmx-gpio-13-audio1 {
> 
> Jean-Francois,
> 
> please name the node "pmx_audio1_extclk: pmx-audio1-extclk"
> and move both to the corresponding section in dove.dtsi.
> We can reuse them on other Dove boards for sure.
> 
> >+		marvell,pins = "mpp13";
> >+		marvell,function = "audio1";
> >+	};
> >+
> >+	pmx_audio1_i2s1_spdifo: pmx-audio1-i2s1-spdifo {
> >+		marvell,pins = "mpp_audio1";
> >+		marvell,function = "i2s1/spdifo";
> >+	};
> >+};
> >+
> >+&audio1 {
> >+	status = "okay";
> >+	clocks = <&gate_clk 13>, <&si5351 2>;
> >+	clock-names = "internal", "extclk";
> >+	pinctrl-0 = <&pmx_audio1_i2s1_spdifo &pmx_gpio_13_audio1>;
> 
> The above needs updated phandles then.
> 
> Otherwise,
> 
> Acked-by: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Once you make the above changes, just send a v3 in-reply-to this patch
and I'll pick it up with the other two.

thx,

Jason.

> 
> >+	pinctrl-names = "default";
> >+};
> >
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
