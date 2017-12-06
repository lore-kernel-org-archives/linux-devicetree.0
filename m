From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 0/2] of: dynamic: restrict overlay by targets
Date: Wed, 6 Dec 2017 06:58:23 -0500
Message-ID: <bd2e3192-fb06-53c3-15da-59b6a2fba2e4@gmail.com>
References: <20171204191357.3211-1-atull@kernel.org>
 <edb604fa-4810-0de9-ce51-c90aa2442cb4@gmail.com>
 <CANk1AXQ4HV9YAO_p1wrY66nnWY1n2WnR0JoCbAKU6RfrWqf9sQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CANk1AXQ4HV9YAO_p1wrY66nnWY1n2WnR0JoCbAKU6RfrWqf9sQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alan Tull <atull-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Moritz Fischer <mdf-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-fpga-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 12/05/17 12:07, Alan Tull wrote:
> On Mon, Dec 4, 2017 at 7:14 PM, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> Hi Alan,
>>
>> In the RFC thread "of: Add whitelist", I did not understand the use case and
>> asked you some questions (30 Nov 2017 07:46:36 -0500), that you seem to have
>> overlooked (or my mail server failed to deliver your answer to me).  Can you
>> please answer that question so I can better understand this patch set is
>> needed for.
> 
> Hi Frank,
> 
> Sorry I missed those, I've replied to the original questions now.

Thanks!  I have now replied to several comments in that thread, hoping to keep
the conversation in one thread instead of split across two threads.

-Frank

> 
> Alan
> 
>>
>> Thanks,
>>
>> Frank
>>
>>
>> On 12/04/17 14:13, Alan Tull wrote:
>>> Restrict which nodes are valid targets for a DT overlay.
>>>
>>> Add a flag bit to struct device_node allowing nodes to be marked as
>>> valid target for overlays.
>>>
>>> A driver that is always intended to handle DT overlays can
>>> enable overlays by calling a function for its DT node.
>>>
>>> For individual nodes that need to be opened up for a specific use,
>>> adding the property "overlay-allowed" enables overlays targeting
>>> that node.  I'll need to document the DT property, not sure where
>>> specifically.  New file bindings/overlay.txt?
>>>
>>> This patchset differs from the RFC:
>>> * Added a flag bit and got rid of the whitelist
>>> * Renamed the functions that enable a node
>>> * Added a DT property
>>>
>>> Alan Tull (2):
>>>   of: overlay: add flag enabling overlays and enable fpga-region
>>>     overlays
>>>   of: dynamic: add overlay-allowed DT property
>>>
>>>  drivers/fpga/of-fpga-region.c |  4 ++++
>>>  drivers/of/base.c             |  4 ++--
>>>  drivers/of/dynamic.c          |  3 +++
>>>  drivers/of/fdt.c              |  3 +++
>>>  drivers/of/of_private.h       |  2 ++
>>>  drivers/of/overlay.c          | 26 ++++++++++++++++++++++++++
>>>  include/linux/of.h            | 19 +++++++++++++++++++
>>>  7 files changed, 59 insertions(+), 2 deletions(-)
>>>
>>
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
