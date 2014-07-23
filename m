From: "Ivan T. Ivanov" <iivanov-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH RESEND v2 1/4] pinctrl: Update Qualcomm pm8xxx GPIO
 parameters definitions
Date: Wed, 23 Jul 2014 19:05:56 +0300
Message-ID: <1406131556.2585.42.camel@iivanov-dev>
References: <1405610748-7583-5-git-send-email-iivanov@mm-sol.com>
	 <1405626085-14069-1-git-send-email-iivanov@mm-sol.com>
	 <20140722214643.GH19700@sonymobile.com>
	 <1406119669.28520.10.camel@iivanov-dev>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1406119669.28520.10.camel@iivanov-dev>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bjorn Andersson <bjorn.andersson-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


Hi,  

I have accidentally pressed send in the earlier message.

On Wed, 2014-07-23 at 15:47 +0300, Ivan T. Ivanov wrote:
> On Tue, 2014-07-22 at 14:46 -0700, Bjorn Andersson wrote:
> > On Thu, Jul 17, 2014 at 12:41 PM, Ivan T. Ivanov <iivanov-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org> wrote:
> > > From: "Ivan T. Ivanov" <iivanov-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org>
> > >
> > 
> > Hi Ivan,
> > 
> > Sorry for the slow response, I wanted to respin my pm8xxx-gpio driver to figure
> > out some resonable answers to you.
> > 
> 
> <snip>
> 
> > 
> > > PM8018, PM8038, PM8058, PM8917, PM8921 pin controller hardware
> > > support only one function 'gpio'. Currently GPIO's will
> > > support only 'normal' mode. Rest of the modes will be added
> > > later, if needed.
> > >
> > 
> > This is not true.
> > 
> > As I said before, there is no such thing as "pin controller hardware"; 

This is matter of interpretation :-)

> both on
> > pm8xxx and qpnp-pin there are two different HW blocks, one for GPIO and one for
> > MPP. And if you look in your pinconf_set function you will see that they are
> > very different.

I bet that the hardware blocks are almost identical, just register
map is different.

> > 
> > I'm still trying to figure out the correct pinmux mapping for the various
> > pmics, but the current indication is a list that looks like this:
> >   "gpio"
> >   "paired"
> >   "ext_reg_en"
> >   "ext_smps_en"
> >   "fclk"
> >   "kypd_drv"
> >   "kypd_sns"
> >   "lpa"
> >   "lpg"
> >   "mp3_clk"
> >   "sleep_clk"
> >   "uart"
> >   "uim"
> >   "upl"
> > 

Ok, I see. But lets make things simpler. 

It seems that "uim" could be "SDC_UIM_VBIAS" on DB8074, which looks like MPP in
analog-output mode/function, with additional selection for voltage level (qcom,aout?)

Closest to "uart" function, that I have found, is that one of the SPI buses on the
above board is level translated trough several MPP's, but this still did not make them
act like a UART.

However, I seems that some of the GPIO's could act like clock and PWM sources. 

> > I haven't looked through the dts files for 8974 and 8084, but it's not possible
> > to describe the previous Qualcomm reference formfactor devices (MTP) with only
> > "gpio".

I believe that these DTS files are using qcom,mode(DIG_IN|DIG_OUT|AIN|AOUT..) and 
qcom,src-sel to select desired function. For example:

apq8074-dragonboard:
/* GPIO 1 */
qcom,mode = <0>
qcom,src-sel = <0>

apq8084-cdp:
qcom,mode = <1>;                /* Digital output */
qcom,src-sel = <2>;             /* Special Function 1=LPG 3 */

apq8084-mtp:
/* NFC clk request */
qcom,mode = <0>;                /* QPNP_PIN_MODE_DIG_IN */
qcom,src-sel = <2>;             /* QPNP_PIN_SEL_FUNC_1 */

apq8084-sbc:
/* BACKLIGHT2_PWM */
qcom,mode = <1>;                /* Digital output */
qcom,src-sel = <2>;             /* Special Function 1=LPG 5 */

apq8084-sbc:
/* DIV_CLK3 SLEEP_CLK */
qcom,mode = <1>;                /* Digital output */
qcom,src-sel = <3>;             /* Function 2 */

...

I could just guess what the functions 1 and 2 means.

In which case GPIO functions could be gpio, keypad, clk, pwm/lpg, ...

Rest of the pinctrl parameters prosed looks fine. 

Thanks,
Ivan


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
