From: Matt Porter <matt.porter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 1/9] phy: add phy_get_bus_width()/phy_set_bus_width()
 calls
Date: Sat, 2 Nov 2013 13:47:09 -0400
Message-ID: <20131102174709.GE17505@beef>
References: <1383335158-19730-1-git-send-email-matt.porter@linaro.org>
 <1383335158-19730-2-git-send-email-matt.porter@linaro.org>
 <2395941.Lp2U7sdS37@flatron>
 <52753387.5030202@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <52753387.5030202-l0cyMroinI0@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
Cc: Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Christian Daudt <bcm-xK7y4jjYLqYh9ZMKESR00Q@public.gmane.org>, Paul Zimmerman <paulz-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux USB List <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linaro Patches <patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sat, Nov 02, 2013 at 10:46:55PM +0530, Kishon Vijay Abraham I wrote:
> Hi Tomasz,
> 
> On Saturday 02 November 2013 06:44 PM, Tomasz Figa wrote:
> >Hi Matt,
> >
> >On Friday 01 of November 2013 15:45:50 Matt Porter wrote:
> >>This adds a pair of APIs that allows the generic PHY subsystem to
> >>provide information on the PHY bus width. The PHY provider driver may
> >>use phy_set_bus_width() to set the bus width that the PHY supports.
> >>The controller driver may then use phy_get_bus_width() to fetch the
> >>PHY bus width in order to properly configure the controller.
> >
> >I somehow does not like this. If we take this path for any further
> >properties that we may need, we will end up with a lot of consumer
> >specific properties stored in a PHY object having their own accessor
> >functions.
> 
> Only after all of us feel that a property is *generic* enough, we
> allow it to be added in the PHY object.

I also want to note that this was discussed over in another thread [2]
where you did consider my rough stab at a more generic attribute
accessor. It was definitely my first reaction as the way to do it like
Tomasz has said. The specific accessors are more readable to me besides
the justification you mention above.

[2] http://lkml.indiana.edu/hypermail/linux/kernel/1310.3/00673.html

-Matt

> >Since this is just an integration detail, what about simply adding this as
> >a property in device tree node of the OTG controller (and pdata if
> >considering non-DT support)?
> 
> We already had a discussion about this and the dt maintainers
> suggested the property should be in the PHY. [1]
> 
> [1] ->  http://www.spinics.net/lists/devicetree/msg08851.html
> 
> Thanks
> Kishon
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
