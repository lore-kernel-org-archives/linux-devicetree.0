From: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
Subject: Re: [PATCH RFC v3] media: OF: add video sync endpoint property
Date: Thu, 11 Jul 2013 23:15:26 +0200
Message-ID: <51DF206E.9010301@gmail.com>
References: <1371913383-25088-1-git-send-email-prabhakar.csengg@gmail.com> <51D0548D.7020004@gmail.com> <CA+V-a8uG1KLY-Vjj+0ix2=wV4r=k+tkJ4aDBCN+iN+JZ6my30w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <CA+V-a8uG1KLY-Vjj+0ix2=wV4r=k+tkJ4aDBCN+iN+JZ6my30w@mail.gmail.com>
Sender: linux-doc-owner@vger.kernel.org
To: Prabhakar Lad <prabhakar.csengg@gmail.com>
Cc: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, Mauro Carvalho Chehab <mchehab@redhat.com>, LMML <linux-media@vger.kernel.org>, Hans Verkuil <hans.verkuil@cisco.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, DLOS <davinci-linux-open-source@linux.davincidsp.com>, LKML <linux-kernel@vger.kernel.org>, Guennadi Liakhovetski <g.liakhovetski@gmx.de>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Sakari Ailus <sakari.ailus@iki.fi>, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, Rob Landley <rob@landley.net>, devicetree-discuss@lists.ozlabs.org, linux-doc@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>
List-Id: devicetree@vger.kernel.org

On 07/11/2013 01:41 PM, Prabhakar Lad wrote:
[...]
>>> diff --git a/drivers/media/v4l2-core/v4l2-of.c
>>> b/drivers/media/v4l2-core/v4l2-of.c
>>> index aa59639..1a54530 100644
>>> --- a/drivers/media/v4l2-core/v4l2-of.c
>>> +++ b/drivers/media/v4l2-core/v4l2-of.c
>>> @@ -100,6 +100,26 @@ static void v4l2_of_parse_parallel_bus(const struct
>>> device_node *node,
>>>          if (!of_property_read_u32(node, "data-shift",&v))
>>>                  bus->data_shift = v;
>>>
>>> +       if (!of_property_read_u32(node, "video-sync",&v)) {
>>> +               switch (v) {
>>> +               case V4L2_MBUS_VIDEO_SEPARATE_SYNC:
>>> +                       flags |= V4L2_MBUS_VIDEO_SEPARATE_SYNC;
>>
>>
>> I'm not convinced all those video sync types is something that really
>> belongs
>> to the flags field. In my understanding this field is supposed to hold only
>> the _signal polarity_ information.
>>
>>
> Ok, so there should be a function say v4l2_of_parse_signal_polarity()
> to get the polarity alone then.

I don't think this is required, I would just extend 
v4l2_of_parse_parallel_bus()
function to also handle sync-on-green-active property.

--
Thanks,
Sylwester
