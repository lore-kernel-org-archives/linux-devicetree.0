From: "Lad, Prabhakar" <prabhakar.csengg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v5] media: i2c: add support for omnivision's ov2659 sensor
Date: Fri, 13 Mar 2015 05:47:36 +0000
Message-ID: <CA+V-a8uygY1XH-V+xSvXyfboFNK_tK=XziqRi6xLfh62WKLRuA@mail.gmail.com>
References: <1426202556-29156-1-git-send-email-prabhakar.csengg@gmail.com> <20150313000415.GR11954@valkosipuli.retiisi.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150313000415.GR11954-S+BSfZ9RZZmRSg0ZkenSGLdO1Tsj/99ntUK59QYPAWc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org>
Cc: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Mauro Carvalho Chehab <mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, LMML <linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Sakari,

Thanks for the review.

On Fri, Mar 13, 2015 at 12:04 AM, Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org> wrote:
> Hi Prabhakar,
>
> On Thu, Mar 12, 2015 at 11:22:36PM +0000, Lad Prabhakar wrote:
> ...
>> +static int ov2659_probe(struct i2c_client *client,
>> +                     const struct i2c_device_id *id)
>> +{
>> +     const struct ov2659_platform_data *pdata = ov2659_get_pdata(client);
>> +     struct v4l2_subdev *sd;
>> +     struct ov2659 *ov2659;
>> +     struct clk *clk;
>> +     int ret;
>> +
>> +     if (!pdata) {
>> +             dev_err(&client->dev, "platform data not specified\n");
>> +             return -EINVAL;
>> +     }
>> +
>> +     ov2659 = devm_kzalloc(&client->dev, sizeof(*ov2659), GFP_KERNEL);
>> +     if (!ov2659)
>> +             return -ENOMEM;
>> +
>> +     ov2659->pdata = pdata;
>> +     ov2659->client = client;
>> +
>> +     clk = devm_clk_get(&client->dev, "xvclk");
>> +     if (IS_ERR(clk))
>> +             return PTR_ERR(clk);
>> +
>> +     ov2659->xvclk_frequency = clk_get_rate(clk);
>> +     if (ov2659->xvclk_frequency < 6000000 ||
>> +         ov2659->xvclk_frequency > 27000000)
>> +             return -EINVAL;
>> +
>> +     v4l2_ctrl_handler_init(&ov2659->ctrls, 2);
>> +     v4l2_ctrl_new_std(&ov2659->ctrls, &ov2659_ctrl_ops,
>> +                       V4L2_CID_PIXEL_RATE, ov2659->xvclk_frequency,
>> +                       ov2659->xvclk_frequency, 1, ov2659->xvclk_frequency);
>
> ov2659->xvclk_frequency is the frequency of the external clock, not the
> pixel rate. If I understand correctly, you should use the value of the
> link-frequency property instead (as long as it's one pixel per clock).
>
this is what happens when you work late night :)

> With this fixed,
>
will post a v6 today.

Cheers,
--Prabhakar Lad

> Acked-by: Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
>
>> +     v4l2_ctrl_new_std_menu_items(&ov2659->ctrls, &ov2659_ctrl_ops,
>> +                                  V4L2_CID_TEST_PATTERN,
>> +                                  ARRAY_SIZE(ov2659_test_pattern_menu) - 1,
>> +                                  0, 0, ov2659_test_pattern_menu);
>> +     ov2659->sd.ctrl_handler = &ov2659->ctrls;
>> +
>> +     if (ov2659->ctrls.error) {
>> +             dev_err(&client->dev, "%s: control initialization error %d\n",
>> +                     __func__, ov2659->ctrls.error);
>> +             return  ov2659->ctrls.error;
>> +     }
>> +
>> +     sd = &ov2659->sd;
>> +     client->flags |= I2C_CLIENT_SCCB;
>> +     v4l2_i2c_subdev_init(sd, client, &ov2659_subdev_ops);
>> +
>> +     sd->internal_ops = &ov2659_subdev_internal_ops;
>> +     sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE |
>> +                  V4L2_SUBDEV_FL_HAS_EVENTS;
>> +
>> +#if defined(CONFIG_MEDIA_CONTROLLER)
>> +     ov2659->pad.flags = MEDIA_PAD_FL_SOURCE;
>> +     sd->entity.type = MEDIA_ENT_T_V4L2_SUBDEV_SENSOR;
>> +     ret = media_entity_init(&sd->entity, 1, &ov2659->pad, 0);
>> +     if (ret < 0) {
>> +             v4l2_ctrl_handler_free(&ov2659->ctrls);
>> +             return ret;
>> +     }
>> +#endif
>> +
>> +     mutex_init(&ov2659->lock);
>> +
>> +     ov2659_get_default_format(&ov2659->format);
>> +     ov2659->frame_size = &ov2659_framesizes[2];
>> +     ov2659->format_ctrl_regs = ov2659_formats[0].format_ctrl_regs;
>> +
>> +     ret = ov2659_detect(sd);
>> +     if (ret < 0)
>> +             goto error;
>> +
>> +     /* Calculate the PLL register value needed */
>> +     ov2659_pll_calc_params(ov2659);
>> +
>> +     ret = v4l2_async_register_subdev(&ov2659->sd);
>> +     if (ret)
>> +             goto error;
>> +
>> +     dev_info(&client->dev, "%s sensor driver registered !!\n", sd->name);
>> +
>> +     return 0;
>> +
>> +error:
>> +     v4l2_ctrl_handler_free(&ov2659->ctrls);
>> +#if defined(CONFIG_MEDIA_CONTROLLER)
>> +     media_entity_cleanup(&sd->entity);
>> +#endif
>> +     mutex_destroy(&ov2659->lock);
>> +     return ret;
>> +}
>
> --
> Kind regards,
>
> Sakari Ailus
> e-mail: sakari.ailus-X3B1VOXEql0@public.gmane.org     XMPP: sailus-PCDdDYkjdNMDXYZnReoRVg@public.gmane.org
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
