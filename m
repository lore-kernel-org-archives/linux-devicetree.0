From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v1 1/1] dt: binding: reword PowerPC 8xxx GPIO documentation
Date: Thu, 21 Nov 2013 01:49:43 +0100
Message-ID: <201311210149.43944.arnd@arndb.de>
References: <201311182328.40743.arnd@arndb.de> <1384983293-11002-1-git-send-email-gsi@denx.de>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1384983293-11002-1-git-send-email-gsi-ynQEQJNshbs@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Gerhard Sittig <gsi-ynQEQJNshbs@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "Rob Herring@" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wednesday 20 November 2013, Gerhard Sittig wrote:
> re-format and re-word the device tree binding documentation for MPC8xxx
> and compatibles, reference the common document for interrupt controllers
> and remove outdated duplicate SoC specific information
> 
> Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
> Cc: Rob Herring@ <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
> Cc: Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>
> Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
> Cc: <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
> Signed-off-by: Gerhard Sittig <gsi-ynQEQJNshbs@public.gmane.org>

Acked-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>

> +Optional properties:
> +- interrupt-controller:	Empty boolean property which marks the GPIO
> +			module as an IRQ controller.
> +- #interrupt-cells:	Number of integer cells required to specify an
> +			interrupt within this interrupt controller.  The
> +			first cell defines the pin number, the second
> +			cell defines additional flags (trigger type,
> +			trigger polarity).  Note that the specific set
> +			of trigger conditions supported by the GPIO
> +			module depends on the actual SoC.

Nitpicking: I think you need to add that #interrupt-cells must be <2>
if present. I'd also suggest adding these two to the example section
of the binding while you're at it.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
