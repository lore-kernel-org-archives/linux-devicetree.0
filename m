From: Prabhakar Lad <prabhakar.csengg@gmail.com>
Subject: Re: [PATCH v3] media: i2c: tvp514x: add OF support
Date: Thu, 16 May 2013 18:13:38 +0530
Message-ID: <CA+V-a8ti58gdPR-fUEqgBvUQ=1GkoTUyLj9UK4D5aVwHv2R6mA@mail.gmail.com>
References: <1368529236-18199-1-git-send-email-prabhakar.csengg@gmail.com> <11504129.E8jKKy4N2e@avalon>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <11504129.E8jKKy4N2e@avalon>
Sender: linux-doc-owner@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: LMML <linux-media@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, DLOS <davinci-linux-open-source@linux.davincidsp.com>, Hans Verkuil <hans.verkuil@cisco.com>, Mauro Carvalho Chehab <mchehab@redhat.com>, Guennadi Liakhovetski <g.liakhovetski@gmx.de>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Sakari Ailus <sakari.ailus@iki.fi>, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, Rob Landley <rob@landley.net>, devicetree-discuss@lists.ozlabs.org, linux-doc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Laurent,

Thanks for the review.

On Thu, May 16, 2013 at 5:40 PM, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> Hi Prabhakar,
>
[Snip]
>> +
>> +     pdata = devm_kzalloc(&client->dev, sizeof(*pdata), GFP_KERNEL);
>> +     if (!pdata)
>
> I've started playing with the V4L2 OF bindings, and realized that should
> should call of_node_put() here.
>
you were referring  of_node_get() here rite ?

of_node_get/put() got recently added I guess coz of which I missed it :)

>> +             return NULL;
>> +
>> +     v4l2_of_parse_endpoint(endpoint, &bus_cfg);
>> +     flags = bus_cfg.bus.parallel.flags;
>> +
>> +     if (flags & V4L2_MBUS_HSYNC_ACTIVE_HIGH)
>> +             pdata->hs_polarity = 1;
>> +
>> +     if (flags & V4L2_MBUS_VSYNC_ACTIVE_HIGH)
>> +             pdata->vs_polarity = 1;
>> +
>> +     if (flags & V4L2_MBUS_PCLK_SAMPLE_RISING)
>> +             pdata->clk_polarity = 1;
>> +
>
> As well as here. Maybe a
>
> done:
>         of_node_put(endpoint);
>         return pdata;
>
> with a goto done in the devm_kzalloc error path would be better.
>
OK

Regards,
--Prabhakar Lad
