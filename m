From: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Subject: Re: [PATCH v3 2/7] dt-bindings: media: Add MAX2175 binding description
Date: Tue, 11 Apr 2017 15:58:43 +0300
Message-ID: <3047384.gnbYERV3WE@avalon>
References: <1486479757-32128-1-git-send-email-ramesh.shanmugasundaram@bp.renesas.com> <6297638.5S79beP3Jj@avalon> <HK2PR06MB0545F9FBB1B27E91D80F906EC3000@HK2PR06MB0545.apcprd06.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <HK2PR06MB0545F9FBB1B27E91D80F906EC3000-jAC1QCBx2F1Af0bSEaWBKm0DtJ1/0DrXvxpqHgZTriW3zl9H0oFU5g@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ramesh Shanmugasundaram <ramesh.shanmugasundaram-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
Cc: "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org" <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>, "sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org" <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, "crope-X3B1VOXEql0@public.gmane.org" <crope-X3B1VOXEql0@public.gmane.org>, Chris Paterson <Chris.Paterson2-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>, "geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org" <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, "linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Ramesh,

On Tuesday 11 Apr 2017 12:19:54 Ramesh Shanmugasundaram wrote:
> > On Tuesday 11 Apr 2017 09:57:45 Ramesh Shanmugasundaram wrote:
> >>> On Tuesday 07 Feb 2017 15:02:32 Ramesh Shanmugasundaram wrote:
> >>>> Add device tree binding documentation for MAX2175 Rf to bits tuner
> >>>> device.
> >>>> 
> >>>> Signed-off-by: Ramesh Shanmugasundaram
> >>>> <ramesh.shanmugasundaram-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
> >>>> ---
> >>>>  .../devicetree/bindings/media/i2c/max2175.txt      | 61 +++++++++++++
> >>>>  .../devicetree/bindings/property-units.txt         |  1 +
> >>>>  2 files changed, 62 insertions(+)
> >>>>  create mode 100644
> >>>> 
> >>>> Documentation/devicetree/bindings/media/i2c/max2175.txt
> >>>> diff --git
> >>>> a/Documentation/devicetree/bindings/media/i2c/max2175.txt
> >>>> b/Documentation/devicetree/bindings/media/i2c/max2175.txt new file
> >>>> mode 100644 index 0000000..f591ab4
> >>>> --- /dev/null
> >>>> +++ b/Documentation/devicetree/bindings/media/i2c/max2175.txt
> > 
> > [snip]
> > 
> >>>> +- maxim,am-hiz	      : empty property indicates AM Hi-Z filter
> >>>> path is
> >>>> +			selected for AM antenna input. By default this
> >>>> +			filter path is not used.
> >>> 
> >>> Isn't this something that should be selected at runtime through a
> >>> control ? Or does the hardware design dictate whether the filter has
> >>> to be used or must not be used ?
> >> 
> >> This is dictated by the h/w design and not selectable at run-time.
> >> I will update these changes in the next patchset.
> > 
> > In that case I'm fine with a property, but could we name it in such a way
> > that it describes the hardware instead of instructing the software on how
> > to configure the device ? For instance (and this is a made-up example as I
> > don't know exactly how this works), if the AM Hi-Z filter is required when
> > dealing with AM frequencies and forbidden when dealing with other
> > frequency bands, and *if* boards have to be designed specifically for one
> > frequency band (AM, FM, VHF, L, ...) without any way to accept different
> > bands, then you could instead use
> > 
> > 	maxim,frequency-band = "AM";
> > 
> > and enable the filter accordingly in the driver. This would be in my
> > opinion a better system hardware description.
> 
> I am not sure. The AM antenna input path has a default filter and AM Hi-Z
> filter. H/W dictates the path to be used for AM input only and this is
> fixed. The device can be configured to use different bands at runtime & not
> AM only. I could edit the description as below:
> 
> - maxim,am-hiz	      : empty property indicates AM Hi-Z filter path
> usage for AM antenna input as dictated by hardware design. By default this
> filter path is not used.
> 
> Is it any better? Do you still think the property name should be changed
> please?

I still think this should be renamed, but possibly because I don't understand 
all the details of this particular feature :-). The property, as named and 
documented above, describes a software features. It requests the driver to 
enable the AM Hi-Z filter. DT properties should instead describe the hardware. 
You should use a property that describes the hardware design, and use that to 
infer, in the driver, whether to enable or disable the filter.

-- 
Regards,

Laurent Pinchart

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
