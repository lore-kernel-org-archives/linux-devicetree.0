From: Angus Ainslie <angus@akkea.ca>
Subject: Re: [PATCH v2 1/3] devicetree: bindings: bd718x7: document HW state  related ROHM specific properties
Date: Wed, 13 Feb 2019 15:38:40 -0800
Message-ID: <044d28c6ea1f9dd58f4c1942411aaf58@www.akkea.ca>
References: <cover.1550050645.git.matti.vaittinen@fi.rohmeurope.com>
 <501fe1a68a9ad0987ddc0d3f559b2bdd1f65a5b7.1550050645.git.matti.vaittinen@fi.rohmeurope.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <501fe1a68a9ad0987ddc0d3f559b2bdd1f65a5b7.1550050645.git.matti.vaittinen@fi.rohmeurope.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc: mazziesaccount@gmail.com, Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, heikki.haikola@fi.rohmeurope.com, mikko.mutanen@fi.rohmeurope.com, =?UTF-8?Q?Robin_Gong_=E2=80=8E?= <yibin.gong@nxp.com>, =?UTF-8?Q?Elven?= =?UTF-8?Q?_Wang_=E2=80=8E?= <elven.wang@nxp.com>, =?UTF-8?Q?Anson_Huan?= =?UTF-8?Q?g_=E2=80=8E?= <anson.huang@nxp.com>, linux-kernel-owner@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Matti,

On 2019-02-13 01:50, Matti Vaittinen wrote:
> Add ROHM BD71837 / BD71847 specific device tree bindings for
> controlling the PMIC shutdown/reset states and voltages for
> different HW states. The PMIC was designed to be used with NXP
> i.MX8 SoC and it supports SNVS low power state which seems to
> be typical for NXP i.MX SoCs. However, when SNVS is used we must
> not allow SW to control enabling/disabling those regulators which
> are crucial for system to boot as there is a HW limitation which
> causes SW controlled regulators to be kept shut down after SNVS
> reset.
> 
> Allow setting the SNVS to be used as reset target state and allow
> marking those regulators which are critical for boot.
> 
> Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
> ---
>  .../devicetree/bindings/mfd/rohm,bd71837-pmic.txt  | 15 +++++++++++
>  .../bindings/regulator/rohm,bd71837-regulator.txt  | 30 
> ++++++++++++++++++++++
>  2 files changed, 45 insertions(+)
> 
> diff --git
> a/Documentation/devicetree/bindings/mfd/rohm,bd71837-pmic.txt
> b/Documentation/devicetree/bindings/mfd/rohm,bd71837-pmic.txt
> index a4b056761eaa..f07c32975315 100644
> --- a/Documentation/devicetree/bindings/mfd/rohm,bd71837-pmic.txt
> +++ b/Documentation/devicetree/bindings/mfd/rohm,bd71837-pmic.txt
> @@ -23,6 +23,21 @@ Required properties:
> 
>  Optional properties:
>  - clock-output-names	: Should contain name for output clock.
> +- rohm,reset-snvs-powered : Transfer BD718x7 to SNVS state at reset.
> +
> +The BD718x7 supports two different HW states as reset target states. 
> States
> +are called as SNVS and READY. At READY state all the PMIC power 
> outputs go
> +down and OTP is reload. At the SNVS state all other logic and external
> +devices apart from the SNVS power domain are shut off. Please refer to 
> NXP
> +i.MX8 documentation for further information regarding SNVS state. When 
> a
> +reset is done via SNVS state the PMIC OTP data is not reload. This 
> cause
> +

It looks like there is some text missing here.

> +There is a HW quirk in BD718x7 which causes power outputs that have 
> been
> +under SW control to stay down when reset has switched power state to 
> SNVS.
> +If reset is done via READY state the power outputs will be set to HW 
> control
> +by OTP loading. Thus the reset target state is set to READY by 
> default. If
> +SNVS state is used the boot crucial regulators must have the
> +regulator-always-on and regulator-boot-on properties set in regulator 
> node.
> 
>  Example:
> 
> diff --git
> a/Documentation/devicetree/bindings/regulator/rohm,bd71837-regulator.txt
> b/Documentation/devicetree/bindings/regulator/rohm,bd71837-regulator.txt
> index 4b98ca26e61a..4a05cbf915ee 100644
> --- 
> a/Documentation/devicetree/bindings/regulator/rohm,bd71837-regulator.txt
> +++ 
> b/Documentation/devicetree/bindings/regulator/rohm,bd71837-regulator.txt
> @@ -27,8 +27,38 @@ BUCK1, BUCK2, BUCK3, BUCK4, BUCK5, BUCK6
>  LDO1, LDO2, LDO3, LDO4, LDO5, LDO6
> 
>  Optional properties:
> +- rohm,dvs-run-voltage		: PMIC default "RUN" state voltage in uV.
> +				  See below table for bucks which support this.
> +- rohm,dvs-idle-voltage		: PMIC default "IDLE" state voltage in uV.
> +				  See below table for bucks which support this.
> +- rohm,dvs-suspend-voltage	: PMIC default "SUSPEND" state voltage in 
> uV.
> +				  See below table for bucks which support this.
>  - Any optional property defined in bindings/regulator/regulator.txt
> 
> +Supported default DVS states:
> +
> +BD71837:
> +buck	| dvs-run-voltage	| dvs-idle-voltage	| dvs-suspend-voltage
> +-----------------------------------------------------------------------------
> +1	| supported		| supported		| supported
> +----------------------------------------------------------------------------
> +2	| supported		| supported		| not supported
> +----------------------------------------------------------------------------
> +3	| supported		| not supported		| not supported
> +----------------------------------------------------------------------------
> +4	| supported		| not supported		| not supported
> +----------------------------------------------------------------------------
> +rest	| not supported		| not supported		| not supported
> +
> +BD71847:
> +buck	| dvs-run-voltage	| dvs-idle-voltage	| dvs-suspend-voltage
> +-----------------------------------------------------------------------------
> +1	| supported		| supported		| supported
> +----------------------------------------------------------------------------
> +2	| supported		| supported		| not supported
> +----------------------------------------------------------------------------
> +rest	| not supported		| not supported		| not supported
> +
>  Example:

Could you add an example of the optional properties ?

Thanks
Angus

>  regulators {
>  	buck1: BUCK1 {
> --
> 2.14.3
