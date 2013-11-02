From: Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 1/9] phy: add phy_get_bus_width()/phy_set_bus_width() calls
Date: Sat, 02 Nov 2013 18:58:46 +0100
Message-ID: <1391452.2H43C6z4fl@flatron>
References: <1383335158-19730-1-git-send-email-matt.porter@linaro.org> <52753387.5030202@ti.com> <20131102174709.GE17505@beef>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131102174709.GE17505@beef>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Matt Porter <matt.porter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Christian Daudt <bcm-xK7y4jjYLqYh9ZMKESR00Q@public.gmane.org>, Paul Zimmerman <paulz-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux USB List <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linaro Patches <patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Saturday 02 of November 2013 13:47:09 Matt Porter wrote:
> On Sat, Nov 02, 2013 at 10:46:55PM +0530, Kishon Vijay Abraham I wrote:
> > Hi Tomasz,
> > 
> > On Saturday 02 November 2013 06:44 PM, Tomasz Figa wrote:
> > >Hi Matt,
> > >
> > >On Friday 01 of November 2013 15:45:50 Matt Porter wrote:
> > >>This adds a pair of APIs that allows the generic PHY subsystem to
> > >>provide information on the PHY bus width. The PHY provider driver
> > >>may
> > >>use phy_set_bus_width() to set the bus width that the PHY supports.
> > >>The controller driver may then use phy_get_bus_width() to fetch the
> > >>PHY bus width in order to properly configure the controller.
> > >
> > >I somehow does not like this. If we take this path for any further
> > >properties that we may need, we will end up with a lot of consumer
> > >specific properties stored in a PHY object having their own accessor
> > >functions.
> > 
> > Only after all of us feel that a property is *generic* enough, we
> > allow it to be added in the PHY object.
> 
> I also want to note that this was discussed over in another thread [2]
> where you did consider my rough stab at a more generic attribute
> accessor. It was definitely my first reaction as the way to do it like
> Tomasz has said. The specific accessors are more readable to me besides
> the justification you mention above.
> 
> [2] http://lkml.indiana.edu/hypermail/linux/kernel/1310.3/00673.html

Personally I like that version much better, but still it would need to be 
polished a bit.

How I imagine such interface to be implemented:

phy.h:

struct phy {
	// ...
	const struct phy_attrs *attrs;
	// ...
};

static inline const struct phy_attrs *phy_get_attrs(struct phy *phy) {
	return phy->attrs;
};

phy driver:

static const struct phy_attrs my_phy_attrs = {
	// ...
};

static int my_phy_probe(...)
{
	// ...
	phy = devm_phy_create_attrs(dev, &ops, &my_phy_attrs, NULL);
	// ...
}

phy consumer:

	// ...
	const struct phy_attrs *phy_attrs;

	phy_attrs = phy_get_attrs(phy);
	// ...

Why I think it is better than what I've seen in this and previous instance 
of this thread? (in random order)
 a) Only the PHY driver can set the attrs.
 b) PHY consumer has access only to a const pointer.
 c) PHY attributes can be placed in a static struct inside a driver file, 
without the need to call any functions to set particular attributes.
 d) Can be extended with more attributes easily.

Best regards,
Tomasz

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
