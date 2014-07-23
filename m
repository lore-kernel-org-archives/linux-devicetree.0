From: "Ivan T. Ivanov" <iivanov@mm-sol.com>
Subject: Re: [PATCH RESEND v2 1/4] pinctrl: Update Qualcomm pm8xxx GPIO
 parameters definitions
Date: Wed, 23 Jul 2014 15:47:49 +0300
Message-ID: <1406119669.28520.10.camel@iivanov-dev>
References: <1405610748-7583-5-git-send-email-iivanov@mm-sol.com>
	 <1405626085-14069-1-git-send-email-iivanov@mm-sol.com>
	 <20140722214643.GH19700@sonymobile.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <20140722214643.GH19700@sonymobile.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@sonymobile.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Linus Walleij <linus.walleij@linaro.org>, Mark Brown <broonie@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, 2014-07-22 at 14:46 -0700, Bjorn Andersson wrote:
> On Thu, Jul 17, 2014 at 12:41 PM, Ivan T. Ivanov <iivanov@mm-sol.com> wrote:
> > From: "Ivan T. Ivanov" <iivanov@mm-sol.com>
> >
> 
> Hi Ivan,
> 
> Sorry for the slow response, I wanted to respin my pm8xxx-gpio driver to figure
> out some resonable answers to you.
> 

<snip>

> 
> > PM8018, PM8038, PM8058, PM8917, PM8921 pin controller hardware
> > support only one function 'gpio'. Currently GPIO's will
> > support only 'normal' mode. Rest of the modes will be added
> > later, if needed.
> >
> 
> This is not true.
> 
> As I said before, there is no such thing as "pin controller hardware"; both on
> pm8xxx and qpnp-pin there are two different HW blocks, one for GPIO and one for
> MPP. And if you look in your pinconf_set function you will see that they are
> very different.
> 
> I'm still trying to figure out the correct pinmux mapping for the various
> pmics, but the current indication is a list that looks like this:
>   "gpio"
>   "paired"
>   "ext_reg_en"
>   "ext_smps_en"
>   "fclk"
>   "kypd_drv"
>   "kypd_sns"
>   "lpa"
>   "lpg"
>   "mp3_clk"
>   "sleep_clk"
>   "uart"
>   "uim"
>   "upl"
> 
> I haven't looked through the dts files for 8974 and 8084, but it's not possible
> to describe the previous Qualcomm reference formfactor devices (MTP) with only
> "gpio".
