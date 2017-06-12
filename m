From: Baolin Wang <baolin.wang@spreadtrum.com>
Subject: Re: [PATCH v3 1/2] DT: pinctrl: Add binding documentation for
 Spreadtrum pin controller
Date: Mon, 12 Jun 2017 14:20:29 +0800
Message-ID: <20170612062029.GC8566@spreadtrum.com>
References: <359d62c1f2f7ef61c6160df9b60c1af4bfcea89a.1496753918.git.baolin.wang@spreadtrum.com>
 <20170609134420.kc4cxn7b6uap5j3d@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170609134420.kc4cxn7b6uap5j3d@rob-hp-laptop>
Sender: linux-gpio-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: linus.walleij@linaro.org, mark.rutland@arm.com, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, broonie@kernel.org, baolin.wang@linaro.org
List-Id: devicetree@vger.kernel.org

Hi Rob,

On 五,  6月 09, 2017 at 08:44:20上午 -0500, Rob Herring wrote:
> On Tue, Jun 06, 2017 at 09:03:13PM +0800, Baolin Wang wrote:
> > This patch adds the binding documentation for Spreadtrum SC9860 pin
> > controller device.
> 
> For the subject:  "dt-bindings: pinctrl: Add Spreadtrum SC9860 pin 
> controller"

Ok. Will fix in next version.

> 
> > 
> > Signed-off-by: Baolin Wang <baolin.wang@spreadtrum.com>
> > ---
> > Changes since v2:
> >  - No updates.
> > 
> > Changes since v1:
> >  - Remove magic numbers and get to use the standard bindings.
> >  - Fix some typos.
> > ---
> >  .../devicetree/bindings/pinctrl/sprd,pinctrl.txt   |   56 +++++++++++++++++
> >  .../bindings/pinctrl/sprd,sc9860-pinctrl.txt       |   66 ++++++++++++++++++++
> >  2 files changed, 122 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/pinctrl/sprd,pinctrl.txt
> >  create mode 100644 Documentation/devicetree/bindings/pinctrl/sprd,sc9860-pinctrl.txt
> > 
> > diff --git a/Documentation/devicetree/bindings/pinctrl/sprd,pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/sprd,pinctrl.txt
> > new file mode 100644
> > index 0000000..2f544cd
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/pinctrl/sprd,pinctrl.txt
> > @@ -0,0 +1,56 @@
> > +* Spreadtrum Pin Controller
> > +
> > +The Spreadtrum pin controller are organized in 3 blocks (types).
> > +
> > +The first block comprises some global control registers, and each
> > +register contains several bit fields with one bit or several bits
> > +to configure for some global common configuration, such as domain
> > +pad driving level, system control select and so on. We recognise
> > +every fields comprising one bit or several bits in one global control
> > +register as one pin, thus we should record every pin's bit offset,
> > +bit width and register offset to configure this field (pin). Since
> > +this type pins' configuration are very tricky and different for each
> > +register, we introduce "sprd,ctrl" property to set the various global
> > +control configuration.
> > +
> > +The second block comprises some common registers which have unified
> > +register definition, and each register described one pin is used
> > +to configure the pin sleep mode and function select. Now we have 4
> > +systems on SC9860 SoC: AP system, PUBCP system, TGLDSP system and
> > +AGDSP system. In some situation we have some pin-sleep related
> > +configuration need to set when one of system goes into deep sleep
> > +mode. For example, if we set the pin sleep mode as AP_SLEEP, which
> > +means when AP system goes into deep sleep mode, this pin's sleep
> > +related properties (input/output or pullup/down) will be set
> > +automatically. Thus we intoduce "sprd,sleep_mode" to set pin sleep
> > +mode.
> > +
> > +The last block comprises some misc registers which also have unified
> > +register definition, and each register described one pin is used to
> > +configure drive strength, pull up/down and so on. Especially for pull
> > +up, we introduce "sprd,pullup" property for two kind configuration:
> > +PULLUP_20K or PULLUP_4_7K, which means the pullup resistor is 20K or
> > +4.7K.
> > +
> > +Required properties for Spreadtrum pin controller:
> > +- compatible: "sprd,<soc>-pinctrl"
> > +  Please refer to each sprd,<soc>-pinctrl.txt binding doc for supported SoCs.
> > +- reg: The register address of pin controller device.
> > +- pins : An array of pin names.
> > +
> > +Optional properties:
> > +- function: Specified the function name.
> > +- drive-strength: Drive strength in mA.
> > +- input-schmitt-disable: Enable schmitt-trigger mode.
> > +- input-schmitt-enable: Disable schmitt-trigger mode.
> > +- bias-disable: Disable pin bias.
> > +- bias-pull-down: Pull down on pin.
> > +- sprd,ctrl: Control values referring to databook for global control pins.
> > +- sprd,sleep_mode: Sleep mode selection.
> > +- sprd,pullup: Pull up on pin.
> > +- sprd,input-sleep: Input enable when system goes into deep sleep mode.
> > +- sprd,output-sleep: Output enable when system goes into deep sleep mode.
> > +- sprd,pullup_sleep: Pull up enable when system goes into deep sleep mode.
> > +- sprd,pulldown_sleep: Pull down enable when system goes into deep sleep mode.
> > +
> > +Please refer to each sprd,<soc>-pinctrl.txt binding doc for supported values.
> > diff --git a/Documentation/devicetree/bindings/pinctrl/sprd,sc9860-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/sprd,sc9860-pinctrl.txt
> > new file mode 100644
> > index 0000000..10b77e1
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/pinctrl/sprd,sc9860-pinctrl.txt
> > @@ -0,0 +1,66 @@
> > +* Spreadtrum SC9860 Pin Controller
> > +
> > +Please refer to sprd,pinctrl.txt in this directory for common binding part
> > +and usage.
> > +
> > +Required properties:
> > +- compatible: Must be "sprd,sc9860-pinctrl".
> > +- reg: The register address of pin controller device.
> > +- pins : An array of strings, each string containing the name of a pin.
> > +
> > +Optional properties:
> > +- function: A string containing the name of the function, values must be
> > +  one of: "func1", "func2", "func3" and "func4".
> > +- drive-strength: Drive strength in mA. Supported values: 2, 4, 6, 8, 10,
> > +  12, 14, 16, 20, 21, 24, 25, 27, 29, 31 and 33.
> > +- input-schmitt-disable: Enable schmitt-trigger mode.
> > +- input-schmitt-enable: Disable schmitt-trigger mode.
> > +- bias-disable: Disable pin bias.
> > +- bias-pull-down: Pull down on pin.
> > +- sprd,ctrl: Control values referring to databook for global control pins.
> > +- sprd,sleep_mode: Choose the pin sleep mode, and supported values are:
> 
> sprd,sleep-mode

