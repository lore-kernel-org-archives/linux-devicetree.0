Return-Path: <swarren@wwwdotorg.org>
Message-ID: <520C0146.5050300@wwwdotorg.org>
Date: Wed, 14 Aug 2013 16:14:30 -0600
From: Stephen Warren <swarren@wwwdotorg.org>
MIME-Version: 1.0
Subject: Re: [PATCH Resend 1/2] usb: samsung: Update Exynos ehci/ohci bindings
 documentation
References: <1376479377-15732-1-git-send-email-sachin.kamat@linaro.org>
In-Reply-To: <1376479377-15732-1-git-send-email-sachin.kamat@linaro.org>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
To: Sachin Kamat <sachin.kamat@linaro.org>
Cc: devicetree@vger.kernel.org, rob.herring@calxeda.com, pawel.moll@arm.com, mark.rutland@arm.com, ian.campbell@citrix.com, rob@landley.net, robherring2@gmail.com
List-ID: <devicetree@vger.kernel.org>

On 08/14/2013 05:22 AM, Sachin Kamat wrote:
> Updated the document as per the latest implementation.
> While at it also fixed some trivial typos.

> diff --git a/Documentation/devicetree/bindings/usb/exynos-usb.txt b/Documentation/devicetree/bindings/usb/exynos-usb.txt

>  EHCI
>  Required properties:
> - - compatible: should be "samsung,exynos4210-ehci" for USB 2.0
> -   EHCI controller in host mode.
> - - reg: physical base address of the controller and length of memory mapped
> + - compatible : should be one of the following for USB 2.0 EHCI controller
> +		in host mode:
> +	(a) "samsung,exynos5440-ehci" for Exynos5440 SoC
> +	(b) "samsung,exynos4210-ehci" for all other Exynos4 and 5 SoCs

I'm not sure the text "in host mode" belongs there. The DT should
describe the presence of the EHCI controller HW module. Whether the
module is programmed for host mode or device mode is surely a run-time
decision, not something that would need different DT bindings?
