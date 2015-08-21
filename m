From: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>
Subject: Re: [PATCH V7 1/2] mtd: spi-nor: Bindings for Cadence Quad SPI Flash Controller driver.
Date: Fri, 21 Aug 2015 05:46:28 +0200
Message-ID: <201508210546.28932.marex@denx.de>
References: <1439522892-7524-1-git-send-email-marex@denx.de> <201508200603.19962.marex@denx.de> <55D5FB19.9010402@st.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <55D5FB19.9010402-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: vikas <vikas.manocha-qxv4g6HH51o@public.gmane.org>
Cc: Graham Moore <grmoore-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, "linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Alan Tull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Dinh Nguyen <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, Yves Vandervennet <yvanderv-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thursday, August 20, 2015 at 06:06:49 PM, vikas wrote:
> Hi,

Hi!

[...]

> >>> It's the location of the SRAM fifo.  Also direct mode location I think,
> >>> if that were ever used.
> >> 
> >> Hmm...It is the base address of NOR flash. SRAM is not memory mapped.
> > 
> > Huh ? I am inclined to trust Graham more -- I have seen memory mapped
> > SRAM, but I have yet to see memory mapped SPI NOR.
> 
> Well, SPI NOR flash in SOCs normally is memory mapped.

I'm afraid you have some very disturbed views of how SPI NORs are operated
most of the time. No, SPI NOR is most often hanging off of some sort of SPI
controller just like any other SPI device. It is definitelly not common for
a SPI NOR to be memory mapped.

> To give some mainline examples, all Spear family SOCs (spear300, 320, 1310,
> 1340).

That's an exception, not a rule :)

> > Also, the driver code clearly
> > uses that area in a way one would use a memory mapped SRAM with FIFO on
> > the other side. I think the above description is pretty much OK.
> 
> that is the purpose of making NOR flash memory mapped.

I'm not sure if you agree with me or not anymore. I am pretty sure the 
discussion went quite far for such a trivial matter though.

> >>> The size is determined by a configuration parameter during system
> >>> design.  On Altera Cyclone5 the size is really big compared to SRAM
> >>> fifo.  I don't know why, maybe some hw engineer thought it would be
> >>> better to have a large size in case direct mode was used.
> >> 
> >> my comment is about second parameter of property "reg" which is NOR
> >> flash address, so above explanation does not make sense for it.
> >> Also in direct mode, sram does not come into play.
> > 
> > This is absolutelly not a SPI NOR address.
> 
> Then i can only suggest to check out the controller literature.
> 
> Think like this : what is the purpose of SRAM in all this flash access
> business, It can work without SRAM also, the only purpose of sram (& in
> fact indirect mode) is to access data from flash memory without AHB access
> to trigger it. Once the data is available in SRAM(in case of read), AHB
> Master can access it with low letency. Same is true for writes. SRAM is
> integral internal part of state machine in case of indirect mode, there is
> no need for it to memory mapped. If the controller does not support
> indirect mode, there is no need of sram in the system.
> 
> Hope it is little bit more clear.

It is, I understand what you're trying to convey now.

Yes, this register area can be used in certain modes of the controller in
such a way that it presents a window of the SPI NOR, which can be directly
accessed.

This register area can also be used as a FIFO, which is the way we used this
area in the driver . We read/write the first four bytes when communicating
with the flash.

So I don't really see a problem with calling the second register a "Controller
data area", that's what the IP documentation also calls it.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
