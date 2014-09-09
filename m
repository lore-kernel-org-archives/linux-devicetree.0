From: Matti Vaittinen <matti.vaittinen-OYasijW0DpE@public.gmane.org>
Subject: Re: [RESEND PATCH v3]     rtc: ds1307: add trickle charger device
 tree binding
Date: Tue, 9 Sep 2014 11:29:11 +0300
Message-ID: <20140909082902.GD21342@fi-ourus-dhcp00977.emea.nsn-net.net>
References: <20140908073216.GA20850@fi-ourus-dhcp00977.emea.nsn-net.net>
 <20140908112657.GD30828@titan.lakedaemon.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140908112657.GD30828-u4khhh1J0LxI1Ri9qeTfzeTW4wlIGRCZ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: ext Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, "linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org" <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org, "jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "arno-LkuqDEemtHBg9hUCZPvPmw@public.gmane.org" <arno-LkuqDEemtHBg9hUCZPvPmw@public.gmane.org>, jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org, san-KGKi0rHxN0fKWSuBa/xFvVpr/1R2p/CL@public.gmane.org, hs-ynQEQJNshbs@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org" <rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, Sverdlin Alexander <alexander.sverdlin-OYasijW0DpE@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Sep 08, 2014 at 07:26:57AM -0400, ext Jason Cooper wrote:
> Matti,
> 
> On Mon, Sep 08, 2014 at 10:32:24AM +0300, Matti Vaittinen wrote:
> > ---
> 
> Here.  Otherwise, it'll get included in the commit message, which I
> don't think was your intention.

Ok, thanks.

> 
> >  .../devicetree/bindings/i2c/trivial-devices.txt    |  1 -
> >  .../devicetree/bindings/rtc/dallas,ds1339.txt      | 18 ++++++
> >  drivers/rtc/rtc-ds1307.c                           | 66 ++++++++++++++++++++--
> >  3 files changed, 80 insertions(+), 5 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/rtc/dallas,ds1339.txt
> 
> I would split this into two patches, one for the binding documentation,
> and one for the C file changes.  You can then use
> ./scripts/get_maintainer.pl to see who the rtc maintainer is (nothing
> jumps out from my memory).

Splitting sounds reasonable. I will do this and also invert the default
diode setting to be connected as was suggested by Pavel in mail responce
to v1 of patch. And Alessandro is the maintainer for rtc according to
the MAINTAINERS file.

> 
> Most likely, the rtc maintainer will take the series with the DT
> maintainers Acks.  You made all the binding changes as discussed by Mark
> and I, so fwiw,
> 
> Acked-by: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
> 
> Just keep in mind that I'm not a DT maintainer, I've just moved a lot of
> patches into that area :-P  When you respin the series to split it, just
> throw my Ack on the binding docs.

Thanks, although the doc will change when I invert the default diode
setting  =)

Br.
Matti

-- 
=============================================

Matti Vaittinen
Senile SW Specialist
FINLAND 

~~ When things go utterly wrong vim users can always type :help! ~~

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
