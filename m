From: Weiqing Kong <weiqing.kong-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 2/3] arm: dts: mt2701: Add display bls related nodes for
 MT2701
Date: Thu, 15 Jun 2017 13:34:41 +0800
Message-ID: <1497504881.25398.9.camel@mhfsdcap03>
References: <1496297324-21091-1-git-send-email-erin.lo@mediatek.com>
         <1496297324-21091-3-git-send-email-erin.lo@mediatek.com>
         <82c8b877-ec34-bd37-7428-8af86191a66e@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <82c8b877-ec34-bd37-7428-8af86191a66e-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Erin Lo <erin.lo-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, YT Shen <yt.shen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, 2017-06-09 at 10:12 +0200, Matthias Brugger wrote:
> 
> On 01/06/17 08:08, Erin Lo wrote:
> > From: YT Shen <yt.shen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> 
> I miss the Singed-off-by from YT Shen.
> 
> > 
> > This patch adds the device node of display backlight for MT2701
> > 
> > Signed-off-by: Weiqing Kong <weiqing.kong-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> > Signed-off-by: Erin Lo <erin.lo-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> > ---
> >   arch/arm/boot/dts/mt2701-evb.dts | 29 +++++++++++++++++++++++++++++
> >   arch/arm/boot/dts/mt2701.dtsi    |  9 +++++++++
> >   2 files changed, 38 insertions(+)
> > 
> > diff --git a/arch/arm/boot/dts/mt2701-evb.dts b/arch/arm/boot/dts/mt2701-evb.dts
> > index a483798..e49c2b7 100644
> > --- a/arch/arm/boot/dts/mt2701-evb.dts
> > +++ b/arch/arm/boot/dts/mt2701-evb.dts
> > @@ -22,6 +22,35 @@
> >   	memory {
> >   		reg = <0 0x80000000 0 0x40000000>;
> >   	};
> > +
> > +	backlight_lcd: backlight_lcd {
> > +		compatible = "pwm-backlight";
> > +		pwms = <&bls 0 100000>;
> > +		brightness-levels = <
> > +			  0  16  32  48  64  80  96 112
> > +			128 144 160 176 192 208 224 240
> > +			255
> > +		>;
> > +		default-brightness-level = <9>;
> > +		pinctrl-names = "default";
> > +		pinctrl-0 = <&pwm_bls_gpio>;
> > +	};
> > +};
> > +
> > +&bls {
> > +	status = "okay";
> > +};
> > +
> > +&mmsys {
> > +	status = "okay";
> > +};
> > +
> > +&pio {
> > +	pwm_bls_gpio: pwm_bls_gpio {
> > +		pins_cmd_dat {
> > +			pinmux = <MT2701_PIN_208_AUD_EXT_CK1__FUNC_DISP_PWM>;
> > +		};
> > +	};
> >   };
> >   
> >   &auxadc {
> > diff --git a/arch/arm/boot/dts/mt2701.dtsi b/arch/arm/boot/dts/mt2701.dtsi
> > index de88bd7..4f110d5 100644
> > --- a/arch/arm/boot/dts/mt2701.dtsi
> > +++ b/arch/arm/boot/dts/mt2701.dtsi
> > @@ -366,6 +366,15 @@
> >   		#clock-cells = <1>;
> >   	};
> >   
> > +	bls: bls@1400a000 {
> > +		compatible = "mediatek,mt2701-disp-pwm";
> > +		reg = <0 0x1400a000 0 0x1000>;
> > +		#pwm-cells = <2>;
> > +		clocks = <&mmsys CLK_MM_MDP_BLS_26M>, <&mmsys CLK_MM_DISP_BLS>;
> > +		clock-names = "main", "mm";
> > +		status = "disabled";
> > +	};
> > +
> 
> Can you make this a new patch please. It's preferred to have one patch 
> for the dtsi and another one for the actual board.
> 
> Thanks,
> Matthias

OK, I will split it into two patches.

Thanks,
Weiqing Kong

> 
> >   	larb0: larb@14010000 {
> >   		compatible = "mediatek,mt2701-smi-larb";
> >   		reg = <0 0x14010000 0 0x1000>;
> > 


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
