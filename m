Return-Path: <SRS0=BiPQ=ZW=linaro.org=baoyou.xie@kernel.org>
MIME-Version: 1.0
In-Reply-To: <CAHp75VdXZPcUHKAekrSCVFC7kUh8Wx+q1WjThqdVYhusd_LmBQ@mail.gmail.com>
References: <1486545372-5184-1-git-send-email-baoyou.xie@linaro.org>
 <1486545372-5184-2-git-send-email-baoyou.xie@linaro.org> <CAHp75VdXZPcUHKAekrSCVFC7kUh8Wx+q1WjThqdVYhusd_LmBQ@mail.gmail.com>
From: Baoyou Xie <baoyou.xie@linaro.org>
Date: Thu, 9 Feb 2017 15:18:50 +0800
Message-ID: <CA+DQWkza6OPvC0uM4fyCJ3dKJDfkS0_0pCAyikiGMQU3PNgqaw@mail.gmail.com>
Subject: Re: [PATCH v5 3/3] i2c: zx2967: add i2c controller driver for ZTE's
 zx2967 family
Content-Type: multipart/alternative; boundary=94eb2c08cd56051df7054813cb80
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Jun Nie <jun.nie@linaro.org>, Wolfram Sang <wsa@the-dreams.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>, linux-i2c@vger.kernel.org, devicetree <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "xie.baoyou" <xie.baoyou@zte.com.cn>, chen.chaokai@zte.com.cn, wang.qiang01@zte.com.cn
List-ID: <devicetree@vger.kernel.org>

--94eb2c08cd56051df7054813cb80
Content-Type: text/plain; charset=UTF-8

On 9 February 2017 at 06:04, Andy Shevchenko <andy.shevchenko@gmail.com>
wrote:

