Return-Path: <SRS0=nhcd=ZQ=linaro.org=baoyou.xie@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20170202160014.GA2419@localhost.localdomain>
References: <1486048086-3431-1-git-send-email-baoyou.xie@linaro.org>
 <1486048086-3431-3-git-send-email-baoyou.xie@linaro.org> <20170202160014.GA2419@localhost.localdomain>
From: Baoyou Xie <baoyou.xie@linaro.org>
Date: Fri, 3 Feb 2017 15:15:41 +0800
Message-ID: <CA+DQWkxskpWCr6TofquHKR=AeJDxbziJ+rSihN3H+aSLf7KH4g@mail.gmail.com>
Subject: Re: [PATCH v6 3/3] thermal: zx2967: add thermal driver for ZTE's
 zx2967 family
Content-Type: multipart/alternative; boundary=001a1148cd22b54fbe05479b0c14
To: Eduardo Valentin <edubezval@gmail.com>
Cc: Jun Nie <jun.nie@linaro.org>, rui.zhang@intel.com, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>, linux-pm@vger.kernel.org, devicetree <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Shawn Guo <shawnguo@kernel.org>, "xie.baoyou" <xie.baoyou@zte.com.cn>, chen.chaokai@zte.com.cn, wang.qiang01@zte.com.cn
List-ID: <devicetree@vger.kernel.org>

--001a1148cd22b54fbe05479b0c14
Content-Type: text/plain; charset=UTF-8

On 3 February 2017 at 00:00, Eduardo Valentin <edubezval@gmail.com> wrote:

> Helllo Baoyou,
>
> Sorry I was not clear enough in my previous comment.
>
> Please find the explanation below:
>
>
> On Thu, Feb 02, 2017 at 11:08:06PM +0800, Baoyou Xie wrote:
> > This patch adds thermal driver for ZTE's zx2967 family.
> >
>
> <cut>
>
> > +
> > +static int zx2967_thermal_probe(struct platform_device *pdev)
> > +{
> > +     struct zx2967_thermal_priv *priv;
> > +     struct resource *res;
> > +     u32 buf[2];
> > +     int ret, i;
> > +
> > +     priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
> > +     if (!priv)
> > +             return -ENOMEM;
> > +
> > +     res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > +     priv->regs = devm_ioremap_resource(&pdev->dev, res);
> > +     if (IS_ERR(priv->regs))
> > +             return PTR_ERR(priv->regs);
> > +
> > +     ret = of_property_read_u32_array(pdev->dev.of_node,
> > +                                      "coefficients", buf, 2);
>
> What I meant in my previous comment is that of-thermal already does the
> above parsing for you. Therefore, the above line is not needed. And...
>
> > +     if (ret) {
> > +             dev_err(&pdev->dev, "failed to read coefficients\n");
> > +             return ret;
> > +     }
> > +     priv->slope = (s32)buf[0];
> > +     priv->offset = (s32)buf[1];
> > +
>
> You should also not need to have priv data for storing the slope and
> offset.
>
> > +     priv->clk_gate = devm_clk_get(&pdev->dev, "gate");
> > +     if (IS_ERR(priv->clk_gate)) {
> > +             ret = PTR_ERR(priv->clk_gate);
> > +             dev_err(&pdev->dev, "failed to get clock gate: %d\n", ret);
> > +             return ret;
> > +     }
> > +
> > +     ret = clk_prepare_enable(priv->clk_gate);
> > +     if (ret) {
> > +             dev_err(&pdev->dev, "failed to enable converter clock:
> %d\n",
> > +                     ret);
> > +             return ret;
> > +     }
> > +
> > +     priv->pclk = devm_clk_get(&pdev->dev, "pclk");
> > +     if (IS_ERR(priv->pclk)) {
> > +             ret = PTR_ERR(priv->pclk);
> > +             clk_disable_unprepare(priv->clk_gate);
> > +             dev_err(&pdev->dev, "failed to get apb clock: %d\n", ret);
> > +             return ret;
> > +     }
> > +
> > +     ret = clk_prepare_enable(priv->pclk);
> > +     if (ret) {
> > +             clk_disable_unprepare(priv->clk_gate);
> > +             dev_err(&pdev->dev, "failed to enable converter clock:
> %d\n",
> > +                     ret);
> > +             return ret;
> > +     }
> > +
> > +     mutex_init(&priv->lock);
> > +     for (i = 0; i < NUM_SENSORS; i++) {
> > +             struct zx2967_thermal_sensor *sensor = &priv->sensors[i];
> > +
> > +             sensor->priv = priv;
> > +             sensor->id = i;
> > +             sensor->tzd = thermal_zone_of_sensor_register(&pdev->dev,
> > +                                     i, sensor, &zx2967_of_thermal_ops);
>
> After calling the above function, if it succeeds, and you have the
> coefficients property in your DTS, then
>
> > +             if (IS_ERR(sensor->tzd)) {
> > +                     ret = PTR_ERR(sensor->tzd);
> > +                     dev_err(&pdev->dev, "failed to register sensor %d:
> %d\n",
> > +                             i, ret);
> > +                     goto remove_ts;
> > +             }
>
> Right here, you should be able to access sensor->tzd->tzp->slope and
> sensor->tzd->tzp->offset, if you added the entry:
>                 coefficients = <SLOPE OFFSET>;
>
>                 in you thermal zone in DT.
>
> I hope this clarifies.
>
> Thanks for your patience:)


> Let me know if you are able to use the parsing from of-thermal, instead
> of in your driver.
>
> I'm happy to pronounce that all have worked out. Please wait for my next
patch.


> > +     }
> > +     priv->dev = &pdev->dev;
> > +     platform_set_drvdata(pdev, priv);
> > +
> > +     return 0;
> > +
> > +remove_ts:
> > +     clk_disable_unprepare(priv->clk_gate);
> > +     clk_disable_unprepare(priv->pclk);
> > +     for (i--; i >= 0; i--)
> > +             thermal_zone_of_sensor_unregister(&pdev->dev,
> > +                                               priv->sensors[i].tzd);
> > +
> > +     return ret;
> > +}
> > +
> > +static int zx2967_thermal_exit(struct platform_device *pdev)
> > +{
> > +     struct zx2967_thermal_priv *priv = platform_get_drvdata(pdev);
> > +     int i;
> > +
> > +     for (i = 0; i < NUM_SENSORS; i++) {
> > +             struct zx2967_thermal_sensor *sensor = &priv->sensors[i];
> > +
> > +             thermal_zone_of_sensor_unregister(&pdev->dev,
> sensor->tzd);
> > +     }
> > +     clk_disable_unprepare(priv->pclk);
> > +     clk_disable_unprepare(priv->clk_gate);
> > +
> > +     return 0;
> > +}
> > +
> > +static const struct of_device_id zx2967_thermal_id_table[] = {
> > +     { .compatible = "zte,zx296718-thermal" },
> > +     {}
> > +};
> > +MODULE_DEVICE_TABLE(of, zx2967_thermal_id_table);
> > +
> > +static SIMPLE_DEV_PM_OPS(zx2967_thermal_pm_ops,
> > +                      zx2967_thermal_suspend, zx2967_thermal_resume);
> > +
> > +static struct platform_driver zx2967_thermal_driver = {
> > +     .probe = zx2967_thermal_probe,
> > +     .remove = zx2967_thermal_exit,
> > +     .driver = {
> > +             .name = "zx2967_thermal",
> > +             .of_match_table = zx2967_thermal_id_table,
> > +             .pm = &zx2967_thermal_pm_ops,
> > +     },
> > +};
> > +module_platform_driver(zx2967_thermal_driver);
> > +
> > +MODULE_AUTHOR("Baoyou Xie <baoyou.xie@linaro.org>");
> > +MODULE_DESCRIPTION("ZTE zx2967 thermal driver");
> > +MODULE_LICENSE("GPL v2");
> > --
> > 2.7.4
> >
>