OK.

> 
> > +  AP_SLEEP, PUBCP_SLEEP, TGLDSP_SLEEP and AGDSP_SLEEP.
> > +- sprd,pullup: Pull up on pin, the value should be PULLUP_20K or PULLUP_4_7K.
> 
> Different pull strengths is pretty commom. Seems like this should be a 
> common property.

Yes, will fix it.

> 
> > +- sprd,input-sleep: Input enable when system goes into deep sleep mode.
> > +- sprd,output-sleep: Output enable when system goes into deep sleep mode.
> 
> Seems like you would also need to define the state for output mode.

You mean "output-high" and "output-low"? For SC9860 platform we do not need to set
output high or low, since it will be automatic accoding to the pin's pull up or
pull down setting.

> 
> > +- sprd,pullup_sleep: Pull up enable when system goes into deep sleep mode.
> > +- sprd,pulldown_sleep: Pull down enable when system goes into deep sleep mode.
> 
> s/_/-/

OK.

> 
> > +
> > +Pin sleep mode definition:
> > +enum pin_sleep_mode {
> > +	AP_SLEEP = BIT(0),
> > +	PUBCP_SLEEP = BIT(1),
> > +	TGLDSP_SLEEP = BIT(2),
> > +	AGDSP_SLEEP = BIT(3),
> > +};
> > +
> > +Pin pullup mode definition:
> > +enum pin_pullup_sel {
> > +	PULLUP_20K,
> > +	PULLUP_4_7K,
> > +};
> > +
> > +Example:
> > +pin_controller: pinctrl@402a0000 {
> > +	compatible = "sprd,sc9860-pinctrl";
> > +	reg = <0x402a0000 0x10000>;
> > +
> > +	grp1: sd0 {
> > +		pins = "SC9860_VIO_SD2_IRTE", "SC9860_VIO_SD0_IRTE";
> > +		sprd,ctrl = <0x1>;
> > +	};
> > +
> > +	grp2: rfctl_33 {
> > +		pins = "SC9860_RFCTL33";
> > +		function = "func2";
> > +		sprd,sleep_mode = <AP_SLEEP | PUBCP_SLEEP>;
> > +		sprd,output-sleep;
> > +	};
> > +
> > +	grp3: rfctl_misc_20 {
> > +		pins = "SC9860_RFCTL20_MISC";
> > +		drive-strength = <10>;
> > +		sprd,pullup = <PULLUP_4_7K>;
> > +		sprd,pullup-sleep;
> > +	};
> > +};
> > -- 
> > 1.7.9.5
> > 
