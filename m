From: Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [Patch 1/3] media: ov5640: add PIXEL_RATE control
Date: Wed, 2 Oct 2019 15:35:13 +0300
Message-ID: <20191002123513.GI972@paasikivi.fi.intel.com>
References: <20190925152301.21645-1-bparrot@ti.com>
 <20190925152301.21645-2-bparrot@ti.com>
 <20191001075704.GA5449@paasikivi.fi.intel.com>
 <20191001162341.f2o7ruar2nifl5ws@ti.com>
 <20191002075951.afp2xligspqat4ew@uno.localdomain>
 <20191002121438.g3re6v54q4hit2wv@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20191002121438.g3re6v54q4hit2wv@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Benoit Parrot <bparrot@ti.com>
Cc: Jacopo Mondi <jacopo@jmondi.org>, Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, hugues.fruchet@st.com
List-Id: devicetree@vger.kernel.org

Hi Benoit,

On Wed, Oct 02, 2019 at 07:14:38AM -0500, Benoit Parrot wrote:
> Hi Jacopo,
> 
> Maybe, I miss spoke when I mentioned a helper I did not intent a framework
> level generic function. Just a function to help in this case :)
> 
> That being said, I re-read the thread you mentioned. And as Hughes pointed
> out dynamically generating a "working" link frequency value which can be
> used by a CSI2 receiver to properly configure its PHY is not trivial.
> 
> When I created this patch, I also had another to add V4L2_CID_LINK_FREQ
> support. I am testing this against the TI CAL CSI2 receiver, which already
> uses the V4L2_CID_PIXEL_RATE value for that purpose, so I also had a patch
> to add support for V4L2_CID_LINK_FREQ to that driver as well.
> 
> Unfortunately, similar to Hughes' findings I was not able to make it "work"
> with all supported resolution/framerate.
> 
> Unlike my V4L2_CID_PIXEL_RATE solution which now works in all mode with the
> same receiver.
> 
> So long story short I dropped the V4L2_CID_LINK_FREQ patch and focused on
> V4L2_CID_PIXEL_RATE instead.

It shouldn't make a difference which one you use; if you know the bus type
(and if it's CSI-2 with D-PHY, number of lanes and how many bits per pixel
the media bus format has), you can convert fairly trivially between the
two.

-- 
Sakari Ailus
sakari.ailus@linux.intel.com
