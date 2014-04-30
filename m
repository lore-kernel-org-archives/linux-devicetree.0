From: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 07/15] ARM: dts: kirkwood: consolidate common pinctrl
 settings
Date: Wed, 30 Apr 2014 21:54:00 +0200
Message-ID: <536154D8.2010600@gmail.com>
References: <1398862602-29595-1-git-send-email-sebastian.hesselbarth@gmail.com> <1398862602-29595-8-git-send-email-sebastian.hesselbarth@gmail.com> <20140430164236.GC12944@obsidianresearch.com> <5361517D.8000106@gmail.com> <20140430194437.GB17365@obsidianresearch.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140430194437.GB17365-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 04/30/2014 09:44 PM, Jason Gunthorpe wrote:
> On Wed, Apr 30, 2014 at 09:39:41PM +0200, Sebastian Hesselbarth wrote:
>> On 04/30/2014 06:42 PM, Jason Gunthorpe wrote:
>>> On Wed, Apr 30, 2014 at 02:56:34PM +0200, Sebastian Hesselbarth wrote:
>>>> All SoCs have the same pinctrl setting for NAND, UART0/1, SPI, TWSI0,
>>>> and GBE1. Move it to the common pinctrl node that we now have.
> 
>> Yes, there are already some boards (e.g. t5325 with spi0) overwriting
>> pinctrl settings instead of overwriting the pinctrl-0 property. I
>> thought, I keep this behavior and note it above each pinctrl node in
>> some of the following patches.
> 
> That all makes sense, I think the commit message just seemed to say
> something else.

Well, this patch is about moving the pinctrl nodes to the common SoC
dtsi. The next 6 patches are about setting the default pinctrl property.

> Maybe more like:
> 
> NAND and TWSI0 have only one valid pin control choice on Kirkwood,
> move those definitions into the common dtsi.
> 
> For UART0/1 and SPI, which have two choices, move the definition that
> is used in the majority of the board files into the common dtsi.
> Board files that are different will override.

Ok, I see. Well, strictly speaking the setting node itself is always
valid, no matter if the board uses it. So that is why I first moved
them into kirkwood.dtsi and did set the pinctrl-0 property in the
later patches, e.g. commit message of Patch 9 reads:

"""
Most boards use the default UART0/1 pinctrl setting without RTS/CTS.
Add the pinctrl setting to the toplevel SoC UART nodes and put a note
in front of the corresponding pinctrl node to overwrite the setting
on board level. Currently, both boards using a different UART pinctrl
setting (Openblocks A6, A7) already overwrite the pinctrl node.
"""

But I can, of course, reword this commit message.

Sebastian

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
