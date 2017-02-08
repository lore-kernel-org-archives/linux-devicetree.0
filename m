Return-Path: <SRS0=cB1O=ZV=linaro.org=baoyou.xie@kernel.org>
MIME-Version: 1.0
In-Reply-To: <CAHp75Ve+J+ECRpsCCoV_87nHH+AALQpgrygiy0qSOFMK22yABw@mail.gmail.com>
References: <1486351569-4814-1-git-send-email-baoyou.xie@linaro.org>
 <1486351569-4814-3-git-send-email-baoyou.xie@linaro.org> <CAHp75Ve+J+ECRpsCCoV_87nHH+AALQpgrygiy0qSOFMK22yABw@mail.gmail.com>
From: Baoyou Xie <baoyou.xie@linaro.org>
Date: Wed, 8 Feb 2017 14:30:07 +0800
Message-ID: <CA+DQWkzjoNmQmG60yJR2Lg=KOi1QNssVfr4_N5HhS4fwN_pMew@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] i2c: zx2967: add i2c controller driver for ZTE's
 zx2967 family
Content-Type: multipart/alternative; boundary=94eb2c08cd56f1080f0547fefe8e
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Jun Nie <jun.nie@linaro.org>, Wolfram Sang <wsa@the-dreams.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>, linux-i2c@vger.kernel.org, devicetree <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

--94eb2c08cd56f1080f0547fefe8e
Content-Type: text/plain; charset=UTF-8

On 7 February 2017 at 18:47, Andy Shevchenko <andy.shevchenko@gmail.com>
wrote:

> On Mon, Feb 6, 2017 at 5:26 AM, Baoyou Xie <baoyou.xie@linaro.org> wrote:
> > This patch adds i2c controller driver for ZTE's zx2967 family.
>
> > +#define I2C_STOP                       0
> > +#define I2C_MASTER                     BIT(0)
> > +#define I2C_ADDR_MODE_TEN              BIT(1)
> > +#define I2C_IRQ_MSK_ENABLE             BIT(3)
> > +#define I2C_RW_READ                    BIT(4)
> > +#define I2C_CMB_RW_EN                  BIT(5)
> > +#define I2C_START                      BIT(6)
>
> > +#define I2C_ADDR_MODE_TEN              BIT(1)
>
> I'm not sure you have to repeat this.
>
> it's a mistake, i will remove the duplicate one.



> > +#define I2C_WFIFO_RESET                        BIT(7)
> > +#define I2C_RFIFO_RESET                        BIT(7)
>
> Hmm... Are they applied to the same register?
>
> it's not a problem, cause of they are applied to different register.


