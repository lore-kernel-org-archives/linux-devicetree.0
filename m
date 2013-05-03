From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH RFC v3] media: i2c: mt9p031: add OF support
Date: Fri, 3 May 2013 16:34:38 +0200
Message-ID: <201305031634.39129.arnd@arndb.de>
References: <1367563919-2880-1-git-send-email-prabhakar.csengg@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1367563919-2880-1-git-send-email-prabhakar.csengg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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
Cc: DLOS <davinci-linux-open-source-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>, Mauro Carvalho Chehab <mchehab-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org>, Guennadi Liakhovetski <g.liakhovetski-Mmb7MZpHnFY@public.gmane.org>, LMML <linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Friday 03 May 2013, Prabhakar Lad wrote:
> 
> +static struct mt9p031_platform_data *
> +mt9p031_get_pdata(struct i2c_client *client)
> +{
> +       struct device_node *np;
> +       struct mt9p031_platform_data *pdata;
> +
> +       if (!IS_ENABLED(CONFIG_OF) || !client->dev.of_node)
> +               return client->dev.platform_data;
> +
> +       np = v4l2_of_get_next_endpoint(client->dev.of_node, NULL);
> +       if (!np)
> +               return NULL;
> +
> +       pdata = devm_kzalloc(&client->dev, sizeof(struct mt9p031_platform_data),
> +                            GFP_KERNEL);
> +       if (!pdata)
> +               return NULL;
> +
> +       pdata->reset = of_get_named_gpio(client->dev.of_node, "gpio-reset", 0);
> +       of_property_read_u32(np, "input-clock-frequency", &pdata->ext_freq);
> +       of_property_read_u32(np, "pixel-clock-frequency", &pdata->target_freq);
> +
> +       return pdata;
> +}

Ok, good.

> @@ -955,7 +998,17 @@ static int mt9p031_probe(struct i2c_client *client,
>         mt9p031->pdata = pdata;
>         mt9p031->output_control = MT9P031_OUTPUT_CONTROL_DEF;
>         mt9p031->mode2 = MT9P031_READ_MODE_2_ROW_BLC;
> -       mt9p031->model = did->driver_data;
> +
> +       if (!client->dev.of_node) {
> +               mt9p031->model = (enum mt9p031_model)did->driver_data;
> +       } else {
> +               const struct of_device_id *of_id;
> +
> +               of_id = of_match_device(of_match_ptr(mt9p031_of_match),
> +                                       &client->dev);
> +               if (of_id)
> +                       mt9p031->model = (enum mt9p031_model)of_id->data;
> +       }
>         mt9p031->reset = -1;

Is this actually required? I thought the i2c core just compared the
part of the "compatible" value after the first comma to the string, so
"mt9p031->model = (enum mt9p031_model)did->driver_data" should work
in both cases.

	Arnd
