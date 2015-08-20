From: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>
Subject: Re: [PATCH V7 1/2] mtd: spi-nor: Bindings for Cadence Quad SPI Flash Controller driver.
Date: Thu, 20 Aug 2015 06:03:19 +0200
Message-ID: <201508200603.19962.marex@denx.de>
References: <1439522892-7524-1-git-send-email-marex@denx.de> <55D3819D.1040009@opensource.altera.com> <55D39319.70108@st.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <55D39319.70108-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: vikas <vikas.manocha-qxv4g6HH51o@public.gmane.org>
Cc: Graham Moore <grmoore-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, "linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Alan Tull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Dinh Nguyen <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, Yves Vandervennet <yvanderv-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tuesday, August 18, 2015 at 10:18:33 PM, vikas wrote:
> Hi,
> 
> On 08/18/2015 12:03 PM, Graham Moore wrote:
> > Hi all,
> > 
> > On 08/18/2015 12:48 AM, Vikas MANOCHA wrote:
> > 
> > [...]
> > 
> >>>>> +Required properties:
> >>>>> +- compatible : Should be "cdns,qspi-nor".
> >>>>> +- reg : Contains two entries, each of which is a tuple consisting of
> >>>>> a +    physical address and length.  The first entry is the address
> >>>>> and +    length of the controller register set.  The second entry is
> >>>>> the +    address and length of the QSPI Controller data area.
> >>>> 
> >>>> "Controller data area", i think it means mapped NOR Flash address ?
> >>> 
> >>> Probably ; Graham ?
> >>> 
> >>>> If yes, it would be more clear with "Physical base address & size of
> >>>> NOR Flash".
> >>> 
> >>> This is the Direct mode thing, correct ? We don't support this, so I
> >>> think we should drop this bit altogether and keep only one single
> >>> address in this field.
> >> 
> >> No it's not.
> > 
> > It's the location of the SRAM fifo.  Also direct mode location I think,
> > if that were ever used.
> 
> Hmm...It is the base address of NOR flash. SRAM is not memory mapped.

Huh ? I am inclined to trust Graham more -- I have seen memory mapped SRAM,
but I have yet to see memory mapped SPI NOR. Also, the driver code clearly
uses that area in a way one would use a memory mapped SRAM with FIFO on the
other side. I think the above description is pretty much OK.

> > The size is determined by a configuration parameter during system
> > design.  On Altera Cyclone5 the size is really big compared to SRAM
> > fifo.  I don't know why, maybe some hw engineer thought it would be
> > better to have a large size in case direct mode was used.
> 
> my comment is about second parameter of property "reg" which is NOR flash
> address, so above explanation does not make sense for it.
> Also in direct mode, sram does not come into play.

This is absolutelly not a SPI NOR address.

Best regards,
Marek Vasut
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
