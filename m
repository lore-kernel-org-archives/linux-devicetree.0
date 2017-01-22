Return-Path: <SRS0=zPJI=ZE=linaro.org=baoyou.xie@kernel.org>
MIME-Version: 1.0
In-Reply-To: <CAHp75VfjS-Wdun65Tx8xEniTVfiMASu022K9ipVRwxJLE8SXkg@mail.gmail.com>
References: <1484901827-16369-1-git-send-email-baoyou.xie@linaro.org>
 <1484901827-16369-3-git-send-email-baoyou.xie@linaro.org> <CAHp75VfjS-Wdun65Tx8xEniTVfiMASu022K9ipVRwxJLE8SXkg@mail.gmail.com>
From: Baoyou Xie <baoyou.xie@linaro.org>
Date: Sun, 22 Jan 2017 18:12:08 +0800
Message-ID: <CA+DQWkxcepEO4GLoJH7B8ey6zD01mCh4m=AQhqmR-SrWDc2j8A@mail.gmail.com>
Subject: Re: [PATCH v1 3/3] i2c: zx2967: add i2c controller driver for ZTE's
 zx2967 family
Content-Type: multipart/alternative; boundary=001a1140b0fa9baa4d0546ac1d56
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Jun Nie <jun.nie@linaro.org>, Wolfram Sang <wsa@the-dreams.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>, linux-i2c@vger.kernel.org, devicetree <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Shawn Guo <shawnguo@kernel.org>, "xie.baoyou" <xie.baoyou@zte.com.cn>, chen.chaokai@zte.com.cn, wang.qiang01@zte.com.cn
List-ID: <devicetree@vger.kernel.org>

--001a1140b0fa9baa4d0546ac1d56
Content-Type: text/plain; charset=UTF-8

On 21 January 2017 at 05:45, Andy Shevchenko <andy.shevchenko@gmail.com>
wrote:

> On Fri, Jan 20, 2017 at 10:43 AM, Baoyou Xie <baoyou.xie@linaro.org>
> wrote:
> > This patch adds i2c controller driver for ZTE's zx2967 family.
> >
>
> > +config I2C_ZX2967
> > +       bool "ZTE zx2967 I2C support"
>
> No module?
>
> > +       depends on ARCH_ZX
> > +       default y
>
> Would architecture selects it instead?
>
> of cause, It's ok that architecture selects it. but for subject to other
i2c drivers, I suggest to remain it.


