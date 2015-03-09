From: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Subject: Re: [PATCH] v4l: mt9v032: Add OF support
Date: Mon, 09 Mar 2015 13:19:10 +0200
Message-ID: <2182472.9lHHsiQgiX@avalon>
References: <1425822349-19218-1-git-send-email-laurent.pinchart@ideasonboard.com> <CAPW4HR1WJPWg64GwitxCPK2jop0CntS1UtsOu_0VjCz0BEke6A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAPW4HR1WJPWg64GwitxCPK2jop0CntS1UtsOu_0VjCz0BEke6A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Carlos =?ISO-8859-1?Q?Sanmart=EDn?= Bustos <carsanbu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Linux Media <linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Carlos,

Thank you for the review.

On Monday 09 March 2015 10:45:31 Carlos Sanmart=EDn Bustos wrote:
> Hi Laurent,
>=20
> Looks good. One question, why not deprecate the platform data? I can'=
t
> see any device using the mt9v032 pdata, I was making a similar patch
> but deprecating pdata.

The sensor could be used on non-DT platforms. As keeping platform data =
support=20
doesn't really make the code more complex and doesn't prevent cleanups =
or=20
other refactoring, I don't see much harm in keeping it for now.

=46or DT-based platforms, of course, DT should be used.

> Some more comment:
>=20
> 2015-03-08 14:45 GMT+01:00 Laurent Pinchart:
> > Parse DT properties into a platform data structure when a DT node i=
s
> > available.
> >=20
> > Signed-off-by: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
> > ---
> >=20
> >  .../devicetree/bindings/media/i2c/mt9v032.txt      | 41 ++++++++++=
++++
> >  MAINTAINERS                                        |  1 +
> >  drivers/media/i2c/mt9v032.c                        | 66 ++++++++++=
++++++-
> >  3 files changed, 107 insertions(+), 1 deletion(-)
> >  create mode 100644
> >  Documentation/devicetree/bindings/media/i2c/mt9v032.txt

[snip]

> > diff --git a/drivers/media/i2c/mt9v032.c b/drivers/media/i2c/mt9v03=
2.c
> > index 3267c18..a6ea091 100644
> > --- a/drivers/media/i2c/mt9v032.c
> > +++ b/drivers/media/i2c/mt9v032.c

[snip]

> > +static struct mt9v032_platform_data *
> > +mt9v032_get_pdata(struct i2c_client *client)
> > +{
> > +       struct mt9v032_platform_data *pdata;
> > +       struct v4l2_of_endpoint endpoint;
> > +       struct device_node *np;
> > +       struct property *prop;
> > +
> > +       if (!IS_ENABLED(CONFIG_OF) || !client->dev.of_node)
> > +               return client->dev.platform_data;
> > +
> > +       np =3D v4l2_of_get_next_endpoint(client->dev.of_node, NULL)=
;
> > +       if (!np)
> > +               return NULL;
> > +
> > +       if (v4l2_of_parse_endpoint(np, &endpoint) < 0)
> > +               goto done;
>=20
> Here I have one little testing:
>=20
> if (endpoint.bus_type !=3D V4L2_MBUS_PARALLEL) {
>         dev_err(dev, "invalid bus type, must be parallel\n");
>         goto done;
> }

Good question, should drivers check DT properties that they don't use, =
in=20
order to catch errors in DT ? This would slightly increase the kernel s=
ize in=20
order to prevent people from connecting a parallel sensor to a CSI-2 bu=
s,=20
which is obviously impossible in hardware :-)

> > +
> > +       pdata =3D devm_kzalloc(&client->dev, sizeof(*pdata), GFP_KE=
RNEL);
> > +       if (!pdata)
> > +               goto done;
> > +
> > +       prop =3D of_find_property(np, "link-freqs", NULL);
> > +       if (prop) {
> > +               size_t size =3D prop->length / 8;
> > +               u64 *link_freqs;
> > +
> > +               link_freqs =3D devm_kzalloc(&client->dev,
> > +                                         size * sizeof(*link_freqs=
),
> > +                                         GFP_KERNEL);
> > +               if (!link_freqs)
> > +                       goto done;
> > +
> > +               if (of_property_read_u64_array(np, "link-frequencie=
s",
> > +                                              link_freqs, size) < =
0)
> > +                       goto done;
> > +
> > +               pdata->link_freqs =3D link_freqs;
> > +               pdata->link_def_freq =3D link_freqs[0];
> > +       }
> > +
> > +       pdata->clk_pol =3D !!(endpoint.bus.parallel.flags &
> > +                           V4L2_MBUS_PCLK_SAMPLE_RISING);
> > +
> > +done:
> > +       of_node_put(np);
> > +       return pdata;
> > +}

[snip]

> > @@ -1034,9 +1086,21 @@ static const struct i2c_device_id mt9v032_id=
[] =3D {
> >  };
> >  MODULE_DEVICE_TABLE(i2c, mt9v032_id);
> >=20
> > +#if IS_ENABLED(CONFIG_OF)
> > +static const struct of_device_id mt9v032_of_match[] =3D {
> > +       { .compatible =3D "mt9v032" },
> > +       { .compatible =3D "mt9v032m" },
> > +       { .compatible =3D "mt9v034" },
> > +       { .compatible =3D "mt9v034m" },
> > +       { /* Sentinel */ }
> > +};
> > +MODULE_DEVICE_TABLE(of, mt9v032_of_match);
> > +#endif
>=20
> I have this:
> #if IS_ENABLED(CONFIG_OF)
> static const struct of_device_id mt9v032_of_match[] =3D {
>     { .compatible =3D "aptina,mt9v022", },
>     { .compatible =3D "aptina,mt9v022m", },
>     { .compatible =3D "aptina,mt9v024", },
>     { .compatible =3D "aptina,mt9v024m", },
>     { .compatible =3D "aptina,mt9v032", },
>     { .compatible =3D "aptina,mt9v032m", },
>     { .compatible =3D "aptina,mt9v034", },
>     { .compatible =3D "aptina,mt9v034m", },

Looks like I forgot to update my patch for mt9v02* support. Sorry about=
 that,=20
I'll fix it. And the "aptina," prefix of course belongs there.

>     { /* sentinel */ },
> };
>=20
> MODULE_DEVICE_TABLE(of, mt9v032_of_match);
> #endi


--=20
Regards,

Laurent Pinchart

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
