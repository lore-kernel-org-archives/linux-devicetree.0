From: Sylwester Nawrocki <sylvester.nawrocki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH RFC v2] media: OF: add sync-on-green endpoint property
Date: Sat, 25 May 2013 16:11:52 +0200
Message-ID: <51A0C6A8.5090302@gmail.com>
References: <1368710287-8741-1-git-send-email-prabhakar.csengg@gmail.com>
 <519F4AE7.8000003@gmail.com>
 <CA+V-a8tMQnjh=8qaRoNhwkdrcoTCK2zofTkCOd79hAMoz5qK2A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <CA+V-a8tMQnjh=8qaRoNhwkdrcoTCK2zofTkCOd79hAMoz5qK2A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Prabhakar Lad <prabhakar.csengg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: DLOS <davinci-linux-open-source-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>, Mauro Carvalho Chehab <mchehab-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org>, Guennadi Liakhovetski <g.liakhovetski-Mmb7MZpHnFY@public.gmane.org>, LMML <linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On 05/25/2013 11:17 AM, Prabhakar Lad wrote:
>>  From looking at Figure 8 "TVP7002 Application Example" in the TVP7002's
>> >  datasheet
>> >  ([2], p. 52) and your initial TVP7002 patches it looks like what you want is
>> >  to
>> >  specify polarity of the SOGOUT signal, so the processor that receives this
>> >  signal
>> >  can properly interpret it, is it correct ?
>> >
> Yes
>> >  If so then wouldn't it be more appropriate to define e.g. 'sog-active'
>> >  property
>> >  and media bus flags:
>> >           V4L2_MBUS_SYNC_ON_GREEN_ACTIVE_LOW
>> >           V4L2_MBUS_SYNC_ON_GREEN_ACTIVE_HIGH
>> >  ?
>> >
> Agreed I'll add these flags.
>
>> >  And for synchronisation method on the analog part we could perhaps define
>> >  'component-sync' or similar property that would enumerate all possible
>> >  synchronisation methods. We might as well use separate boolean properties,
>> >  but I'm a bit concerned about the increasing number of properties that need
>> >  to be parsed for each parallel video bus "endpoint".
>> >
> I am not clear on it can please elaborate more on this.

I thought about two possible options:

1. single property 'component-sync' or 'video-sync' that would have values:

#define VIDEO_SEPARATE_SYNC	0x01
#define VIDEO_COMPOSITE_SYNC	0x02
#define VIDEO_SYNC_ON_COMPOSITE	0x04
#define VIDEO_SYNC_ON_GREEN	0x08
#define VIDEO_SYNC_ON_LUMINANCE	0x10

And we could put these definitions into a separate header, e.g.
<dt-bindings/video-interfaces.h>

Then in a device tree source file one could have, e.g.

video-sync = <VIDEO_SYNC_ON_GREEN>;


2. Separate boolean property for each video sync type, e.g.

	"video-composite-sync"
	"video-sync-on-composite"
	"video-sync-on-green"
	"video-sync-on-luminance"

Separate sync, with separate VSYNC, HSYNC lines, would be the default, when
none of the above is specified and 'vsync-active', 'hsync-active' properties
are present.

However, I suppose the better would be to deduce the video synchronisation
method from the sync signal polarity flags. Then, for instance, when an
endpoint node contains "composite-sync-active" property the parser would
determine the "composite sync" synchronisation type is used.

Thus it might make sense to have only following integer properties (added
as needed):

composite-sync-active
sync-on-green-active
sync-on-comp-active
sync-on-luma-active

This would allow to specify polarity of each signal and at the same time
the parsing code could derive synchronisation type. A new field could be
added to struct v4l2_of_parallel_bus, e.g. sync_type and it would be filled
within v4l2_of_parse_endpoint().

What do you think ?


Thanks,
Sylwester
