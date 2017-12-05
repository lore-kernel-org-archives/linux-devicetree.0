From: Quentin Schulz <quentin.schulz-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v5 00/11] add pinmuxing support for pins in
 AXP209 and AXP813 PMICs
Date: Tue, 5 Dec 2017 15:51:08 +0100
Message-ID: <8ff99511-eccb-9d9f-ddc0-35b875cce92d@free-electrons.com>
References: <20171205144647.17594-1-quentin.schulz@free-electrons.com>
Reply-To: quentin.schulz-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBCLZXSNY5IDBBXPETLIQKGQEW3626WQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20171205144647.17594-1-quentin.schulz-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Content-Language: en-US
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi all,

Copy pasting of the cover letter done wrong, there are only 9 patches in
this patch series unlike what's specified in the title of the cover
letter for this patch series.

Sorry for the noise.

Quentin

On 05/12/2017 15:46, Quentin Schulz wrote:
> The AXP209 and AXP813 PMICs have several pins (respectively 3 and 2) that can
> be used either as GPIOs or for other purposes (ADC or LDO here).
> 
> We already have a GPIO driver for the GPIO use of those pins on the AXP209.
> Let's "upgrade" this driver to support all the functions these pins can have.
> 
> Then we add support to this driver for the AXP813 which is slighlty different
> (basically a different offset in two registers and one less pin).
> 
> I suggest patches 1 to 8 go through Linus's tree and 9 via Lee's.
> 
> v5:
>   - add reference to pinctrl dt-bindings in driver's dt-binding,
>   - add statement that this driver employs per-pin muxing pattern,
>   - add a patch on top of the patch series to fix checkpatch warnings,
>   - add a few information to the Kconfig to make checkpatch happy,
> 
> v4:
>   - separate dt-binding patch when adding pinctrl feature,
>   - use - instead of _ in DT node name,
>   - remove muxing operation from pinctrl driver when choosing LDO mux in order
>   to not interfere with the regulator framework,
>   - add adc_mux to specify specific mux value for ADC (different between AXP209
>   and AXP813),
>   - misc modifications (header include reordering, unsigned int -> u8,
>   new line removal),
> 
> v3:
>   - add defines for GPIO funcs,
>   - use again get_regs function instead of drv_data (which was implemented in
>   v2),
>   - use of_device_id data for device specific data (gpio_status_offset and pins
>   description),
>   - change compatible from axp813-pctl to axp813-gpio,
>   - use axp81x DT label instead of axp813 since AXP813 and AXP818 are similar,
>   - add dtsi include for all boards embedding axp813/axp818,
> 
> v2:
>   - add support for AXP813 pins,
>   - split into more patches so it is easier to follow the modifications,
>   - reorder of some patches,
>   - register all pins within the same range instead of a range per pin,
> 
> Thanks,
> Quentin
> 
> Quentin Schulz (9):
>   gpio: axp209: switch unsigned variables to unsigned int
>   pinctrl: move gpio-axp209 to pinctrl
>   pinctrl: axp209: add pinctrl features
>   dt-bindings: gpio: gpio-axp209: add pinctrl features
>   pinctrl: axp209: rename everything from gpio to pctl
>   pinctrl: axp209: add programmable gpio_status_offset
>   pinctrl: axp209: add programmable ADC muxing value
>   pinctrl: axp209: add support for AXP813 GPIOs
>   mfd: axp20x: add pinctrl cell for AXP813
> 
>  .../devicetree/bindings/gpio/gpio-axp209.txt       |  49 ++-
>  drivers/gpio/Kconfig                               |   6 -
>  drivers/gpio/Makefile                              |   1 -
>  drivers/gpio/gpio-axp209.c                         | 188 --------
>  drivers/mfd/axp20x.c                               |   3 +
>  drivers/pinctrl/Kconfig                            |  10 +
>  drivers/pinctrl/Makefile                           |   1 +
>  drivers/pinctrl/pinctrl-axp209.c                   | 476 +++++++++++++++++++++
>  8 files changed, 537 insertions(+), 197 deletions(-)
>  delete mode 100644 drivers/gpio/gpio-axp209.c
>  create mode 100644 drivers/pinctrl/pinctrl-axp209.c
> 

-- 
Quentin Schulz, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