> > +       help
> > +         Selecting this option will add ZX I2C driver.
> > +         If unsure, say y.
>
> Two sentences about the same in spite 'default y'.
>
> > +#define BW1                            (u32)1
>
> Do you really need casting?
>
> > +#define I2C_STOP                       0
> > +#define I2C_MASTER                     (1 << 0)
>
> BIT(0) ?
> And so further.
>
> > +#define I2C_INT_MASK                   0x3f
>
> GENMASK(6, 0) ?
>
>
> > +#define I2C_ERROR_MASK                 (I2C_ERROR_DATA |
> I2C_ERROR_DEVICE)
>
> Ditto.
> GENMASK() with explicit numbers.
>
> > +static int zx2967_i2c_flush_fifos(struct zx2967_i2c_info *zx_i2c)
> > +{
> > +       u32 val = 0;
> > +       u32 offset = 0;
>
> Useless assignments.
>
> > +
> > +       if (zx_i2c->msg_rd) {
> > +               offset = REG_RDCONF;
> > +               val = I2C_RFIFO_RESET;
> > +       } else {
> > +               offset = REG_WRCONF;
> > +               val = I2C_WFIFO_RESET;
> > +       }
>
> > +static int zx2967_i2c_empty_rx_fifo(struct zx2967_i2c_info *zx_i2c,
> u32 size)
> > +{
>
> > +       u8  val[I2C_FIFO_MAX] = {0};
> > +       int i = 0;
>
> Ditto.
>
> > +
> > +       if (size == 0) {
>
> Would it be the case?
>
> > +               dev_err(zx_i2c->dev, "size is invalid\n");
> > +               return -EINVAL;
> > +       }
>
> And what happens even in that case if you just remove this check?
>
> en, thanks for you find this big bug:)


> > +
> > +       zx2967_i2c_readsb(zx_i2c, val, REG_DATA, size);
> > +       for (i = 0; i < size; i++) {
> > +               *(zx_i2c->buf++) = val[i];
> > +               zx_i2c->residue--;
> > +               if (zx_i2c->residue <= 0)
> > +                       break;
>
> > +static int zx2967_i2c_fill_tx_fifo(struct zx2967_i2c_info *zx_i2c)
> > +{
> > +       u8 *buf = zx_i2c->buf;
> > +       size_t residue = zx_i2c->residue;
> > +
> > +       if (residue == 0) {
> > +               dev_err(zx_i2c->dev, "residue is %d\n", (int)residue);
> > +               return -EINVAL;
> > +       }
>
> Ditto.
>
> here, we need not worry the value of residue over I2C_FIFO_MAX.

>
> > +static void  zx2967_enable_tenbit(struct zx2967_i2c_info *zx_i2c, __u16
> addr)
> > +{
> > +       u16 val = ((addr >> 7) & 0x7);
>
> Redundant parens.
>
> > +       if (val > 0) {
>
> if (!val)
>  return;
>
> > +static int zx2967_i2c_xfer_msg(struct zx2967_i2c_info *zx_i2c,
> > +                              struct i2c_msg *msg
> > +{
> > +       unsigned long time_left = 0;
>
> > +       unsigned int i = 0;
>
> Redundant assignment.
>
> > +
> > +       if (msg->len == 0)
>
> if (!msg...)
>
> > +               return -EINVAL;
>
> > +static int zx2967_i2c_xfer(struct i2c_adapter *adap,
> > +                          struct i2c_msg *msgs, int num)
> > +{
> > +       int i;
>
> > +       int ret = 0;
>
> Redundant. See below.
>
> > +       struct zx2967_i2c_info *zx_i2c = i2c_get_adapdata(adap);
>
> Reverse tree, please.
>
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
>
> int ret;
>
> > +               ret = zx2967_i2c_xfer_msg(zx_i2c, &msgs[i]);
> > +               if (num > 1)
> > +                       usleep_range(1000, 2000);
> > +               if (ret)
>
> > +                       break;
>
> return ret;
>
> > +       }
> > +
>
> > +       return ret ?: i;
>
> return i;
>
> And looking now, how i can't be num here?
>
> > +}
>
> > +{
> > +       struct zx2967_i2c_info *zx_i2c = i2c_get_adapdata(adap);
>
> > +       u32 val;
> > +       u8 buf[2];
> > +       unsigned long time_left;
>
> Reverse tree.
>
> > +       usleep_range(1000, 2000);
> > +       switch (size) {
> > +       case I2C_SMBUS_BYTE:
> > +       case I2C_SMBUS_BYTE_DATA:
> > +               val = zx2967_i2c_readl(zx_i2c, REG_DATA);
> > +               data->byte = val;
> > +               break;
> > +       case I2C_SMBUS_WORD_DATA:
> > +       case I2C_SMBUS_PROC_CALL:
> > +               buf[0] = zx2967_i2c_readl(zx_i2c, REG_DATA);
> > +               buf[1] = zx2967_i2c_readl(zx_i2c, REG_DATA);
> > +               data->word = (buf[0] << 8) | buf[1];
> > +               break;
> > +       default:
> > +               dev_warn(&adap->dev, "Unsupported transaction %d\n",
> size);
> > +               return -EOPNOTSUPP;
> > +       }
> > +
> > +       return 0;
> > +}
>
> I would revisit those several loooong functions for splitting/refactoring.
>
> > +
> > +static u32 zx2967_i2c_func(struct i2c_adapter *adap)
> > +{
> > +       return I2C_FUNC_SMBUS_QUICK | I2C_FUNC_SMBUS_BYTE |
> > +              I2C_FUNC_SMBUS_BYTE_DATA | I2C_FUNC_SMBUS_WORD_DATA |
> > +              I2C_FUNC_SMBUS_BLOCK_DATA | I2C_FUNC_SMBUS_PROC_CALL |
> > +              I2C_FUNC_I2C | I2C_FUNC_SMBUS_I2C_BLOCK;
> > +}
>
> It's just
> #define XXX YY1 | YY2 | ...
>
> > +#ifdef CONFIG_PM
> > +static int zx2967_i2c_suspend(struct device *dev)
>
> Switch to __maybe_unuse.
>
> > +static int zx2967_i2c_probe(struct platform_device *pdev)
> > +{
>
> > +       struct resource *res;
> > +       struct zx2967_i2c_info *zx_i2c = NULL;
>
> Redundant assignment.
>
> > +       struct clk *clk;
> > +       void __iomem *reg_base;
>
> Reverse tree for all above until top of this function.
>
> > +       int ret = 0;
>
> Redundant assignment.
>
> > +
> > +       zx_i2c = devm_kzalloc(&pdev->dev, sizeof(*zx_i2c), GFP_KERNEL);
> > +       if (!zx_i2c)
> > +               return -ENOMEM;
> > +
> > +       res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>
> > +       if (!res) {
> > +               dev_err(&pdev->dev, "missing io resource\n");
> > +               return -EINVAL;
> > +       }
> > +
>
> Completely redundant lines of code.
>
> > +       reg_base = devm_ioremap_resource(&pdev->dev, res);
> > +       if (IS_ERR(reg_base))
> > +               return PTR_ERR(reg_base);
> > +
> > +       clk = devm_clk_get(&pdev->dev, NULL);
> > +       if (IS_ERR(clk)) {
> > +               dev_err(&pdev->dev, "missing controller clock");
> > +               return PTR_ERR(clk);
> > +       }
> > +
> > +       ret = clk_prepare_enable(clk);
> > +       if (ret) {
> > +               dev_err(&pdev->dev, "failed to enable i2c_clk\n");
> > +               return ret;
> > +       }
> > +
>
> > +       of_property_read_u32(pdev->dev.of_node,
> > +                       "clock-frequency", &zx_i2c->clk_freq);
>
> devce_property_read_uXX();
>
> > +       zx_i2c->reg_base = reg_base;
> > +       zx_i2c->clk = clk;
>
> > +       zx_i2c->irq = platform_get_irq(pdev, 0);
>
> Is this optional?
> Otherwise has to be checked.
>
> > +       zx_i2c->id = pdev->id;
> > +       zx_i2c->dev = &pdev->dev;
> > +
> > +       zx_i2c->pin_scl = devm_pinctrl_get_select(&pdev->dev, "scl");
> > +       if (IS_ERR(zx_i2c->pin_scl))
> > +               dev_info(&pdev->dev, "scl pin is not specified in
> dts\n");
> > +
> > +       zx_i2c->pin_sda = devm_pinctrl_get_select(&pdev->dev, "sda");
> > +       if (IS_ERR(zx_i2c->pin_sda))
> > +               dev_info(&pdev->dev, "sda pin is not specified in
> dts\n");
> > +
> > +       spin_lock_init(&zx_i2c->lock);
> > +       init_completion(&zx_i2c->complete);
> > +       platform_set_drvdata(pdev, zx_i2c);
> > +
> > +       ret = zx2967_i2c_reset_hardware(zx_i2c);
> > +       if (ret) {
> > +               dev_err(&pdev->dev, "failed to initialize i2c
> controller\n");
> > +               goto unprepare_clk;
> > +       }
> > +
> > +       ret = devm_request_irq(&pdev->dev, zx_i2c->irq,
> > +                       zx2967_i2c_isr, 0, dev_name(&pdev->dev), zx_i2c);
> > +       if (ret) {
> > +               dev_err(&pdev->dev, "failed to request irq %i\n",
> zx_i2c->irq);
> > +               goto unprepare_clk;
> > +       }
> > +
> > +       i2c_set_adapdata(&zx_i2c->adap, zx_i2c);
>
> > +       zx_i2c->adap.owner = THIS_MODULE;
>
> Do you need this?
>
> > +       zx_i2c->adap.class = I2C_CLASS_DEPRECATED;
> > +       strlcpy(zx_i2c->adap.name, "zx2967 i2c adapter",
> > +               sizeof(zx_i2c->adap.name));
> > +       zx_i2c->adap.algo = &zx2967_i2c_algo;
> > +       zx_i2c->adap.dev.parent = &pdev->dev;
> > +       zx_i2c->adap.nr = pdev->id;
> > +       zx_i2c->adap.dev.of_node = pdev->dev.of_node;
> > +
> > +       ret = i2c_add_numbered_adapter(&zx_i2c->adap);
> > +       if (ret) {
> > +               dev_err(&pdev->dev, "failed to add zx2967 i2c
> adapter\n");
> > +               goto unprepare_clk;
> > +       }
> > +
> > +       return 0;
> > +
> > +unprepare_clk:
>
> err_clk_unprepare:
>
> > +       clk_unprepare(zx_i2c->clk);
>
> Perhaps clk_disable_unprepare();
>
> > +       return ret;
> > +}
> > +
> > +static int zx2967_i2c_remove(struct platform_device *pdev)
> > +{
> > +       struct zx2967_i2c_info *zx_i2c = platform_get_drvdata(pdev);
> > +
> > +       i2c_del_adapter(&zx_i2c->adap);
>
> > +       clk_unprepare(zx_i2c->clk);
>
> Ditto.
>
> > +
> > +       return 0;
> > +}
>
> > +MODULE_AUTHOR("Baoyou Xie <baoyou.xie@linaro.org>");
> > +MODULE_DESCRIPTION("ZTE zx2967 I2C Bus Controller driver");
> > +MODULE_LICENSE("GPL v2");
>
> When bool in Kconfig this all redundant.
>
> --
> With Best Regards,
> Andy Shevchenko
>

--001a1140b0fa9baa4d0546ac1d56
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On 21 January 2017 at 05:45, Andy Shevchenko <span dir=3D"ltr">&lt;<a h=
ref=3D"mailto:andy.shevchenko@gmail.com" target=3D"_blank">andy.shevchenko@=
gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><span class=3D"gmail-">On Fri, Jan 20, 2017 at 10:43 AM, Baoyou =
Xie &lt;<a href=3D"mailto:baoyou.xie@linaro.org">baoyou.xie@linaro.org</a>&=
gt; wrote:<br>
&gt; This patch adds i2c controller driver for ZTE&#39;s zx2967 family.<br>
&gt;<br>
<br>
</span><span class=3D"gmail-">&gt; +config I2C_ZX2967<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0bool &quot;ZTE zx2967 I2C support&quot;<br=
>
<br>
</span>No module?<br>
<span class=3D"gmail-"><br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on ARCH_ZX<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0default y<br>
<br>
</span>Would architecture selects it instead?<br>
<span class=3D"gmail-"><br></span></blockquote><div>of cause, It&#39;s ok t=
hat architecture selects it. but for subject to other i2c drivers, I sugges=
t to remain it.<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex"><span class=3D"gmail-">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0help<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Selecting this option will add ZX I=
2C driver.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0If unsure, say y.<br>
<br>
</span>Two sentences about the same in spite &#39;default y&#39;.<br>
<br>
&gt; +#define BW1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (u32)1<br>
<br>
Do you really need casting?<br>
<span class=3D"gmail-"><br>
&gt; +#define I2C_STOP=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00<br>
&gt; +#define I2C_MASTER=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0(1 &lt;&lt; 0)<br>
<br>
</span>BIT(0) ?<br>
And so further.<br>
<br>
&gt; +#define I2C_INT_MASK=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A00x3f<br>
<br>
GENMASK(6, 0) ?<br>
<br>
<br>
&gt; +#define I2C_ERROR_MASK=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0(I2C_ERROR_DATA | I2C_ERROR_DEVICE)<br>
<br>
Ditto.<br>
GENMASK() with explicit numbers.<br>
<span class=3D"gmail-"><br>
&gt; +static int zx2967_i2c_flush_fifos(struct zx2967_i2c_info *zx_i2c)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 val =3D 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 offset =3D 0;<br>
<br>
</span>Useless assignments.<br>
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
<br>
</span><span class=3D"gmail-">&gt; +static int zx2967_i2c_empty_rx_fifo(<wb=
r>struct zx2967_i2c_info *zx_i2c, u32 size)<br>
&gt; +{<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u8=C2=A0 val[I2C_FIFO_MAX] =3D {0};<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0int i =3D 0;<br>
<br>
</span>Ditto.<br>
<span class=3D"gmail-"><br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (size =3D=3D 0) {<br>
<br>
</span>Would it be the case?<br>
<span class=3D"gmail-"><br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(zx_i2c=
-&gt;dev, &quot;size is invalid\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL=
;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
<br>
</span>And what happens even in that case if you just remove this check?<br=
>
<span class=3D"gmail-"><br></span></blockquote><div>en, thanks for you find=
 this big bug:)<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex"><span class=3D"gmail-">
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0zx2967_i2c_readsb(zx_i2c, val, REG_DATA, s=
ize);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; size; i++) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*(zx_i2c-&gt;b=
uf++) =3D val[i];<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0zx_i2c-&gt;res=
idue--;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (zx_i2c-&gt=
;residue &lt;=3D 0)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0break;<br>
<br>
</span><span class=3D"gmail-">&gt; +static int zx2967_i2c_fill_tx_fifo(stru=
ct zx2967_i2c_info *zx_i2c)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u8 *buf =3D zx_i2c-&gt;buf;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0size_t residue =3D zx_i2c-&gt;residue;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (residue =3D=3D 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(zx_i2c=
-&gt;dev, &quot;residue is %d\n&quot;, (int)residue);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL=
;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
<br>
</span>Ditto.<br>
<span class=3D"gmail-"><br></span></blockquote><div>here, we need not worry=
 the value of residue over I2C_FIFO_MAX.<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex"><span class=3D"gmail-">
<br>
&gt; +static void=C2=A0 zx2967_enable_tenbit(struct zx2967_i2c_info *zx_i2c=
, __u16 addr)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u16 val =3D ((addr &gt;&gt; 7) &amp; 0x7);=
<br>
<br>
</span>Redundant parens.<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (val &gt; 0) {<br>
<br>
if (!val)<br>
=C2=A0return;<br>
<span class=3D"gmail-"><br>
&gt; +static int zx2967_i2c_xfer_msg(struct zx2967_i2c_info *zx_i2c,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct i2c_msg *msg<br>
</span><span class=3D"gmail-">&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned long time_left =3D 0;<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int i =3D 0;<br>
<br>
</span>Redundant assignment.<br>
<span class=3D"gmail-"><br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (msg-&gt;len =3D=3D 0)<br>
<br>
</span>if (!msg...)<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL=
;<br>
<span class=3D"gmail-"><br>
&gt; +static int zx2967_i2c_xfer(struct i2c_adapter *adap,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 struct i2c_msg *msgs, int num)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0int i;<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret =3D 0;<br>
<br>
</span>Redundant. See below.<br>
<span class=3D"gmail-"><br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct zx2967_i2c_info *zx_i2c =3D i2c_get=
_adapdata(adap);<br>
<br>
</span>Reverse tree, please.<br>
<span class=3D"gmail-"><br>
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
<br>
</span>int ret;<br>
<span class=3D"gmail-"><br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D zx2967=
_i2c_xfer_msg(zx_i2c, &amp;msgs[i]);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (num &gt; 1=
)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0usleep_range(1000, 2000);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret)<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0break;<br>
<br>
</span>return ret;<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return ret ?: i;<br>
<br>
return i;<br>
<br>
And looking now, how i can&#39;t be num here?<br>
<br>
&gt; +}<br>
<span class=3D"gmail-"><br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct zx2967_i2c_info *zx_i2c =3D i2c_get=
_adapdata(adap);<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 val;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u8 buf[2];<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned long time_left;<br>
<br>
</span>Reverse tree.<br>
<span class=3D"gmail-"><br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0usleep_range(1000, 2000);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0switch (size) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case I2C_SMBUS_BYTE:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case I2C_SMBUS_BYTE_DATA:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0val =3D zx2967=
_i2c_readl(zx_i2c, REG_DATA);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0data-&gt;byte =
=3D val;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case I2C_SMBUS_WORD_DATA:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case I2C_SMBUS_PROC_CALL:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0buf[0] =3D zx2=
967_i2c_readl(zx_i2c, REG_DATA);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0buf[1] =3D zx2=
967_i2c_readl(zx_i2c, REG_DATA);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0data-&gt;word =
=3D (buf[0] &lt;&lt; 8) | buf[1];<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0default:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_warn(&amp;=
adap-&gt;dev, &quot;Unsupported transaction %d\n&quot;, size);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EOPNOT=
SUPP;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +}<br>
<br>
</span>I would revisit those several loooong functions for splitting/refact=
oring.<br>
<span class=3D"gmail-"><br>
&gt; +<br>
&gt; +static u32 zx2967_i2c_func(struct i2c_adapter *adap)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return I2C_FUNC_SMBUS_QUICK | I2C_FUNC_SMB=
US_BYTE |<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 I2C_FUNC_SMBUS_BYTE_=
DATA | I2C_FUNC_SMBUS_WORD_DATA |<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 I2C_FUNC_SMBUS_BLOCK=
_DATA | I2C_FUNC_SMBUS_PROC_CALL |<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 I2C_FUNC_I2C | I2C_F=
UNC_SMBUS_I2C_BLOCK;<br>
&gt; +}<br>
<br>
</span>It&#39;s just<br>
#define XXX YY1 | YY2 | ...<br>
<span class=3D"gmail-"><br>
&gt; +#ifdef CONFIG_PM<br>
&gt; +static int zx2967_i2c_suspend(struct device *dev)<br>
<br>
</span>Switch to __maybe_unuse.<br>
<span class=3D"gmail-"><br>
&gt; +static int zx2967_i2c_probe(struct platform_device *pdev)<br>
&gt; +{<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct resource *res;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct zx2967_i2c_info *zx_i2c =3D NULL;<b=
r>
<br>
</span>Redundant assignment.<br>
<span class=3D"gmail-"><br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct clk *clk;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0void __iomem *reg_base;<br>
<br>
</span>Reverse tree for all above until top of this function.<br>
<span class=3D"gmail-"><br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret =3D 0;<br>
<br>
</span>Redundant assignment.<br>
<span class=3D"gmail-"><br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0zx_i2c =3D devm_kzalloc(&amp;pdev-&gt;dev,=
 sizeof(*zx_i2c), GFP_KERNEL);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!zx_i2c)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOMEM=
;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0res =3D platform_get_resource(pdev, IORESO=
URCE_MEM, 0);<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!res) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(&amp;p=
dev-&gt;dev, &quot;missing io resource\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL=
;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
<br>
</span>Completely redundant lines of code.<br>
<span class=3D"gmail-"><br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0reg_base =3D devm_ioremap_resource(&amp;pd=
ev-&gt;<wbr>dev, res);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (IS_ERR(reg_base))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return PTR_ERR=
(reg_base);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0clk =3D devm_clk_get(&amp;pdev-&gt;dev, NU=
LL);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (IS_ERR(clk)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(&amp;p=
dev-&gt;dev, &quot;missing controller clock&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return PTR_ERR=
(clk);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D clk_prepare_enable(clk);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(&amp;p=
dev-&gt;dev, &quot;failed to enable i2c_clk\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0of_property_read_u32(pdev-&gt;<wbr>dev.of_=
node,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0&quot;clock-frequency&quot;, &amp;zx_i2c-&gt;clk_freq);<br>
<br>
</span>devce_property_read_uXX();<br>
<span class=3D"gmail-"><br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0zx_i2c-&gt;reg_base =3D reg_base;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0zx_i2c-&gt;clk =3D clk;<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0zx_i2c-&gt;irq =3D platform_get_irq(pdev, =
0);<br>
<br>
</span>Is this optional?<br>
Otherwise has to be checked.<br>
<div><div class=3D"gmail-h5"><br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0zx_i2c-&gt;id =3D pdev-&gt;id;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0zx_i2c-&gt;dev =3D &amp;pdev-&gt;dev;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0zx_i2c-&gt;pin_scl =3D devm_pinctrl_get_se=
lect(&amp;pdev-<wbr>&gt;dev, &quot;scl&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (IS_ERR(zx_i2c-&gt;pin_scl))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_info(&amp;=
pdev-&gt;dev, &quot;scl pin is not specified in dts\n&quot;);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0zx_i2c-&gt;pin_sda =3D devm_pinctrl_get_se=
lect(&amp;pdev-<wbr>&gt;dev, &quot;sda&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (IS_ERR(zx_i2c-&gt;pin_sda))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_info(&amp;=
pdev-&gt;dev, &quot;sda pin is not specified in dts\n&quot;);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0spin_lock_init(&amp;zx_i2c-&gt;lock);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0init_completion(&amp;zx_i2c-&gt;<wbr>compl=
ete);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0platform_set_drvdata(pdev, zx_i2c);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D zx2967_i2c_reset_hardware(zx_<wbr>=
i2c);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(&amp;p=
dev-&gt;dev, &quot;failed to initialize i2c controller\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto unprepare=
_clk;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D devm_request_irq(&amp;pdev-&gt;dev=
, zx_i2c-&gt;irq,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0zx2967_i2c_isr, 0, dev_name(&amp;pdev-&gt;dev), zx_i2c);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(&amp;p=
dev-&gt;dev, &quot;failed to request irq %i\n&quot;, zx_i2c-&gt;irq);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto unprepare=
_clk;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0i2c_set_adapdata(&amp;zx_i2c-&gt;<wbr>adap=
, zx_i2c);<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0zx_i2c-&gt;adap.owner =3D THIS_MODULE;<br>
<br>
</div></div>Do you need this?<br>
<span class=3D"gmail-"><br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0zx_i2c-&gt;adap.class =3D I2C_CLASS_DEPREC=
ATED;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0strlcpy(zx_i2c-&gt;<a href=3D"http://adap.=
name" rel=3D"noreferrer" target=3D"_blank">adap.name</a>, &quot;zx2967 i2c =
adapter&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sizeof(zx_i2c-=
&gt;<a href=3D"http://adap.name" rel=3D"noreferrer" target=3D"_blank">adap.=
name</a>));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0zx_i2c-&gt;adap.algo =3D &amp;zx2967_i2c_a=
lgo;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0zx_i2c-&gt;adap.dev.parent =3D &amp;pdev-&=
gt;dev;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0zx_i2c-&gt;<a href=3D"http://adap.nr" rel=
=3D"noreferrer" target=3D"_blank">adap.nr</a> =3D pdev-&gt;id;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0zx_i2c-&gt;adap.dev.of_node =3D pdev-&gt;d=
ev.of_node;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D i2c_add_numbered_adapter(&amp;zx_<=
wbr>i2c-&gt;adap);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(&amp;p=
dev-&gt;dev, &quot;failed to add zx2967 i2c adapter\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto unprepare=
_clk;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +<br>
&gt; +unprepare_clk:<br>
<br>
</span>err_clk_unprepare:<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0clk_unprepare(zx_i2c-&gt;clk);<br>
<br>
Perhaps clk_disable_unprepare();<br>
<span class=3D"gmail-"><br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int zx2967_i2c_remove(struct platform_device *pdev)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct zx2967_i2c_info *zx_i2c =3D platfor=
m_get_drvdata(pdev);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0i2c_del_adapter(&amp;zx_i2c-&gt;adap)<wbr>=
;<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0clk_unprepare(zx_i2c-&gt;clk);<br>
<br>
</span>Ditto.<br>
<span class=3D"gmail-"><br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +}<br>
<br>
</span><span class=3D"gmail-">&gt; +MODULE_AUTHOR(&quot;Baoyou Xie &lt;<a h=
ref=3D"mailto:baoyou.xie@linaro.org">baoyou.xie@linaro.org</a>&gt;&quot;);<=
br>
&gt; +MODULE_DESCRIPTION(&quot;ZTE zx2967 I2C Bus Controller driver&quot;);=
<br>
&gt; +MODULE_LICENSE(&quot;GPL v2&quot;);<br>
<br>
</span>When bool in Kconfig this all redundant.<br>
<span class=3D"gmail-HOEnZb"><font color=3D"#888888"><br>
--<br>
With Best Regards,<br>
Andy Shevchenko<br>
</font></span></blockquote></div><br></div></div>

--001a1140b0fa9baa4d0546ac1d56--
