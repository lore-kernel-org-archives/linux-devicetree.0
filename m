From: Bin Liu <b-liu-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH 1/4] USB: Fix of_usb_get_dr_mode_by_phy with a shared phy
 block
Date: Thu, 2 Jun 2016 13:16:48 -0500
Message-ID: <20160602181648.GB28820@uda0271908>
References: <1464888666-17728-1-git-send-email-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1464888666-17728-1-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Thu, Jun 02, 2016 at 07:31:03PM +0200, Hans de Goede wrote:
> Some SoCs have a single phy-hw-block with multiple phys, this is
> modelled by a single phy dts node, so we end up with multiple
> controller nodes with a phys property pointing to the phy-node
> of the otg-phy.
> 
> Only one of these controllers typically is an otg controller, yet we

Is it guaranteed that only one of them will be otg? 

> were checking the first controller who uses a phy from the block and
> then end up looking for a dr_mode property in e.g. the ehci controller.
> 
> Instead of looking for nodes with a phy property, look for nodes
> with a dr_mode property, so that we actually access the dr_mode property
> in a node which has it.

Quote from Documentation/devicetree/bindings/usb/generic.txt:
"- dr_mode: ...
		In case this attribute isn't
		passed via DT, USB DRD controllers should default to
		OTG."

So it is not mandatory to define dr_mode in DT, then you wouldn't be
able to find the controller in such case.

Regards,
-Bin.

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