> > +struct zx2967_i2c_info {
> > +       spinlock_t              lock;
>
> > +       struct device           *dev;
> > +       struct i2c_adapter      adap;
>
> I'm pretty sure you may access *dev from adap. Or they are different
> devices?
>
> ok


> > +       struct clk              *clk;
> > +       struct completion       complete;
> > +       u32                     clk_freq;
> > +       void __iomem            *reg_base;
> > +       size_t                  residue;
> > +       int                     irq;
> > +       int                     msg_rd;
> > +       u8                      *buf;
> > +       u8                      access_cnt;
> > +       bool                    is_suspended;
> > +};
>
>
> > +static void zx2967_i2c_flush_fifos(struct zx2967_i2c_info *zx_i2c)
> > +{
>
> > +       u32 val;
> > +       u32 offset;
>
> Reversed tree?
>
> > +
> > +       if (zx_i2c->msg_rd) {
> > +               offset = REG_RDCONF;
> > +               val = I2C_RFIFO_RESET;
> > +       } else {
> > +               offset = REG_WRCONF;
> > +               val = I2C_WFIFO_RESET;
> > +       }
> > +
> > +       val |= zx2967_i2c_readl(zx_i2c, offset);
> > +       zx2967_i2c_writel(zx_i2c, val, offset);
> > +}
>
> > +       zx2967_i2c_readsb(zx_i2c, val, REG_DATA, size);
> > +       for (i = 0; i < size; i++) {
>
> > +               *(zx_i2c->buf++) = val[i];
>
> Do you need parens? I guess *p++ = x; is quite understandable pattern.
>
> oh, i will modify it. it remains from product code. and the product must
subject to some industry standards.



> > +               zx_i2c->residue--;
> > +               if (zx_i2c->residue <= 0)
> > +                       break;
> > +       }
> > +
> > +       barrier();
> > +
> > +       return 0;
> > +}
>
> > +static int zx2967_i2c_fill_tx_fifo(struct zx2967_i2c_info *zx_i2c)
> > +{
>
> > +       u8 *buf = zx_i2c->buf;
> > +       size_t residue = zx_i2c->residue;
>
> Reversed tree?
>
> > +
> > +       if (residue == 0) {
> > +               dev_err(zx_i2c->dev, "residue is %d\n", (int)residue);
> > +               return -EINVAL;
> > +       }
>
> > +static void zx2967_enable_tenbit(struct zx2967_i2c_info *zx_i2c, __u16
> addr)
> > +{
> > +       u16 val = (addr >> 7) & 0x7;
>
> Magic values.
>
> > +       if (val > 0) {
>
> It can't be negative ->
>
> if (val) {
>
> > +               zx2967_i2c_writel(zx_i2c, val, REG_DEVADDR_H);
> > +               val = (zx2967_i2c_readl(zx_i2c, REG_CMD)) |
> I2C_ADDR_MODE_TEN;
> > +               zx2967_i2c_writel(zx_i2c, val, REG_CMD);
> > +       }
> > +}
>
> > +static int zx2967_i2c_xfer(struct i2c_adapter *adap,
> > +                          struct i2c_msg *msgs, int num)
> > +{
> > +       struct zx2967_i2c_info *zx_i2c = i2c_get_adapdata(adap);
> > +       int ret;
> > +       int i;
> > +
> > +       if (zx_i2c->is_suspended)
> > +               return -EBUSY;
> > +
> > +       zx2967_i2c_writel(zx_i2c, (msgs->addr & 0x7f), REG_DEVADDR_L);
> > +       zx2967_i2c_writel(zx_i2c, (msgs->addr >> 7) & 0x7,
> REG_DEVADDR_H);
> > +       if (zx2967_i2c_readl(zx_i2c, REG_DEVADDR_H) > 0)
> > +               zx2967_enable_tenbit(zx_i2c, msgs->addr);
> > +
> > +       for (i = 0; i < num; i++) {
> > +               ret = zx2967_i2c_xfer_msg(zx_i2c, &msgs[i]);
> > +               if (ret)
> > +                       return ret;
>
> > +               if (num > 1)
>
> Would it be drastic performance impact if you remove this condition
> and do sleep unconditionally?
>
> > +                       usleep_range(1000, 2000);
>
> Why do you need this in any case? Comment, please. Do this for every
> non-commented *sleep() call in this driver.
> (You may define minimum sleep range, put comment there and use it in
> those *sleep() calls)
>

ok, i think it's unnecessary.


> > +       }
> > +
> > +       return num;
> > +}
>
> > +#ifdef CONFIG_PM
> > +static const struct dev_pm_ops zx2967_i2c_dev_pm_ops = {
> > +       .suspend        = zx2967_i2c_suspend,
> > +       .resume         = zx2967_i2c_resume,
> > +};
> > +#define ZX2967_I2C_DEV_PM_OPS  (&zx2967_i2c_dev_pm_ops)
> > +#else
> > +#define        ZX2967_I2C_DEV_PM_OPS   NULL
> > +#endif
>
> Remove these ugly #ifdef:s There are suitable macros are available in
> pm.h. Like SIMPLE_PM_OPS().
>
> ok, thanks.


> > +static int zx2967_i2c_probe(struct platform_device *pdev)
> > +{
> > +       struct zx2967_i2c_info *zx_i2c;
> > +       void __iomem *reg_base;
> > +       struct resource *res;
> > +       struct clk *clk;
> > +       int ret;
>
> > +       ret = device_property_read_u32(&pdev->dev, "clock-frequency",
> > +                                      &zx_i2c->clk_freq);
> > +       if (ret) {
> > +               dev_err(&pdev->dev, "missing clock-frequency");
> > +               return ret;
> > +       }
>
> How is it used? You enabled clock before this and that clock
> apparently has to have frequency > 0. Isn't the same frequency we are
> considering here?
>
> clk_freq is the i2c's freq, but not the clock freq. it's used in
zx2967_i2c_reset_hardware.


> > +       zx_i2c->reg_base = reg_base;
> > +       zx_i2c->clk = clk;
> > +       zx_i2c->dev = &pdev->dev;
>
> > +       i2c_set_adapdata(&zx_i2c->adap, zx_i2c);
>
> > +       zx_i2c->adap.owner = THIS_MODULE;
>
> Is it still needed?
>
> i will remove it.


> --
> With Best Regards,
> Andy Shevchenko
>

--94eb2c08cd56f1080f0547fefe8e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On 7 February 2017 at 18:47, Andy Shevchenko <span dir=3D"ltr">&lt;<a h=
ref=3D"mailto:andy.shevchenko@gmail.com" target=3D"_blank">andy.shevchenko@=
gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><span class=3D"gmail-">On Mon, Feb 6, 2017 at 5:26 AM, Baoyou Xi=
e &lt;<a href=3D"mailto:baoyou.xie@linaro.org">baoyou.xie@linaro.org</a>&gt=
; wrote:<br>
&gt; This patch adds i2c controller driver for ZTE&#39;s zx2967 family.<br>
<br>
</span><span class=3D"gmail-">&gt; +#define I2C_STOP=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00<br>
&gt; +#define I2C_MASTER=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0BIT(0)<br>
&gt; +#define I2C_ADDR_MODE_TEN=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 BIT(1)<br>
&gt; +#define I2C_IRQ_MSK_ENABLE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0BIT(3)<br>
&gt; +#define I2C_RW_READ=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 BIT(4)<br>
&gt; +#define I2C_CMB_RW_EN=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 BIT(5)<br>
&gt; +#define I2C_START=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 BIT(6)<br>
<br>
&gt; +#define I2C_ADDR_MODE_TEN=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 BIT(1)<br>
<br>
</span>I&#39;m not sure you have to repeat this.<br>
<span class=3D"gmail-"><br></span></blockquote><div>it&#39;s a mistake, i w=
ill remove the duplicate one.<br></div><div><br>=C2=A0</div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex"><span class=3D"gmail-">
&gt; +#define I2C_WFIFO_RESET=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 BIT(7)<br>
&gt; +#define I2C_RFIFO_RESET=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 BIT(7)<br>
<br>
</span>Hmm... Are they applied to the same register?<br>
<span class=3D"gmail-"><br></span></blockquote><div>it&#39;s not a problem,=
 cause of they are applied to different register.<br></div><div>=C2=A0</div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex"><span class=3D"gmail-">
&gt; +struct zx2967_i2c_info {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0spinlock_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 lock;<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct device=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0*dev;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct i2c_adapter=C2=A0 =C2=A0 =C2=A0 ada=
p;<br>
<br>
</span>I&#39;m pretty sure you may access *dev from adap. Or they are diffe=
rent devices?<br>
<span class=3D"gmail-"><br></span></blockquote><div>ok<br></div><div>=C2=A0=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex"><span class=3D"gmai=
l-">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct clk=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 *clk;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct completion=C2=A0 =C2=A0 =C2=A0 =C2=
=A0complete;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0clk_freq;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0void __iomem=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 *reg_base;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0size_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 residue;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0int=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0irq;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0int=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0msg_rd;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u8=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *buf;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u8=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 access_cnt;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0bool=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 is_suspended;<br>
&gt; +};<br>
<br>
<br>
</span><span class=3D"gmail-">&gt; +static void zx2967_i2c_flush_fifos(stru=
ct zx2967_i2c_info *zx_i2c)<br>
&gt; +{<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 val;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 offset;<br>
<br>
</span>Reversed tree?<br>
<span class=3D"gmail-"><br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (zx_i2c-&gt;msg_rd) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0offset =3D REG=
_RDCONF;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0val =3D I2C_RF=
IFO_RESET;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0offset =3D REG=
_WRCONF;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0val =3D I2C_WF=
IFO_RESET;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0val |=3D zx2967_i2c_readl(zx_i2c, offset);=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0zx2967_i2c_writel(zx_i2c, val, offset);<br=
>
&gt; +}<br>
<br>
</span>&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0zx2967_i2c_readsb(zx_i2c, val, REG_=
DATA, size);<br>
<span class=3D"gmail-">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt=
; size; i++) {<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*(zx_i2c-&gt;b=
uf++) =3D val[i];<br>
<br>
</span>Do you need parens? I guess *p++ =3D x; is quite understandable patt=
ern.<br>
<span class=3D"gmail-"><br></span></blockquote><div>oh, i will modify it. i=
t remains from product code. and the product must subject to some industry =
standards.<br></div><div><br>=C2=A0</div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex"><span class=3D"gmail-">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0zx_i2c-&gt;res=
idue--;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (zx_i2c-&gt=
;residue &lt;=3D 0)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0barrier();<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +}<br>
<br>
</span><span class=3D"gmail-">&gt; +static int zx2967_i2c_fill_tx_fifo(stru=
ct zx2967_i2c_info *zx_i2c)<br>
&gt; +{<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u8 *buf =3D zx_i2c-&gt;buf;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0size_t residue =3D zx_i2c-&gt;residue;<br>
<br>
</span>Reversed tree?<br>
<span class=3D"gmail-"><br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (residue =3D=3D 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(zx_i2c=
-&gt;dev, &quot;residue is %d\n&quot;, (int)residue);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL=
;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
<br>
</span><span class=3D"gmail-">&gt; +static void zx2967_enable_tenbit(struct=
 zx2967_i2c_info *zx_i2c, __u16 addr)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u16 val =3D (addr &gt;&gt; 7) &amp; 0x7;<b=
r>
<br>
</span>Magic values.<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (val &gt; 0) {<br>
<br>
It can&#39;t be negative -&gt;<br>
<br>
if (val) {<br>
<span class=3D"gmail-"><br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0zx2967_i2c_wri=
tel(zx_i2c, val, REG_DEVADDR_H);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0val =3D (zx296=
7_i2c_readl(zx_i2c, REG_CMD)) | I2C_ADDR_MODE_TEN;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0zx2967_i2c_wri=
tel(zx_i2c, val, REG_CMD);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +}<br>
<br>
</span><span class=3D"gmail-">&gt; +static int zx2967_i2c_xfer(struct i2c_a=
dapter *adap,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 struct i2c_msg *msgs, int num)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct zx2967_i2c_info *zx_i2c =3D i2c_get=
_adapdata(adap);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0int i;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (zx_i2c-&gt;is_suspended)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EBUSY;=
<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0zx2967_i2c_writel(zx_i2c, (msgs-&gt;addr &=
amp; 0x7f), REG_DEVADDR_L);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0zx2967_i2c_writel(zx_i2c, (msgs-&gt;addr &=
gt;&gt; 7) &amp; 0x7, REG_DEVADDR_H);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (zx2967_i2c_readl(zx_i2c, REG_DEVADDR_H=
) &gt; 0)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0zx2967_enable_=
tenbit(zx_i2c, msgs-&gt;addr);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; num; i++) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D zx2967=
_i2c_xfer_msg(zx_i2c, &amp;msgs[i]);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0return ret;<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (num &gt; 1=
)<br>
<br>
</span>Would it be drastic performance impact if you remove this condition<=
br>
and do sleep unconditionally?<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0usleep_range(1000, 2000);<br>
<br>
Why do you need this in any case? Comment, please. Do this for every<br>
non-commented *sleep() call in this driver.<br>
(You may define minimum sleep range, put comment there and use it in<br>
those *sleep() calls)<br>
<span class=3D"gmail-"></span>=C2=A0</blockquote><div>ok, i think it&#39;s =
unnecessary.<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex"><span class=3D"gmail-">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return num;<br>
&gt; +}<br>
<br>
</span><span class=3D"gmail-">&gt; +#ifdef CONFIG_PM<br>
&gt; +static const struct dev_pm_ops zx2967_i2c_dev_pm_ops =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.suspend=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D zx=
2967_i2c_suspend,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.resume=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
=3D zx2967_i2c_resume,<br>
&gt; +};<br>
&gt; +#define ZX2967_I2C_DEV_PM_OPS=C2=A0 (&amp;zx2967_i2c_dev_pm_ops)<br>
&gt; +#else<br>
&gt; +#define=C2=A0 =C2=A0 =C2=A0 =C2=A0 ZX2967_I2C_DEV_PM_OPS=C2=A0 =C2=A0=
NULL<br>
&gt; +#endif<br>
<br>
</span>Remove these ugly #ifdef:s There are suitable macros are available i=
n<br>
pm.h. Like SIMPLE_PM_OPS().<br>
<span class=3D"gmail-"><br></span></blockquote><div>ok, thanks.<br></div><d=
iv>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><span clas=
s=3D"gmail-">
&gt; +static int zx2967_i2c_probe(struct platform_device *pdev)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct zx2967_i2c_info *zx_i2c;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0void __iomem *reg_base;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct resource *res;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct clk *clk;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret;<br>
<br>
</span>&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D device_property_read_u32(&a=
mp;<wbr>pdev-&gt;dev, &quot;clock-frequency&quot;,<br>
<span class=3D"gmail-">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 &amp;zx_i2c-&gt;clk_freq);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(&amp;p=
dev-&gt;dev, &quot;missing clock-frequency&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
<br>
</span>How is it used? You enabled clock before this and that clock<br>
apparently has to have frequency &gt; 0. Isn&#39;t the same frequency we ar=
e<br>
considering here?<br>
<span class=3D"gmail-"><br></span></blockquote><div>clk_freq is the i2c&#39=
;s freq, but not the clock freq. it&#39;s used in zx2967_i2c_reset_hardware=
.<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x"><span class=3D"gmail-">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0zx_i2c-&gt;reg_base =3D reg_base;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0zx_i2c-&gt;clk =3D clk;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0zx_i2c-&gt;dev =3D &amp;pdev-&gt;dev;<br>
<br>
</span>&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0i2c_set_adapdata(&amp;zx_i2c-&gt;<w=
br>adap, zx_i2c);<br>
<span class=3D"gmail-"><br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0zx_i2c-&gt;adap.owner =3D THIS_MODULE;<br>
<br>
</span>Is it still needed?<br>
<span class=3D"gmail-HOEnZb"><font color=3D"#888888"><br></font></span></bl=
ockquote><div>i will remove it.<br></div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex"><span class=3D"gmail-HOEnZb"><font color=
=3D"#888888">
--<br>
With Best Regards,<br>
Andy Shevchenko<br>
</font></span></blockquote></div><br></div></div>

--94eb2c08cd56f1080f0547fefe8e--
