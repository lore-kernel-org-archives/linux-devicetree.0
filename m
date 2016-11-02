From: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Subject: Re: [RFC 5/5] doc_rst: media: New SDR formats SC16, SC18 & SC20
Date: Wed, 02 Nov 2016 22:58:47 +0200
Message-ID: <6165707.yDnDHhpUBT@avalon>
References: <1476281429-27603-1-git-send-email-ramesh.shanmugasundaram@bp.renesas.com> <2893157.XL3Txm4q5I@avalon> <SG2PR06MB10389152CEC59BB77A5DA7DDC3A00@SG2PR06MB1038.apcprd06.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <SG2PR06MB10389152CEC59BB77A5DA7DDC3A00-ESzmfEwOt/zfc7TNChRnj20DtJ1/0DrXvxpqHgZTriW3zl9H0oFU5g@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ramesh Shanmugasundaram <ramesh.shanmugasundaram-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
Cc: "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org" <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>, "sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org" <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, "crope-X3B1VOXEql0@public.gmane.org" <crope-X3B1VOXEql0@public.gmane.org>, Chris Paterson <Chris.Paterson2-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>, "geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org" <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, "linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Ramesh,

On Wednesday 02 Nov 2016 09:00:00 Ramesh Shanmugasundaram wrote:
> Hi Laurent,
> 
> Any further thoughts on the SDR format please (especially the comment
> below). I would appreciate your feedback.
>
> >> On Wednesday 12 Oct 2016 15:10:29 Ramesh Shanmugasundaram wrote:
> >>> This patch adds documentation for the three new SDR formats
> >>> 
> >>> V4L2_SDR_FMT_SCU16BE
> >>> V4L2_SDR_FMT_SCU18BE
> >>> V4L2_SDR_FMT_SCU20BE
> 
> [snip]
> 
> >>> +
> >>> +       -  start + 0:
> >>> +
> >>> +       -  I'\ :sub:`0[D13:D6]`
> >>> +
> >>> +       -  I'\ :sub:`0[D5:D0]`
> >>> +
> >>> +    -  .. row 2
> >>> +
> >>> +       -  start + buffer_size/2:
> >>> +
> >>> +       -  Q'\ :sub:`0[D13:D6]`
> >>> +
> >>> +       -  Q'\ :sub:`0[D5:D0]`
> >> 
> >> The format looks planar, does it use one V4L2 plane (as does NV12) or
> >> two V4L2 planes (as does NV12M) ? Same question for the other formats.
> > 
> > Thank you for bringing up this topic. This is one of the key design
> > dilemma.
> > 
> > The I & Q data for these three SDR formats comes from two different DMA
> > channels and hence two separate pointers -> we could say it is v4l2 multi-
> > planar. Right now, I am making it look like a single plane by presenting
> > the data in one single buffer ptr.
> > 
> > For e.g. multi-planar SC16 format would look something like this
> > 
> > <------------------------32bits---------------------->
> > <--I(14 bit data) + 2bit status--16bit padded zeros--> : start0 + 0
> > <--I(14 bit data) + 2bit status--16bit padded zeros--> : start0 + 4 ...
> > <--Q(14 bit data) + 2bit status--16bit padded zeros--> : start1 + 0
> > <--Q(14 bit data) + 2bit status--16bit padded zeros--> : start1 + 4
> > 
> > My concerns are
> > 
> > 1) These formats are not a standard as the video "Image Formats". These
> > formats are possible when we use DRIF + MAX2175 combination. If we
> > interface with a different tuner vendor, the above format(s) MAY/MAY NOT
> > be re-usable. We do not know at this point. This is the main open item for
> > discussion in the cover letter.

If the formats are really device-specific then they should be documented 
accordingly and not made generic.

> > 2) MPLANE support within V4L2 seems specific to video. Please correct me
> > if this is wrong interpretation.
> > 
> > - struct v4l2_format contains v4l2_sdr_format and
> > v4l2_pix_format_mplane as members of union. Should I create a new
> > v4l2_sdr_format_mplane? If I have to use v4l2_pix_format_mplane most of
> > the video specific members would be unused (it would be similar to using
> > v4l2_pix_format itself instead of v4l2_sdr_format)?

I have no answer to that question as I'm not familiar with SDR. Antti, you've 
added v4l2_sdr_format to the API, what's your opinion ? Hans, as you've acked 
the patch, your input would be appreciated as well.

> > - The above decision (accomodate SDR & MPLANE) needs to be
> > propagated across the framework. Is this the preferred approach?
> > 
> > It goes back to point (1). As of today, the change set for this combo
> > (DRIF+MAX2175) introduces new SDR formats only. Should it add further
> > SDR+MPLANE support to the framework as well?
> > 
> > I would appreciate your suggestions on this regard.

-- 
Regards,

Laurent Pinchart

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
