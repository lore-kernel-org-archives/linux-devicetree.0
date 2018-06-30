Return-Path: <SRS0=1rqC=JQ=free.fr=robert.jarzmik@kernel.org>
From: Robert Jarzmik <robert.jarzmik@free.fr>
Subject: Re: [PATCH 6/7] mmc: pxamci: remove pxa-mmc,gpio-power from devicetree bindings
References: <20180629144738.446-1-daniel@zonque.org>
	<20180629144738.446-7-daniel@zonque.org>
Date: Sat, 30 Jun 2018 17:25:47 +0200
Message-ID: <87k1qgi9dw.fsf@belgarion.home>
MIME-Version: 1.0
Content-Type: text/plain
To: Daniel Mack <daniel@zonque.org>
Cc: ulf.hansson@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, linux-mmc@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Daniel Mack <daniel@zonque.org> writes:

> Devicetree-enabled boards should use proper regulators to control the
> power of cards, not GPIOs, so let's remove this property. The regulator
> properties are are supported by the MMC core and are described in the
s/are are/are/

> Note that devicetree support for PXA platforms hasn't fully landed yet,
> so this binding does not have any users at this point.
No users in-tree to be more specific.
> diff --git a/Documentation/devicetree/bindings/mmc/pxa-mmc.txt b/Documentation/devicetree/bindings/mmc/pxa-mmc.txt
> index b7025de7dced..359b13977f24 100644
> --- a/Documentation/devicetree/bindings/mmc/pxa-mmc.txt
> +++ b/Documentation/devicetree/bindings/mmc/pxa-mmc.txt
> @@ -8,7 +8,6 @@ Required properties:
>  
>  Optional properties:
>  - marvell,detect-delay-ms: sets the detection delay timeout in ms.
> -- marvell,gpio-power: GPIO spec for the card power enable pin
Okay, I don't have a big devicetree knowledge, but wouldn't it make sense to
augment the example in this file to show the proper usage of card power (and at
it wp-gpio and cd-gpio) ?

Cheers.

-- 
Robert
