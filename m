From: Baolin Wang <baolin.wang-lxIno14LUO0EEoCn2XhGlw@public.gmane.org>
Subject: Re: [PATCH v4 1/3] pinctrl: Add sleep related configuration
Date: Fri, 7 Jul 2017 16:13:02 +0800
Message-ID: <20170707081301.GA9683@spreadtrum.com>
References: <62a67526907157d41235403bd05af309fd4db16b.1498045588.git.baolin.wang@spreadtrum.com>
 <20170626161348.vrtlpat5eof5aa2c@rob-hp-laptop>
 <20170627082132.GB32447@spreadtrum.com>
 <20170627120626.GA1067@spreadtrum.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170627120626.GA1067-lxIno14LUO0EEoCn2XhGlw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, baolin.wang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Linusw and Rob,

On 二,  6月 27, 2017 at 08:06:26下午 +0800, Baolin Wang wrote:
> Hi,
> 
> On 二,  6月 27, 2017 at 04:21:32下午 +0800, Baolin Wang wrote:
> > On 一,  6月 26, 2017 at 11:13:48上午 -0500, Rob Herring wrote:
> > > On Wed, Jun 21, 2017 at 07:55:37PM +0800, Baolin Wang wrote:
> > > > In some scenarios, we should set some pins as input/output/pullup/pulldown
> > > > when the specified system goes into deep sleep mode, then when the system
> > > > goes into deep sleep mode, these pins will be set automatically by hardware.
> > > > 
> > > > Usually we can set the "sleep" state to set sleep related config, but one SoC
> > > > usually has not only one system (especially for mobile SoC), some systems on
> > > > the SoC which did not run linux kernel, they can not select the "sleep" state
> > > > when they go into deep sleep mode.
> > > 
> > > The wording here is not very clear. I think what you mean is some pins 
> > > are not controlled by any specific driver in the OS, but need to be 
> > > controlled when entering sleep mode.
> > 
> > Yes, that is what I meaning, sorry for confusing.
> > 
> > > 
> > > > Thus we introduce some sleep related config into pinconf-generic for users to
> > > > configure.
> > > > 
> > > > Signed-off-by: Baolin Wang <baolin.wang-lxIno14LUO0EEoCn2XhGlw@public.gmane.org>
> > > > ---
> > > >  - Add this patch since v4.
> > > > ---
> > > >  .../bindings/pinctrl/pinctrl-bindings.txt          |   12 ++++++++++++
> > > >  drivers/pinctrl/pinconf-generic.c                  |   10 ++++++++++
> > > >  include/linux/pinctrl/pinconf-generic.h            |   14 ++++++++++++++
> > > >  3 files changed, 36 insertions(+)
> > > > 
> > > > diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt b/Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
> > > > index bf3f7b0..e098059 100644
> > > > --- a/Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
> > > > +++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
> > > > @@ -236,6 +236,18 @@ low-power-enable	- enable low power mode
> > > >  low-power-disable	- disable low power mode
> > > >  output-low		- set the pin to output mode with low level
> > > >  output-high		- set the pin to output mode with high level
> > > > +sleep-bias-pull-up	- pull up the pin when the specified system goes into
> > > > +			  deep sleep mode
> > > > +sleep-bias-pull-down	- pull down the pin when the specified system goes into
> > > > +			  deep sleep mode
> > > > +sleep-input-enable	- enable input on pin when the specified system goes
> > > > +			  into deep sleep mode (no effect on output)
> > > > +sleep-intput-disable	- disable input on pin when the specified system goes
> > > > +			  into deep sleep mode (no effect on output)
> > > > +sleep-output-low	- set the pin to output mode with low level when the
> > > > +			  specified system goes into deep sleep mode
> > > > +sleep-output-high	- set the pin to output mode with high level when the
> > > > +			  specified system goes into deep sleep mode
> > > >  slew-rate		- set the slew rate
> > > 
> > > I don't really like having 2 ways to define pin setup and this doesn't 
> > > scale if I need to define 3 states. Couldn't we create pin state 
> > > definitions and have a pinctrl-n property within the pin controller 
> > > node to handle all the unhandled pins?
> > 
> > As LinusW also suggest we can create one "sleep" state and program them
> > into registers at early point (like: after probing pinctrl driver). So I
> > think I can introduce one called "early-sleep" state which need select it
> > after initializing pinctrl driver.
> 
> After more investigation, I do not think it is a good solution to create one
> state containing sleep related configs and select it at early point.
> 
> First these sleep related configs are pins' attributes, they should be set
> depanding on users situation, which means the state containing sleep related
> configs should be selected by users. We can not create one "sleep-xxx" state
> containing all pins' sleep related configs, and select it when initializing
> pinctrl driver.
> 
> Second if we create one "sleep-xxx" state containing sleep related configs,
> which means we should set one pin's configuration in 2 places.
> 
> If we introduce "sleep-input-enable" config, we can set the pin's config
> as below:
> vio_sd0_ms_3: regctrl3 {
> 	pins = "SC9860_RFCTL30", "SC9860_RFCTL31", "SC9860_RFCTL32";
> 	function = "func1";
> 	sprd,sleep-mode = <0x3>;
> 	sleep-input-enable;
> };
> 
> But If we create one extra "sleep-xxx" state for sleep-related configs,
> it will be like:
> grp1: regctrl3 {
> 	pins = "SC9860_RFCTL30", "SC9860_RFCTL31";
> 	function = "func1";
> 	sprd,sleep-mode = <0x3>;
> };
> 
> sleep-input: input_grp {
> 	pins = "SC9860_RFCTL30", "SC9860_RFCTL31", "SC9860_RFCTL32";
> 	input-enable;
> };
> 
> pinctrl-names = "sleep-input";
> pinctrl-0 = <&sleep-input>;
> 
> "sleep-input" state will be selected when initializing pinctrl driver, "grp1"
> will be selected by user to set other pin configuration.
> 
> Then we need config "SC9860_RFCTL30" pin in 2 different places, which is
> more inconvenient for users.
> 
> Accoring to above explanation, I think we should introduce these standard
> sleep related configs for users, but if you still have strong objection for
> it, I think I should introduce some SoC-specific attributes (something like
> "sprd,sleep-input") for our driver. LinusW and Rob, do you have any good
> suggestion? Thanks.

How can I handle these sleep related configs, do you have any good suggestion?
Thanks a lot.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
