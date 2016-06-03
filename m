From: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v5 1/2] drm/bridge: Add sii902x driver
Date: Fri, 3 Jun 2016 16:04:30 +0100
Message-ID: <CACvgo52HT-UOZXS5e7srD4PpCTm=H9BZzHJJWUDnu-S5yks=Fw@mail.gmail.com>
References: <1464879601-30569-1-git-send-email-boris.brezillon@free-electrons.com>
 <CACvgo51VRL=Ewbvx-sbwfLoPm00rDUEJ3mvk8Rc0T4WKC=UThA@mail.gmail.com> <20160603120238.76dc9380@bbrezillon>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160603120238.76dc9380@bbrezillon>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Meng Yi <meng.yi-3arQi8VN3Tc@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, ML dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Xiubo Li <lixiubo-0p4V/sDNsUmm0O/7XYngnFaTQe2KTcn/@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Alison Wang <alison.wang-3arQi8VN3Tc@public.gmane.org>, Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, Jianwei Wang <jianwei.wang.chn-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 3 June 2016 at 11:02, Boris Brezillon
<boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> Hi Emil,
>
> On Fri, 3 Jun 2016 10:38:49 +0100
> Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>
>> Hi Boris.
>>
>> On 2 June 2016 at 16:00, Boris Brezillon
>> <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
>>
>> > +static void sii902x_reset(struct sii902x *sii902x)
>> > +{
>> > +       if (!sii902x->reset_gpio)
>> > +               return;
>> > +
>> This is wrong (reset_gpio is err_ptr) although we can/should nuke it
>> all together. See below for reasoning.
>>
>> > +       gpiod_set_value(sii902x->reset_gpio, 1);
>> > +
>> > +       msleep(100);
>> Ouch that is some juicy number. Can we get a comment with
>> reasoning/origin of it ?
>
> As already explained to Maxime, I just don't know why this is needed,
> simply because I don't have access to the datasheet and I just based my
> implementation on another driver.
> I can add a comment stating that this was extracted from another
> implementation, but with no explanation on why this is needed.
>
Considering we don't hear from Meng, that sounds perfectly reasonable imho.

> Meng, do you have any information about startup-time, or something like
> that?
>
>>
>> ...
>>
>> > +static void sii902x_bridge_mode_set(struct drm_bridge *bridge,
>> > +                                   struct drm_display_mode *mode,
>> > +                                   struct drm_display_mode *adj)
>> > +{
>> > +       u8 buf[HDMI_INFOFRAME_HEADER_SIZE + HDMI_AVI_INFOFRAME_SIZE];
>> HDMI_INFOFRAME_SIZE(AVI) seems shorter/easier to head imho.
>
> Yep.
>
>>
>> > +       struct sii902x *sii902x = bridge_to_sii902x(bridge);
>> > +       struct regmap *regmap = sii902x->regmap;
>> > +       struct hdmi_avi_infoframe frame;
>> > +       int ret;
>> > +
>> > +       buf[0] = adj->clock;
>> > +       buf[1] = adj->clock >> 8;
>> > +       buf[2] = adj->vrefresh;
>> > +       buf[3] = 0x00;
>> > +       buf[4] = adj->hdisplay;
>> > +       buf[5] = adj->hdisplay >> 8;
>> > +       buf[6] = adj->vdisplay;
>> > +       buf[7] = adj->vdisplay >> 8;
>> > +       buf[8] = SIL902X_TPI_CLK_RATIO_1X | SIL902X_TPI_AVI_PIXEL_REP_NONE |
>> > +                SIL902X_TPI_AVI_PIXEL_REP_BUS_24BIT;
>> > +       buf[9] = SIL902X_TPI_AVI_INPUT_RANGE_AUTO |
>> > +                SIL902X_TPI_AVI_INPUT_COLORSPACE_RGB;
>> > +
>> Since all of the contents are cleared in hdmi_avi_infoframe_pack, move
>> the above into const video_data[] ?
>
> Something like
>
>         const video_data[] = {
>                 adj->clock,
>                 adj->clock >> 8,
>                 ...
>         };
>
> So we would have 2 buffers on the stack? Is this really useful?
>
IMHO It makes things substantially clearer, but if you/others
disagree, feel free to ignore.

>>
>> > +       ret = regmap_bulk_write(regmap, SIL902X_TPI_VIDEO_DATA, buf, 10);
>> ... and use ARRAY_SIZE(video_data) over the hardcoded 10 ?
>>
>> ...
>>
>> > +static int sii902x_bridge_attach(struct drm_bridge *bridge)
>> > +{
>> > +       struct sii902x *sii902x = bridge_to_sii902x(bridge);
>> > +       struct drm_device *drm = bridge->dev;
>> > +       int ret;
>> > +
>> > +       drm_connector_helper_add(&sii902x->connector,
>> > +                                &sii902x_connector_helper_funcs);
>> > +
>> > +       if (!drm_core_check_feature(drm, DRIVER_ATOMIC)) {
>> > +               dev_err(&sii902x->i2c->dev,
>> > +                       "sii902x driver is only compatible with DRM devices supporting atomic updates");
>> > +               return -ENOTSUPP;
>> > +       }
>> > +
>> > +       ret = drm_connector_init(drm, &sii902x->connector,
>> > +                                &sii902x_connector_funcs,
>> > +                                DRM_MODE_CONNECTOR_HDMIA);
>> Side note: seems like most places in DRM do not check the return value
>> (~80 vs ~20). I wonder how badly/likely are things to explode.
>
> Yep. I tend to always check return code, but if you say it's useless
> (and error-prone) I can remove it.
>
Not sure which one is the correct thing to do. My gut goes "keep it as
is for the moment". I only pointed it out since DRM subsystem was
quite inconsistent about it.

>>
>> ...
>>
>> > +static int sii902x_probe(struct i2c_client *client,
>> > +                        const struct i2c_device_id *id)
>> > +{
>> ...
>>
>> > +
>> > +       sii902x->reset_gpio = devm_gpiod_get_optional(dev, "reset",
>> > +                                                     GPIOD_OUT_LOW);
>> > +       if (IS_ERR(sii902x->reset_gpio))
>> > +               dev_warn(dev, "Failed to retrieve/request reset gpio: %ld\n",
>> > +                        PTR_ERR(sii902x->reset_gpio));
>> > +
>> Documentation says "Required" not optional. The above should be
>> updated and one should error out if missing, right ?
>
> Actually I was asked to make it optional, just forgot to update the
> documentation. This being said, devm_gpiod_get_optional() returns NULL
> if the property is not defined in the DT and an error code if the error
> comes from the GPIO layer, so I should just switch back to dev_err()
> and return the error code here.
>
> This would make the test in sii902x_reset() valid again.
>
Nice :-)

>>
>> ...
>>
>> > +
>> > +       if (client->irq > 0) {
>> I was always confused which is the correct way to check this >= 0 vs >
>> 0. DRM has both :-\
>> Do you have any suggestions, should be 'mass convert' DRM to use only
>> one of the two ?
>
> Not sure 0 is a valid irq number anymore, so I don't think it's really
> important, but I can change it if you want.
>
Thanks. In that case I'd leave it as-is.

At some point we'll get a brave soul that goes through DRM. But that
would be some other day.

Thanks
Emil
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
