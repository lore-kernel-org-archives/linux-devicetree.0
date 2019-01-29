From: Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: devicetree: media: Documentation of Bt.656 Bus DT bindings
Date: Tue, 29 Jan 2019 15:20:15 +0200
Message-ID: <20190129132015.tvtzycrzr46kotbt@paasikivi.fi.intel.com>
References: <CAPo_4QDW0r22ZTqtS_NDFWB3NFLBx9YEGgWKb-P9A3t_TBAFMQ@mail.gmail.com>
 <c4d68627-b26a-6402-daf4-5cd103ec9fd0@xs4all.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <c4d68627-b26a-6402-daf4-5cd103ec9fd0@xs4all.nl>
Sender: linux-kernel-owner@vger.kernel.org
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Ken Sloat <ken.sloat@ohmlinxelectronics.com>, linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, yong.deng@magewell.com, mchehab@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, maxime.ripard@bootlin.com, wens@csie.org, kieran.bingham@ideasonboard.com, laurent.pinchart@ideasonboard.com, jean-michel.hautbois@vodalys.com, Nate Drude <nate.drude@ohmlinxelectronics.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Ken, Hans,

On Mon, Jan 28, 2019 at 02:11:54PM +0100, Hans Verkuil wrote:
> +Sakari

Thanks for cc'ing me!

> 
> On 1/24/19 3:53 AM, Ken Sloat wrote:
> > There are a number of v4l2 subdevices in the kernel that support a
> > Bt.656 bus also known as "embedded sync." Previously in older versions
> > of the kernel (and in the current 4.14 LTS kernel), the standard way
> > to enable this in device tree on a parallel bus was to simply omit all
> > hysync and vsync flags.
> > 
> > During some other kernel development I was doing, it was brought to my
> > attention that there is now a standard defined binding in
> > "video-interfaces.txt" called "bus-type" that should be used in order
> > to enable Bt.656 mode. While omitting the flags still appears to work
> > because of other assumptions made in v4l2-fwnode driver, this method
> > is now outdated and improper.
> > 
> > However, I have noticed that several dt binding docs have not been
> > updated to reflect this change and still reference the old method:
> > 
> > Documentation/devicetree/bindings/media/sun6i-csi.txt
> > /* If hsync-active/vsync-active are missing,
> >    embedded BT.656 sync is used */
> > 
> > Documentation/devicetree/bindings/media/i2c/tvp5150.txt
> > "If none of hsync-active, vsync-active and field-even-active is specified,
> > the endpoint is assumed to use embedded BT.656 synchronization."
> > 
> > Documentation/devicetree/bindings/media/i2c/adv7604.txt
> > "If none of hsync-active, vsync-active and pclk-sample is specified the
> >   endpoint will use embedded BT.656 synchronization."
> > 
> > and amazingly even
> > Documentation/devicetree/bindings/media/video-interfaces.txt in one of
> > the code snippets
> > /* If hsync-active/vsync-active are missing,
> >    embedded BT.656 sync is used */

Yeah, these are the old bindings indeed.

> > 
> > In order to avoid future confusion in the matter and ensure that the
> > proper bindings are used, I am proposing submitting patches to update
> > these docs to at minimum remove these statements and maybe even adding
> > additional comments specifying the optional property and value for
> > Bt.656 where missing. I wanted to open a discussion here first before
> > doing this though. Thoughts?

I agree. If a device supports different busses on the same port, then the
bus-type property is needed. This is often the case for Bt.656 and parallel
(Bt.601?) interfaces.

This should be documented so that new devices would use the bus type. The
existing bindings still need to be supported in drivers though.

I cc'd the devicetree list as well.

> > 
> > Thanks,
> > Ken Sloat
> > 
> 
> I certainly agree that this should be updated to make it all consistent.

-- 
Kind regards,

Sakari Ailus
sakari.ailus@linux.intel.com
