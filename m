From: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH v7 3/3] clk: stm32h7: Add stm32h743 clock driver
Date: Fri, 21 Jul 2017 13:37:12 -0700
Message-ID: <20170721203712.GH19878@codeaurora.org>
References: <1500474344-9832-1-git-send-email-gabriel.fernandez@st.com>
 <1500474344-9832-4-git-send-email-gabriel.fernandez@st.com>
 <d999fc79-7b14-da8e-965f-371cf4352dd1@mleia.com>
 <11c37627-a39b-7f2d-d0d4-af312eac8668@st.com>
 <c5264416-754b-6ec8-f9fb-3b0ac2ba3a58@mleia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <c5264416-754b-6ec8-f9fb-3b0ac2ba3a58-ChpfBGZJDbMAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vladimir Zapolskiy <vz-ChpfBGZJDbMAvxtiuMwx3w@public.gmane.org>
Cc: Gabriel FERNANDEZ <gabriel.fernandez-qxv4g6HH51o@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre TORGUE <alexandre.torgue-qxv4g6HH51o@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Nicolas Pitre <nico-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, "daniel.thompson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <daniel.thompson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "andrea.merello-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <andrea.merello-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "radoslaw.pietrzyk-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <radoslaw.pietrzyk-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Sylvain Lemieux <slemieux.tyco-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel-u79uwXL29TZNg+MwTxZMZA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 07/20, Vladimir Zapolskiy wrote:
> Hi Gabriel,
> 
> On 07/20/2017 11:31 AM, Gabriel FERNANDEZ wrote:
> > Hi Vladimir,
> > 
> > 
> > On 07/19/2017 11:20 PM, Vladimir Zapolskiy wrote:
> >> Hello Gabriel,
> >>
> >> On 07/19/2017 05:25 PM, gabriel.fernandez-qxv4g6HH51o@public.gmane.org wrote:
> >>> From: Gabriel Fernandez <gabriel.fernandez-qxv4g6HH51o@public.gmane.org>
> >>> +
> >>> +	rcc: rcc@58024400 {
> >> 'rcc' as a generic device node name is awkward.
> >>
> >> I believe the main function of the device is clock controller (unlikely
> >> a generic reset controller can be converted into a clock controller),
> >> the locations of the document and device driver also indicate that
> >> primarily it is a clock controller, so I suggest to replace device node
> >> name with 'clock-controller' like below:
> > I prefer to keep rcc node name, to be coherent with the other ST 
> > platforms (STM32F4/F7)
> 
> the thing is, a device node name is expected to comply with ePAPR or
> the devicetree specification, which says
> 
> 	The name of a node should be somewhat generic, reflecting
> 	the function of the device and not its precise programming model.
> 
> If devicetree and CCF maintainers are fine with 'rcc', I won't object,
> my role is just to emphasize the found issue and recommend to use another
> and more common name 'clock-controller', it is a simple and fortunately
> backward compatible change to other ST platforms as well.

Yes. It should be generic so clock-controller or
clock-reset-controller is appropriate here.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