> On Wed, Feb 8, 2017 at 11:16 AM, Baoyou Xie <baoyou.xie@linaro.org> wrote:
> > This patch adds i2c controller driver for ZTE's zx2967 family.
> >
> > Signed-off-by: Baoyou Xie <baoyou.xie@linaro.org>
> > Reviewed-by: Shawn Guo <shawnguo@kernel.org>
>
> > +static int zx2967_i2c_empty_rx_fifo(struct zx2967_i2c_info *zx_i2c,
> u32 size)
> > +{
> > +       u8 val[I2C_FIFO_MAX] = {0};
> > +       int i;
>
> > +       zx2967_i2c_readsb(zx_i2c, val, REG_DATA, size);
> > +       for (i = 0; i < size; i++) {
>
> > +               *zx_i2c->buf++ = val[i];
>
> Sorry, I just realized that it might be completely wrong.
> Here we advance the buf pointer. If it's allocated the question is
> where the beginning pointer is kept?
> Or what I missed?
>
>
->buf is a temp pointer, but be set in function zx2967_i2c_xfer_msg. So, it
can run correctly.

Maybe, i need rename this field's name to make it clearer.

> +               zx_i2c->residue--;
> > +               if (zx_i2c->residue <= 0)
>
> How it could be < 0 ?
>
> In fact, we can remove this line.


> > +static int zx2967_i2c_xfer_msg(struct zx2967_i2c_info *zx_i2c,
> > +                              struct i2c_msg *msg)
> > +{
> > +       if (msg->len == 0)
> > +               return -EINVAL;
> > +
> > +       zx2967_i2c_flush_fifos(zx_i2c);
> > +
> > +       zx_i2c->buf = msg->buf;
> > +       zx_i2c->residue = msg->len;
> > +       zx_i2c->access_cnt = msg->len / I2C_FIFO_MAX;
>
> > +       zx_i2c->msg_rd = (msg->flags & I2C_M_RD);
>
> Redundant parens.
>
> > +
> > +       if (zx_i2c->msg_rd)
> > +               return zx2967_i2c_xfer_read(zx_i2c);
> > +
> > +       return zx2967_i2c_xfer_write(zx_i2c);
> > +}
>
> > +       zx2967_i2c_writel(zx_i2c, (msgs->addr & 0x7f), REG_DEVADDR_L);
>
> Ditto
>
> > +       zx2967_i2c_writel(zx_i2c, (msgs->addr >> 7) & 0x7,
> REG_DEVADDR_H);
>
> Though it might be written like this (depends on what style Wolfram
> prefers)
>
>       zx2967_i2c_writel(zx_i2c, (msgs->addr >> 0) & 0x7f, REG_DEVADDR_L);
>       zx2967_i2c_writel(zx_i2c, (msgs->addr >> 7) & 0x07, REG_DEVADDR_H);
>
> > +       return num;
> > +}
>
> > +static void
> > +zx2967_smbus_xfer_prepare(struct zx2967_i2c_info *zx_i2c, u16 addr,
> > +                         char read_write, u8 command, int size,
> > +                         union i2c_smbus_data *data)
> > +{
> > +       u32 val;
> > +
> > +       val = zx2967_i2c_readl(zx_i2c, REG_RDCONF);
> > +       val |= I2C_RFIFO_RESET;
> > +       zx2967_i2c_writel(zx_i2c, val, REG_RDCONF);
> > +       zx2967_i2c_writel(zx_i2c, (addr & 0x7f), REG_DEVADDR_L);
>
> Redundant parens.
>
> > +       case I2C_SMBUS_WORD_DATA:
> > +               zx2967_i2c_writel(zx_i2c, command, REG_DATA);
> > +               if (read_write == I2C_SMBUS_WRITE) {
>
> > +                       zx2967_i2c_writel(zx_i2c, (data->word >> 8),
> REG_DATA);
> > +                       zx2967_i2c_writel(zx_i2c, (data->word & 0xff),
>
> Btw does hw support byte access?
> If so, _writeb() / _readb() would help a lot in this driver.
>
> Hardware engineer suggests to keep it.


> > +                                         REG_DATA);
> > +               }
> > +               break;
> > +       }
> > +}
>
> > +static int zx2967_i2c_probe(struct platform_device *pdev)
> > +{
> > +       struct zx2967_i2c_info *zx_i2c;
> > +       void __iomem *reg_base;
>
>
> > +       ret = clk_prepare_enable(clk);
> > +       if (ret) {
> > +               dev_err(&pdev->dev, "failed to enable i2c_clk\n");
> > +               return ret;
> > +       }
>
> If Dmitry's patch gets upstream earlier than yours I would consider to
> switch to devm_clk_prepare_enable().
>
> Linux-next 20170116 is my work base. it seems that devm_clk_prepare_enable
is not ready in this version.

Let's change to devm_clk_prepare_enable in future, ok?


> > +
> > +       ret = platform_get_irq(pdev, 0);
> > +       if (ret < 0)
> > +               return ret;
>
> > +       zx_i2c->irq = ret;
>
> I would group this with below assignments...
>
> ok


> > +
> > +       ret = device_property_read_u32(&pdev->dev, "clock-frequency",
> > +                                      &zx_i2c->clk_freq);
> > +       if (ret) {
> > +               dev_err(&pdev->dev, "missing clock-frequency");
> > +               return ret;
> > +       }
> > +
>
> > +       zx_i2c->reg_base = reg_base;
> > +       zx_i2c->clk = clk;
>
> ...^^^
>
> --
> With Best Regards,
> Andy Shevchenko
>

--94eb2c08cd56051df7054813cb80
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On 9 February 2017 at 06:04, Andy Shevchenko <span dir=3D"ltr">&lt;<a h=
ref=3D"mailto:andy.shevchenko@gmail.com" target=3D"_blank">andy.shevchenko@=
gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><span class=3D"gmail-">On Wed, Feb 8, 2017 at 11:16 AM, Baoyou X=
ie &lt;<a href=3D"mailto:baoyou.xie@linaro.org">baoyou.xie@linaro.org</a>&g=
t; wrote:<br>
&gt; This patch adds i2c controller driver for ZTE&#39;s zx2967 family.<br>
&gt;<br>
&gt; Signed-off-by: Baoyou Xie &lt;<a href=3D"mailto:baoyou.xie@linaro.org"=
>baoyou.xie@linaro.org</a>&gt;<br>
&gt; Reviewed-by: Shawn Guo &lt;<a href=3D"mailto:shawnguo@kernel.org">shaw=
nguo@kernel.org</a>&gt;<br>
<br>
</span><span class=3D"gmail-">&gt; +static int zx2967_i2c_empty_rx_fifo(<wb=
r>struct zx2967_i2c_info *zx_i2c, u32 size)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u8 val[I2C_FIFO_MAX] =3D {0};<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0int i;<br>
<br>
</span>&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0zx2967_i2c_readsb(zx_i2c, val, REG_=
DATA, size);<br>
<span class=3D"gmail-">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt=
; size; i++) {<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*zx_i2c-&gt;bu=
f++ =3D val[i];<br>
<br>
</span>Sorry, I just realized that it might be completely wrong.<br>
Here we advance the buf pointer. If it&#39;s allocated the question is<br>
where the beginning pointer is kept?<br>
Or what I missed?<br>
<span class=3D"gmail-"><br></span></blockquote><div>=C2=A0<br><span class=
=3D"gmail-">-&gt;buf is a temp pointer, but be set in function </span>zx296=
7_i2c_xfer_msg. So, it can run correctly.<br><br></div><div>Maybe, i need r=
ename this field&#39;s name to make it clearer.<br></div><div><br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex"><span class=3D"gmail-">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0zx_i2c-&gt;res=
idue--;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (zx_i2c-&gt=
;residue &lt;=3D 0)<br>
<br>
</span>How it could be &lt; 0 ?<br>
<span class=3D"gmail-"><br></span></blockquote><div>In fact, we can remove =
this line.<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex"><span class=3D"gmail-">
&gt; +static int zx2967_i2c_xfer_msg(struct zx2967_i2c_info *zx_i2c,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct i2c_msg *msg)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (msg-&gt;len =3D=3D 0)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL=
;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0zx2967_i2c_flush_fifos(zx_i2c)<wbr>;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0zx_i2c-&gt;buf =3D msg-&gt;buf;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0zx_i2c-&gt;residue =3D msg-&gt;len;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0zx_i2c-&gt;access_cnt =3D msg-&gt;len / I2=
C_FIFO_MAX;<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0zx_i2c-&gt;msg_rd =3D (msg-&gt;flags &amp;=
 I2C_M_RD);<br>
<br>
</span>Redundant parens.<br>
<span class=3D"gmail-"><br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (zx_i2c-&gt;msg_rd)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return zx2967_=
i2c_xfer_read(zx_i2c);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return zx2967_i2c_xfer_write(zx_i2c);<br>
&gt; +}<br>
<br>
</span>&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0zx2967_i2c_writel(zx_i2c, (msgs-&gt=
;addr &amp; 0x7f), REG_DEVADDR_L);<br>
<br>
Ditto<br>
<span class=3D"gmail-"><br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0zx2967_i2c_writel(zx_i2c, (msgs-&gt;addr &=
gt;&gt; 7) &amp; 0x7, REG_DEVADDR_H);<br>
<br>
</span>Though it might be written like this (depends on what style Wolfram =
prefers)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 zx2967_i2c_writel(zx_i2c, (msgs-&gt;addr &gt;&gt; 0) &=
amp; 0x7f, REG_DEVADDR_L);<br>
=C2=A0 =C2=A0 =C2=A0 zx2967_i2c_writel(zx_i2c, (msgs-&gt;addr &gt;&gt; 7) &=
amp; 0x07, REG_DEVADDR_H);<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return num;<br>
<span class=3D"gmail-">&gt; +}<br>
<br>
&gt; +static void<br>
&gt; +zx2967_smbus_xfer_prepare(<wbr>struct zx2967_i2c_info *zx_i2c, u16 ad=
dr,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0char read_write, u8 command, int size,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0union i2c_smbus_data *data)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 val;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0val =3D zx2967_i2c_readl(zx_i2c, REG_RDCON=
F);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0val |=3D I2C_RFIFO_RESET;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0zx2967_i2c_writel(zx_i2c, val, REG_RDCONF)=
;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0zx2967_i2c_writel(zx_i2c, (addr &amp; 0x7f=
), REG_DEVADDR_L);<br>
<br>
</span>Redundant parens.<br>
<span class=3D"gmail-"><br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case I2C_SMBUS_WORD_DATA:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0zx2967_i2c_wri=
tel(zx_i2c, command, REG_DATA);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (read_write=
 =3D=3D I2C_SMBUS_WRITE) {<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0zx2967_i2c_writel(zx_i2c, (data-&gt;word &gt;&gt; 8), REG_DAT=
A);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0zx2967_i2c_writel(zx_i2c, (data-&gt;word &amp; 0xff),<br>
<br>
</span>Btw does hw support byte access?<br>
If so, _writeb() / _readb() would help a lot in this driver.<br>
<span class=3D"gmail-"><br></span></blockquote><div>Hardware engineer sugge=
sts to keep it.<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex"><span class=3D"gmail-">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0REG_DATA);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +}<br>
<br>
</span><span class=3D"gmail-">&gt; +static int zx2967_i2c_probe(struct plat=
form_device *pdev)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct zx2967_i2c_info *zx_i2c;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0void __iomem *reg_base;<br>
<br>
<br>
</span>&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D clk_prepare_enable(clk);<br=
>
<span class=3D"gmail-">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(&amp;p=
dev-&gt;dev, &quot;failed to enable i2c_clk\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
<br>
</span>If Dmitry&#39;s patch gets upstream earlier than yours I would consi=
der to<br>
switch to devm_clk_prepare_enable().<br>
<span class=3D"gmail-"><br></span></blockquote><div>Linux-next 20170116 is =
my work base. it seems that devm_clk_prepare_enable is not ready in this ve=
rsion.<br><br></div><div>Let&#39;s change to devm_clk_prepare_enable in fut=
ure, ok?<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><span class=3D"gmail-">
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D platform_get_irq(pdev, 0);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret &lt; 0)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br=
>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0zx_i2c-&gt;irq =3D ret;<br>
<br>
</span>I would group this with below assignments...<br>
<span class=3D"gmail-"><br></span></blockquote><div>ok<br>=C2=A0<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex"><span class=3D"gmail-">
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D device_property_read_u32(&amp;<wbr=
>pdev-&gt;dev, &quot;clock-frequency&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;zx_i2c=
-&gt;clk_freq);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(&amp;p=
dev-&gt;dev, &quot;missing clock-frequency&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0zx_i2c-&gt;reg_base =3D reg_base;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0zx_i2c-&gt;clk =3D clk;<br>
<br>
</span>...^^^<br>
<span class=3D"gmail-HOEnZb"><font color=3D"#888888"><br>
--<br>
With Best Regards,<br>
Andy Shevchenko<br>
</font></span></blockquote></div><br></div></div>

--94eb2c08cd56051df7054813cb80--
