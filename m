Return-Path: <swarren@wwwdotorg.org>
Message-ID: <520C023A.5050204@wwwdotorg.org>
Date: Wed, 14 Aug 2013 16:18:34 -0600
From: Stephen Warren <swarren@wwwdotorg.org>
MIME-Version: 1.0
Subject: Re: [PATCH Resend 2/2] usb: phy: samsung: Update usbphy documentation
References: <1376479377-15732-1-git-send-email-sachin.kamat@linaro.org> <1376479377-15732-2-git-send-email-sachin.kamat@linaro.org>
In-Reply-To: <1376479377-15732-2-git-send-email-sachin.kamat@linaro.org>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
To: Sachin Kamat <sachin.kamat@linaro.org>
Cc: devicetree@vger.kernel.org, rob.herring@calxeda.com, pawel.moll@arm.com, mark.rutland@arm.com, ian.campbell@citrix.com, rob@landley.net, robherring2@gmail.com
List-ID: <devicetree@vger.kernel.org>

On 08/14/2013 05:22 AM, Sachin Kamat wrote:
> Updated the documentation as per the latest driver implementation.
> While at it also fixed some trivial typos.

> diff --git a/Documentation/devicetree/bindings/usb/samsung-usbphy.txt b/Documentation/devicetree/bindings/usb/samsung-usbphy.txt

> +- clocks : Clock IDs array as required by the controller.
> +- clock-names : names of clocks listed in clocks property in the same order
> +	       as requested by the controller driver.

This is wrong. The DT binding must specify the set of required
clock-names, not the driver; bindings must be self-contained. Also, the
order shouldn't matter, since everything should be looked up by name;
all that matters is the entries in clocks/clock-names match.

>  Optional properties:
> -- #address-cells: should be '1' when usbphy node has a child node with 'reg'
> +- #address-cellsi : should be '1' when usbphy node has a child node with 'reg'
>  		  property.

Type "cellsi".

What should the value be if there is no child node? In other words, I
think just delete the text "when usbphy node has a child node with 'reg'
property.". Same for size-cells.

> -- #size-cells: should be '1' when usbphy node has a child node with 'reg'
> +- #size-cells : should be '1' when usbphy node has a child node with 'reg'
>  	       property.

I don't think it's worth changing the binding doc just to add a space
before the colon... It looks better the first way, although
unfortunately many DT binding docs have the extra space.

> +- clocks : Clock IDs array as required by the controller.
> +- clock-names : names of clocks correseponding to IDs in the clock property
>  	       as requested by the controller driver.

May as well s/correseponding/corresponding/.
