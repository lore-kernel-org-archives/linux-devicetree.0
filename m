From: "Lad, Prabhakar" <prabhakar.csengg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v4] media: i2c: add support for omnivision's ov2659 sensor
Date: Wed, 11 Mar 2015 19:40:13 +0000
Message-ID: <CA+V-a8tHrUS-=s8sas-yHy6Pnwbh+wu6KxyHDTfARopguqYL2g@mail.gmail.com>
References: <1425814407-22766-1-git-send-email-prabhakar.csengg@gmail.com>
 <20150310013556.GF11954@valkosipuli.retiisi.org.uk> <2415294.49LTQe4m32@avalon>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <2415294.49LTQe4m32@avalon>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Cc: Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org>, Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Mauro Carvalho Chehab <mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, LMML <linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Laurent,

Thanks for the review.

On Wed, Mar 11, 2015 at 6:22 PM, Laurent Pinchart
<laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org> wrote:
> On Tuesday 10 March 2015 03:35:57 Sakari Ailus wrote:
>> On Sun, Mar 08, 2015 at 11:33:27AM +0000, Lad Prabhakar wrote:
>> ...
>>
>> > +static struct ov2659_platform_data *
>> > +ov2659_get_pdata(struct i2c_client *client)
>> > +{
>> > +   struct ov2659_platform_data *pdata;
>> > +   struct device_node *endpoint;
>> > +   int ret;
>> > +
>> > +   if (!IS_ENABLED(CONFIG_OF) || !client->dev.of_node) {
>> > +           dev_err(&client->dev, "ov2659_get_pdata: DT Node found\n");
>> > +           return client->dev.platform_data;
>> > +   }
>> > +
>> > +   endpoint = of_graph_get_next_endpoint(client->dev.of_node, NULL);
>> > +   if (!endpoint)
>> > +           return NULL;
>> > +
>> > +   pdata = devm_kzalloc(&client->dev, sizeof(*pdata), GFP_KERNEL);
>> > +   if (!pdata)
>> > +           goto done;
>> > +
>> > +   ret = of_property_read_u32(endpoint, "link-frequencies",
>> > +                              &pdata->link_frequency);
>>
>> This is actually documented as being a 64-bit array.
>
> The main purpose of link-frequencies is to restrict the link frequencies
> acceptable in the system due to EMI requirements. One link frequency should be
> selected in the array based on the desired format and frame rate. This is
> usually done by exposing the frequency to userspace through a writable
> V4L2_CID_LINK_FREQ control, and exposing the resulting pixel rate as a read-
> only V4L2_CID_PIXEL_RATE control.
>
> V4L2_CID_PIXEL_RATE is mandatory to use the sensor with several drivers
> (including omap3isp and omap4iss), so it should really be implemented.
>
Even if the sensor supports only one frequency the control needs to be
implemented ?

Cheers,
--Prabhakar Lad
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