--001a1148cd22b54fbe05479b0c14
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On 3 February 2017 at 00:00, Eduardo Valentin <span dir=3D"ltr">&lt;<a =
href=3D"mailto:edubezval@gmail.com" target=3D"_blank">edubezval@gmail.com</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Helllo Baoyou,<br>
<br>
Sorry I was not clear enough in my previous comment.<br>
<br>
Please find the explanation below:<br>
<span class=3D""><br>
<br>
On Thu, Feb 02, 2017 at 11:08:06PM +0800, Baoyou Xie wrote:<br>
&gt; This patch adds thermal driver for ZTE&#39;s zx2967 family.<br>
&gt;<br>
<br>
</span>&lt;cut&gt;<br>
<span class=3D""><br>
&gt; +<br>
&gt; +static int zx2967_thermal_probe(struct platform_device *pdev)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct zx2967_thermal_priv *priv;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct resource *res;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u32 buf[2];<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int ret, i;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0priv =3D devm_kzalloc(&amp;pdev-&gt;dev, sizeof(*=
priv), GFP_KERNEL);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (!priv)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOMEM;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0res =3D platform_get_resource(pdev, IORESOURCE_ME=
M, 0);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0priv-&gt;regs =3D devm_ioremap_resource(&amp;pdev=
-&gt;<wbr>dev, res);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (IS_ERR(priv-&gt;regs))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return PTR_ERR(priv-&=
gt;regs);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ret =3D of_property_read_u32_array(<wbr>pdev-&gt;=
dev.of_node,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;coeff=
icients&quot;, buf, 2);<br>
<br>
</span>What I meant in my previous comment is that of-thermal already does =
the<br>
above parsing for you. Therefore, the above line is not needed. And...<br>
<span class=3D""><br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (ret) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(&amp;pdev-&gt=
;dev, &quot;failed to read coefficients\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0priv-&gt;slope =3D (s32)buf[0];<br>
&gt; +=C2=A0 =C2=A0 =C2=A0priv-&gt;offset =3D (s32)buf[1];<br>
&gt; +<br>
<br>
</span>You should also not need to have priv data for storing the slope and=
<br>
offset.<br>
<div><div class=3D"h5"><br>
&gt; +=C2=A0 =C2=A0 =C2=A0priv-&gt;clk_gate =3D devm_clk_get(&amp;pdev-&gt;=
dev, &quot;gate&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (IS_ERR(priv-&gt;clk_gate)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D PTR_ERR(priv-=
&gt;clk_gate);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(&amp;pdev-&gt=
;dev, &quot;failed to get clock gate: %d\n&quot;, ret);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ret =3D clk_prepare_enable(priv-&gt;clk_<wbr>gate=
);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (ret) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(&amp;pdev-&gt=
;dev, &quot;failed to enable converter clock: %d\n&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0ret);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0priv-&gt;pclk =3D devm_clk_get(&amp;pdev-&gt;dev,=
 &quot;pclk&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (IS_ERR(priv-&gt;pclk)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D PTR_ERR(priv-=
&gt;pclk);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0clk_disable_unprepare=
(priv-&gt;<wbr>clk_gate);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(&amp;pdev-&gt=
;dev, &quot;failed to get apb clock: %d\n&quot;, ret);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ret =3D clk_prepare_enable(priv-&gt;pclk)<wbr>;<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0if (ret) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0clk_disable_unprepare=
(priv-&gt;<wbr>clk_gate);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(&amp;pdev-&gt=
;dev, &quot;failed to enable converter clock: %d\n&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0ret);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0mutex_init(&amp;priv-&gt;lock);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; NUM_SENSORS; i++) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct zx2967_thermal=
_sensor *sensor =3D &amp;priv-&gt;sensors[i];<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sensor-&gt;priv =3D p=
riv;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sensor-&gt;id =3D i;<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sensor-&gt;tzd =3D th=
ermal_zone_of_sensor_<wbr>register(&amp;pdev-&gt;dev,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0i, sensor, &=
amp;zx2967_of_thermal_ops);<br>
<br>
</div></div>After calling the above function, if it succeeds, and you have =
the<br>
coefficients property in your DTS, then<br>
<span class=3D""><br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (IS_ERR(sensor-&gt=
;tzd)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0ret =3D PTR_ERR(sensor-&gt;tzd);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0dev_err(&amp;pdev-&gt;dev, &quot;failed to register sensor %d: %d\n&=
quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0i, ret);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0goto remove_ts;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
<br>
</span>Right here, you should be able to access sensor-&gt;tzd-&gt;tzp-&gt;=
slope and<br>
sensor-&gt;tzd-&gt;tzp-&gt;offset, if you added the entry:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 coefficients =3D &l=
t;SLOPE OFFSET&gt;;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 in you thermal zone=
 in DT.<br>
<br>
I hope this clarifies.<br>
<br></blockquote><div>Thanks for your patience:)<br></div><div>=C2=A0</div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
Let me know if you are able to use the parsing from of-thermal, instead<br>
of in your driver.<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br></div></div></blockquote><div>I=
&#39;m happy to pronounce that all have worked out. Please wait for my next=
 patch.<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div cla=
ss=3D"HOEnZb"><div class=3D"h5">
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0priv-&gt;dev =3D &amp;pdev-&gt;dev;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0platform_set_drvdata(pdev, priv);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +<br>
&gt; +remove_ts:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0clk_disable_unprepare(priv-&gt;<wbr>clk_gate);<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0clk_disable_unprepare(priv-&gt;<wbr>pclk);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0for (i--; i &gt;=3D 0; i--)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0thermal_zone_of_senso=
r_<wbr>unregister(&amp;pdev-&gt;dev,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0priv-&gt;sensors[i].tzd);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int zx2967_thermal_exit(struct platform_device *pdev)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct zx2967_thermal_priv *priv =3D platform_get=
_drvdata(pdev);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int i;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; NUM_SENSORS; i++) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct zx2967_thermal=
_sensor *sensor =3D &amp;priv-&gt;sensors[i];<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0thermal_zone_of_senso=
r_<wbr>unregister(&amp;pdev-&gt;dev, sensor-&gt;tzd);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0clk_disable_unprepare(priv-&gt;<wbr>pclk);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0clk_disable_unprepare(priv-&gt;<wbr>clk_gate);<br=
>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static const struct of_device_id zx2967_thermal_id_table[] =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{ .compatible =3D &quot;zte,zx296718-thermal&quot=
; },<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{}<br>
&gt; +};<br>
&gt; +MODULE_DEVICE_TABLE(of, zx2967_thermal_id_table);<br>
&gt; +<br>
&gt; +static SIMPLE_DEV_PM_OPS(zx2967_<wbr>thermal_pm_ops,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 zx2967_thermal_suspend, zx2967_thermal_resume);<br>
&gt; +<br>
&gt; +static struct platform_driver zx2967_thermal_driver =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.probe =3D zx2967_thermal_probe,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.remove =3D zx2967_thermal_exit,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.driver =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.name =3D &quot;zx296=
7_thermal&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.of_match_table =3D z=
x2967_thermal_id_table,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.pm =3D &amp;zx2967_t=
hermal_pm_ops,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0},<br>
&gt; +};<br>
&gt; +module_platform_driver(<wbr>zx2967_thermal_driver);<br>
&gt; +<br>
&gt; +MODULE_AUTHOR(&quot;Baoyou Xie &lt;<a href=3D"mailto:baoyou.xie@linar=
o.org">baoyou.xie@linaro.org</a>&gt;&quot;);<br>
&gt; +MODULE_DESCRIPTION(&quot;ZTE zx2967 thermal driver&quot;);<br>
&gt; +MODULE_LICENSE(&quot;GPL v2&quot;);<br>
&gt; --<br>
&gt; 2.7.4<br>
&gt;<br>
</div></div></blockquote></div><br></div></div>

--001a1148cd22b54fbe05479b0c14--
