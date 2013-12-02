From: Gerhard Sittig <gsi-ynQEQJNshbs@public.gmane.org>
Subject: Re: [PATCH v1 1/1] dts: bindings: add mpc5121 clocks binding document
Date: Mon, 2 Dec 2013 17:55:20 +0100
Message-ID: <20131202165520.GX2982@book.gsilab.sittig.org>
References: <20131202094656.GA12952@e106331-lin.cambridge.arm.com>
 <1385994034-2513-1-git-send-email-gsi@denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1385994034-2513-1-git-send-email-gsi-ynQEQJNshbs@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Dec 02, 2013 at 15:20 +0100, Gerhard Sittig wrote:
> 
> add a clock bindings documentation file for Freescale MPC5121
> 
> this binding implements and uses existing common clock bindings,
> it does not introduce a new binding semantics but discusses the
> specific use on Freescale MPC5121 and provides examples
> 
> [ ... ]
> 
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/mpc5121-clock.txt
> @@ -0,0 +1,95 @@
> +Device Tree Clock bindings for Freescale MPC5121
> +
> [ ... ]
> +
> +Required properties:
> +- compatible:	shall contain "fsl,mpc5121-clock"
> +- reg:		shall specify the start address and length of the
> +		clock module's set of control registers
> +- #clock-cells:	shall be 1; defines the number of integer cells
> +		required for a clock specifier which references
> +		this clock provider

In hindsight the wording is not good (especially 'reg'), will see
how I can improve this.  And the layout may improve some more.

> +
> +Optional properties:
> +- clocks:	list of phandle and clock specifier pairs for the
> +		node's input clocks, following the common clock
> +		consumers binding; should be empty, or one XTAL/OSC
> +		clock reference
> +- clock-names:	list of clock input name strings sorted in the same
> +		order as the 'clocks' property

Mark, I very much like your suggestion to state that 'clocks'
should match 'clock-names' (and not vice versa, found in another
thread, after having sent this patch).

And noticed that 'clock-names' still does not say that the
XTAL/OSC should go by the name "osc".  And should not say that at
most one clock is accepted or how their order is.


So I will wait for more feedback, but can tell already that v1
needs an update before becoming acceptable.  Thank you for your
patience. :)


virtually yours
Gerhard Sittig
-- 
DENX Software Engineering GmbH,     MD: Wolfgang Denk & Detlev Zundel
HRB 165235 Munich, Office: Kirchenstr. 5, D-82194 Groebenzell, Germany
Phone: +49-8142-66989-0 Fax: +49-8142-66989-80  Email: office-ynQEQJNshbs@public.gmane.org
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
