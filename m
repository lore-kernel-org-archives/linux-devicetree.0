From: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v5 1/2] drm/bridge: Add sii902x driver
Date: Fri, 3 Jun 2016 08:56:11 +0200
Message-ID: <20160603085611.60208fbf@bbrezillon>
References: <1464879601-30569-1-git-send-email-boris.brezillon@free-electrons.com>
	<CAFqH_51mfuTsRKOYtiyTkQT0pbRnWJdHdeXdHGFKaGzPXujEZw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAFqH_51mfuTsRKOYtiyTkQT0pbRnWJdHdeXdHGFKaGzPXujEZw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Enric Balletbo Serra <eballetbo-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Meng Yi <meng.yi-3arQi8VN3Tc@public.gmane.org>, Xiubo Li <lixiubo-0p4V/sDNsUmm0O/7XYngnFaTQe2KTcn/@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Alison Wang <alison.wang-3arQi8VN3Tc@public.gmane.org>, Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, Jianwei Wang <jianwei.wang.chn-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Enric,

On Thu, 2 Jun 2016 23:47:23 +0200
Enric Balletbo Serra <eballetbo-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:



> > +static int sii902x_get_modes(struct drm_connector *connector)
> > +{
> > +       struct sii902x *sii902x = connector_to_sii902x(connector);
> > +       struct regmap *regmap = sii902x->regmap;
> > +       u32 bus_format = MEDIA_BUS_FMT_RGB888_1X24;
> > +       unsigned int status;
> > +       struct edid *edid;
> > +       int num = 0;
> > +       int ret;
> > +       int i;  
> 
> Is the i variable really needed? (see my comments below)
> 
> > +
> > +       ret = regmap_update_bits(regmap, SIL902X_SYS_CTRL_DATA,
> > +                                SIL902X_SYS_CTRL_DDC_BUS_REQ,
> > +                                SIL902X_SYS_CTRL_DDC_BUS_REQ);
> > +       if (ret)
> > +               return ret;
> > +
> > +       i = 0;  
> 
> You assign i to 0
> 
> > +       do {
> > +               ret = regmap_read(regmap, SIL902X_SYS_CTRL_DATA, &status);
> > +               if (ret)
> > +                       return ret;
> > +               i++;  
> 
> And you increment i, for what?

Oops, this is a leftover from when I was debugging the implementation.

> 
> > +       } while (!(status & SIL902X_SYS_CTRL_DDC_BUS_GRTD));
> > +
> > +       ret = regmap_write(regmap, SIL902X_SYS_CTRL_DATA, status);
> > +       if (ret)
> > +               return ret;
> > +
> > +       edid = drm_get_edid(connector, sii902x->i2c->adapter);
> > +       drm_mode_connector_update_edid_property(connector, edid);
> > +       if (edid) {
> > +               num += drm_add_edid_modes(connector, edid);  
> 
> This is always 0 + the returned value, so you can do:
>   num = drm_add_edid_modes(connector, edid);
> It's more clear for me.

Sure.

> 
> > +               kfree(edid);
> > +       }
> > +
> > +       ret = drm_display_info_set_bus_formats(&connector->display_info,
> > +                                              &bus_format, 1);
> > +       if (ret)
> > +               return ret;
> > +
> > +       regmap_read(regmap, SIL902X_SYS_CTRL_DATA, &status);
> > +       if (ret)
> > +               return ret;
> > +
> > +       ret = regmap_update_bits(regmap, SIL902X_SYS_CTRL_DATA,
> > +                                SIL902X_SYS_CTRL_DDC_BUS_REQ |
> > +                                SIL902X_SYS_CTRL_DDC_BUS_GRTD, 0);
> > +       if (ret)
> > +               return ret;
> > +
> > +       i = 0;  
> 
> Again, you can remove the i variable, here and the i++ from the loop below
> 
> > +       do {
> > +               ret = regmap_read(regmap, SIL902X_SYS_CTRL_DATA, &status);
> > +               if (ret)
> > +                       return ret;
> > +               i++;
> > +       } while (status & (SIL902X_SYS_CTRL_DDC_BUS_REQ |
> > +                          SIL902X_SYS_CTRL_DDC_BUS_GRTD));
> > +
> > +       return num;
> > +}

[...]

> > +static void sii902x_bridge_nop(struct drm_bridge *bridge)
> > +{
> > +}
> > +  
> 
> You can remove this dummy callback function now.
> 
> > +static const struct drm_bridge_funcs sii902x_bridge_funcs = {
> > +       .attach = sii902x_bridge_attach,
> > +       .mode_set = sii902x_bridge_mode_set,
> > +       .disable = sii902x_bridge_disable,
> > +       .post_disable = sii902x_bridge_nop,
> > +       .pre_enable = sii902x_bridge_nop,  
> 
> Remove .pre_enable

I guess ->{pre,post}_enable() were mandatory when I started the
development of this driver. I'll drop both.

> 
> > +       .enable = sii902x_bridge_enable,
> > +};
> > +

[...]

> > +
> > +#ifdef CONFIG_OF  
> 
> You already depend on OF in Kconfig so this will always be evaluated.

Indeed.

> 
> > +static const struct of_device_id sii902x_dt_ids[] = {
> > +       { .compatible = "sil,sii9022", },
> > +       { }
> > +};
> > +MODULE_DEVICE_TABLE(of, sii902x_dt_ids);
> > +#endif
> > +
> > +static const struct i2c_device_id sii902x_i2c_ids[] = {
> > +       { "sii9022", 0 },
> > +       { },
> > +};
> > +MODULE_DEVICE_TABLE(i2c, sii902x_i2c_ids);
> > +
> > +static struct i2c_driver sii902x_driver = {
> > +       .probe = sii902x_probe,
> > +       .remove = sii902x_remove,
> > +       .driver = {
> > +               .name = "sii902x",
> > +               .of_match_table = of_match_ptr(sii902x_dt_ids),  
> 
> You already depend on OF in Kconfig so you don't need of_match_ptr()
> here, of_match_ptr(x) will always evaluate to x.

I'll directly pass sii902x_dt_ids.

Thanks for your review.

Regards,

Boris

-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
