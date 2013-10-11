From: Rajendra Nayak <rnayak@ti.com>
Subject: Re: [PATCH] regulator: dts: Fix bindings description of regulator-boot-on
Date: Fri, 11 Oct 2013 16:03:48 +0530
Message-ID: <5257D40C.3060501@ti.com>
References: <1381487207-18298-1-git-send-email-nm@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1381487207-18298-1-git-send-email-nm@ti.com>
Sender: linux-doc-owner@vger.kernel.org
To: Nishanth Menon <nm@ti.com>
Cc: Rob Landley <rob@landley.net>, Mark Brown <broonie@linaro.org>, Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Kishon Vijay Abraham I <kishon@ti.com>, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Friday 11 October 2013 03:56 PM, Nishanth Menon wrote:
> Since regulator-boot-on property maps back to constraints->boot_on,
> current description of 'regulator-boot-on' property conflicts with
> description of 'boot-on' in include/linux/regulator/machine.h and the
> corresponding implementation in drivers/regulator/core.c.
> 
> Ensure the description is more inline with the original intent.
> 
> Cc: Rajendra Nayak <rnayak@ti.com>
> 
> Reported-by: Kishon Vijay Abraham I <kishon@ti.com>
> Signed-off-by: Nishanth Menon <nm@ti.com>
> ---
> 
> Ref: my confusion in http://marc.info/?t=138140228800004&r=1&w=2
> Based on v3.12-rc4 tag
> 
>  .../devicetree/bindings/regulator/regulator.txt    |    4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/regulator/regulator.txt b/Documentation/devicetree/bindings/regulator/regulator.txt
> index 2bd8f09..d999f096 100644
> --- a/Documentation/devicetree/bindings/regulator/regulator.txt
> +++ b/Documentation/devicetree/bindings/regulator/regulator.txt
> @@ -8,7 +8,9 @@ Optional properties:
>  - regulator-min-microamp: smallest current consumers may set
>  - regulator-max-microamp: largest current consumers may set
>  - regulator-always-on: boolean, regulator should never be disabled
> -- regulator-boot-on: bootloader/firmware enabled regulator
> +- regulator-boot-on: regulator is enabled when the system is initially started.
> +  If the regulator is not enabled by the hardware or bootloader then it will be
> +  enabled when the constraints are applied.

Isn't this specific to how the linux regulator framework implements it?
why should it be documented in the generic bindings documentation which has
nothing Linux specific but more hardware details?

>  - regulator-allow-bypass: allow the regulator to go into bypass mode
>  - <name>-supply: phandle to the parent supply/regulator node
>  - regulator-ramp-delay: ramp delay for regulator(in uV/uS)
> 

