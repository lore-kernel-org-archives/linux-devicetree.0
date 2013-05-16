From: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
Subject: Re: [PATCH RFC] media: OF: add field-active and sync-on-green endpoint
 properties
Date: Thu, 16 May 2013 12:43:02 +0200
Message-ID: <5194B836.1020808@gmail.com>
References: <1368622349-32185-1-git-send-email-prabhakar.csengg@gmail.com> <2510029.UKsn4JyZOW@avalon> <CA+V-a8tsohAyGRCn3NhwsS19X84N_xOwLB_wd0bPvyu1fLy3+g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <CA+V-a8tsohAyGRCn3NhwsS19X84N_xOwLB_wd0bPvyu1fLy3+g@mail.gmail.com>
Sender: linux-doc-owner@vger.kernel.org
To: Prabhakar Lad <prabhakar.csengg@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, LMML <linux-media@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, DLOS <davinci-linux-open-source@linux.davincidsp.com>, Hans Verkuil <hans.verkuil@cisco.com>, Mauro Carvalho Chehab <mchehab@redhat.com>, Guennadi Liakhovetski <g.liakhovetski@gmx.de>, Sakari Ailus <sakari.ailus@iki.fi>, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, Rob Landley <rob@landley.net>, devicetree-discuss@lists.ozlabs.org, linux-doc@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>
List-Id: devicetree@vger.kernel.org

Hi,

On 05/16/2013 06:53 AM, Prabhakar Lad wrote:
>>> diff --git a/Documentation/devicetree/bindings/media/video-interfaces.txt
>>> >>  b/Documentation/devicetree/bindings/media/video-interfaces.txt index
>>> >>  e022d2d..6bf87d0 100644
>>> >>  --- a/Documentation/devicetree/bindings/media/video-interfaces.txt
>>> >>  +++ b/Documentation/devicetree/bindings/media/video-interfaces.txt
>>> >>  @@ -101,6 +101,10 @@ Optional endpoint properties
>>> >>      array contains only one entry.
>>> >>    - clock-noncontinuous: a boolean property to allow MIPI CSI-2
>>> >>  non-continuous clock mode.
>>> >>  +-field-active: a boolean property indicating active high filed ID output
>>> >>  + polarity is inverted.
>> >
>> >  Looks like we already have field-even-active property to describe the level of
>> >  the field signal. Could you please check whether it fulfills your use cases ?
>> >  Sorry for not pointing you to it earlier.
>> >
> I had looked at it earlier it only means "field signal level during the even
> field data transmission" it only speaks of even filed. Ideally the field ID
> output is set to logic 1 for odd field and set to 0 for even field, what I
> want is to invert the FID out polarity when "field-active" property is set.
>
> May be we rename "field-active" to "fid-pol" ?

I guess we failed to clearly describe the 'field-even-active' property then.
It seems to be exactly what you need.

It is not enough to say e.g. field-active = <1>;, because it would not have
been clear which field it refers to, odd or even ? Unlike VSYNC, HSYNC both
levels of the FIELD signal are "active", there is no "idle" state for FIELD.

So field-even-active = <1>; means the FIELD signal at logic high level
indicates EVEN field _and_ this implies FIELD = 0 indicates ODD field, i.e.

FIELD = 0 => odd field
FIELD = 1 => even field

For field-even-active = <0>; it is the other way around:

FIELD = 0 => even field
FIELD = 1 => odd field

It looks like only "sync-on-green" property is missing. BTW, is it really
commonly used ? What drivers would need it ?
I'm not against making it a common property, it's just first time I see it.

Thanks,
Sylwester
