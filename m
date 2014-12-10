Return-Path: <varkabhadram@gmail.com>
MIME-Version: 1.0
In-Reply-To: <5487A4C9.2000604@broadcom.com>
References: <rjui@broadcom.com>
	<1418172891-19441-1-git-send-email-rjui@broadcom.com>
	<1418172891-19441-3-git-send-email-rjui@broadcom.com>
	<5487A2D6.8070901@gmail.com>
	<5487A4C9.2000604@broadcom.com>
Date: Wed, 10 Dec 2014 08:51:48 +0530
Message-ID: <CAEUmHyZ+VqjzL4LkQozGJtnictPNXHYWM2qMKvD=LmfQdcT8iQ@mail.gmail.com>
Subject: Re: [PATCH 2/4] i2c: iproc: Add Broadcom iProc I2C Driver
From: Varka Bhadram <varkabhadram@gmail.com>
Content-Type: multipart/alternative; boundary=001a11c33fccf9cab20509d428f3
To: Ray Jui <rjui@broadcom.com>
Cc: Wolfram Sang <wsa@the-dreams.de>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Grant Likely <grant.likely@linaro.org>, Christian Daudt <bcm@fixthebug.org>, Matt Porter <mporter@linaro.org>, Florian Fainelli <f.fainelli@gmail.com>, Russell King <linux@arm.linux.org.uk>, Scott Branden <sbranden@broadcom.com>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, bcm-kernel-feedback-list@broadcom.com, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

--001a11c33fccf9cab20509d428f3
Content-Type: text/plain; charset=UTF-8

On Wed, Dec 10, 2014 at 7:11 AM, Ray Jui <rjui@broadcom.com> wrote:

>
>
> On 12/9/2014 5:33 PM, Varka Bhadram wrote:
>
>>
>> On Wednesday 10 December 2014 06:24 AM, Ray Jui wrote:
>>
>>> Add initial support to the Broadcom iProc I2C controller found in the
>>> iProc family of SoCs.
>>>
>>> The iProc I2C controller has separate internal TX and RX FIFOs, each has
>>> a size of 64 bytes. The iProc I2C controller supports two bus speeds
>>> including standard mode (100kHz) and fast mode (400kHz)
>>>
>>> Signed-off-by: Ray Jui <rjui@broadcom.com>
>>> Reviewed-by: Scott Branden <sbranden@broadcom.com>
>>> ---
>>>   drivers/i2c/busses/Kconfig         |    9 +
>>>   drivers/i2c/busses/Makefile        |    1 +
>>>   drivers/i2c/busses/i2c-bcm-iproc.c |  503
>>> ++++++++++++++++++++++++++++++++++++
>>>   3 files changed, 513 insertions(+)
>>>   create mode 100644 drivers/i2c/busses/i2c-bcm-iproc.c
>>>
>>> (...)

> +static int bcm_iproc_i2c_xfer_single_msg(struct bcm_iproc_i2c_dev *dev,
>>> +        struct i2c_msg *msg)
>>> +{
>>>
>>
>> dto...
>>
>>  One more indent? Sure.
>
> Yes...
 static int bcm_iproc_i2c_xfer_single_msg(struct bcm_iproc_i2c_dev *dev,
                                          struct i2c_msg *msg)

>
>  +    int ret, i;
>>> +    u8 addr;
>>> +    u32 val;
>>> +    unsigned long time_left = msecs_to_jiffies(I2C_TIMEOUT_MESC);
>>> +
>>> +    if (msg->len < 1 || msg->len > M_TX_RX_FIFO_SIZE - 1) {
>>> +        dev_err(dev->device,
>>> +            "supported data length is 1 - %u bytes\n",
>>> +                M_TX_RX_FIFO_SIZE - 1);
>>> +        return -EINVAL;
>>> +    }
>>> +
>>> +    dev->msg = msg;
>>> +    ret = __wait_for_bus_idle(dev);
>>> +    if (ret)
>>> +        return ret;
>>> +
>>> +    ret = bcm_iproc_i2c_format_addr(dev, msg, &addr);
>>> +    if (ret)
>>> +        return ret;
>>> +
>>> +    /* load slave address into the TX FIFO */
>>> +    writel(addr, dev->base + M_TX_OFFSET);
>>> +
>>> +    /* for a write transaction, load data into the TX FIFO */
>>> +    if (!(msg->flags & I2C_M_RD)) {
>>> +        for (i = 0; i < msg->len; i++) {
>>> +            val = msg->buf[i];
>>> +
>>> +            /* mark the last byte */
>>> +            if (i == msg->len - 1)
>>> +                val |= 1 << M_TX_WR_STATUS_SHIFT;
>>> +
>>> +            writel(val, dev->base + M_TX_OFFSET);
>>> +        }
>>> +    }
>>> +
>>> +    /* mark as incomplete before starting the transaction */
>>> +    reinit_completion(&dev->done);
>>> +
>>> +    /*
>>> +     * Enable the "start busy" interrupt, which will be triggered after
>>> +     * the transaction is done
>>> +     */
>>> +    writel(1 << IE_M_START_BUSY_SHIFT, dev->base + IE_OFFSET);
>>> +
>>> +    /*
>>> +     * Now we can activate the transfer. For a read operation,
>>> specify the
>>> +     * number of bytes to read
>>> +     */
>>> +    val = 1 << M_CMD_START_BUSY_SHIFT;
>>> +    if (msg->flags & I2C_M_RD) {
>>> +        val |= (M_CMD_PROTOCOL_BLK_RD << M_CMD_PROTOCOL_SHIFT) |
>>> +            (msg->len << M_CMD_RD_CNT_SHIFT);
>>> +    } else {
>>> +        val |= (M_CMD_PROTOCOL_BLK_WR << M_CMD_PROTOCOL_SHIFT);
>>> +    }
>>> +    writel(val, dev->base + M_CMD_OFFSET);
>>> +
>>> +    time_left = wait_for_completion_timeout(&dev->done, time_left);
>>> +
>>> +    /* disable all interrupts */
>>> +    writel(0, dev->base + IE_OFFSET);
>>> +
>>> +    if (!time_left) {
>>> +        dev_err(dev->device, "transaction times out\n");
>>> +
>>> +        /* flush FIFOs */
>>> +        val = (1 << M_FIFO_RX_FLUSH_SHIFT) |
>>> +            (1 << M_FIFO_TX_FLUSH_SHIFT);
>>> +        writel(val, dev->base + M_FIFO_CTRL_OFFSET);
>>> +        return -EREMOTEIO;
>>> +    }
>>> +
>>> +    ret = bcm_iproc_i2c_check_status(dev);
>>> +    if (ret) {
>>> +        /* flush both TX/RX FIFOs */
>>> +        val = (1 << M_FIFO_RX_FLUSH_SHIFT) |
>>> +            (1 << M_FIFO_TX_FLUSH_SHIFT);
>>> +        writel(val, dev->base + M_FIFO_CTRL_OFFSET);
>>> +        return ret;
>>> +    }
>>> +
>>> +    /*
>>> +     * For a read operation, we now need to load the data from FIFO
>>> +     * into the memory buffer
>>> +     */
>>> +    if (msg->flags & I2C_M_RD) {
>>> +        for (i = 0; i < msg->len; i++) {
>>> +            msg->buf[i] = (readl(dev->base + M_RX_OFFSET) >>
>>> +                    M_RX_DATA_SHIFT) & M_RX_DATA_MASK;
>>> +        }
>>> +    }
>>> +
>>> +    dev_dbg(dev->device, "xfer %c, addr=0x%02x, len=%d\n",
>>> +            (msg->flags & I2C_M_RD) ? 'R' : 'W', msg->addr,
>>> +            msg->len);
>>> +    dev_dbg(dev->device, "**** data start ****\n");
>>> +    for (i = 0; i < msg->len; i++)
>>> +        dev_dbg(dev->device, "0x%02x ",  msg->buf[i]);
>>> +    dev_dbg(dev->device, "**** data end ****\n");
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +static int bcm_iproc_i2c_xfer(struct i2c_adapter *adapter,
>>> +                 struct i2c_msg msgs[], int num)
>>> +{
>>> +    struct bcm_iproc_i2c_dev *dev = i2c_get_adapdata(adapter);
>>> +    int ret, i;
>>> +
>>> +    /* go through all messages */
>>> +    for (i = 0; i < num; i++) {
>>> +        ret = bcm_iproc_i2c_xfer_single_msg(dev, &msgs[i]);
>>> +        if (ret) {
>>> +            dev_err(dev->device, "xfer failed\n");
>>> +            return ret;
>>> +        }
>>> +    }
>>> +
>>> +    return num;
>>> +}
>>> +
>>> +static uint32_t bcm_iproc_i2c_functionality(struct i2c_adapter *adap)
>>> +{
>>> +    return I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL;
>>> +}
>>> +
>>> +static const struct i2c_algorithm bcm_iproc_algo = {
>>> +    .master_xfer = bcm_iproc_i2c_xfer,
>>> +    .functionality = bcm_iproc_i2c_functionality,
>>> +};
>>> +
>>> +static int bcm_iproc_i2c_cfg_speed(struct bcm_iproc_i2c_dev *dev)
>>> +{
>>> +    unsigned int bus_speed, speed_bit;
>>> +    u32 val;
>>> +    int ret = of_property_read_u32(dev->device->of_node,
>>> "clock-frequency",
>>> +                       &bus_speed);
>>> +    if (ret < 0) {
>>> +        dev_err(dev->device, "missing clock-frequency property\n");
>>> +        return -ENODEV;
>>> +    }
>>> +
>>> +    switch (bus_speed) {
>>> +    case 100000:
>>> +        speed_bit = 0;
>>> +        break;
>>> +    case 400000:
>>> +        speed_bit = 1;
>>> +        break;
>>> +    default:
>>> +        dev_err(dev->device, "%d Hz bus speed not supported\n",
>>> +                bus_speed);
>>> +        dev_err(dev->device, "valid speeds are 100khz and 400khz\n");
>>> +        return -EINVAL;
>>> +    }
>>> +
>>> +    val = readl(dev->base + TIM_CFG_OFFSET);
>>> +    val &= ~(1 << TIME_CFG_MODE_400_SHIFT);
>>> +    val |= speed_bit << TIME_CFG_MODE_400_SHIFT;
>>> +    writel(val, dev->base + TIM_CFG_OFFSET);
>>> +
>>> +    dev_info(dev->device, "bus set to %u Hz\n", bus_speed);
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +static int bcm_iproc_i2c_init(struct bcm_iproc_i2c_dev *dev)
>>> +{
>>> +    u32 val;
>>> +
>>> +    /* put controller in reset */
>>> +    val = readl(dev->base + CFG_OFFSET);
>>> +    val |= 1 << CFG_RESET_SHIFT;
>>> +    val &= ~(1 << CFG_EN_SHIFT);
>>> +    writel(val, dev->base + CFG_OFFSET);
>>> +
>>> +    /* wait 100 usec per spec */
>>> +    udelay(100);
>>> +
>>> +    /* bring controller out of reset */
>>> +    val = readl(dev->base + CFG_OFFSET);
>>> +    val &= ~(1 << CFG_RESET_SHIFT);
>>> +    writel(val, dev->base + CFG_OFFSET);
>>> +
>>> +    /* flush TX/RX FIFOs and set RX FIFO threshold to zero */
>>> +    val = (1 << M_FIFO_RX_FLUSH_SHIFT) | (1 << M_FIFO_TX_FLUSH_SHIFT);
>>> +    writel(val, dev->base + M_FIFO_CTRL_OFFSET);
>>> +
>>> +    /* disable all interrupts */
>>> +    val = 0;
>>> +    writel(val, dev->base + IE_OFFSET);
>>> +
>>> +    /* clear all pending interrupts */
>>> +    val = readl(dev->base + IS_OFFSET);
>>> +    writel(val, dev->base + IS_OFFSET);
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +static void bcm_iproc_i2c_enable(struct bcm_iproc_i2c_dev *dev)
>>> +{
>>> +    u32 val;
>>> +
>>> +    val = readl(dev->base + CFG_OFFSET);
>>> +    val |= 1 << CFG_EN_SHIFT;
>>> +    writel(val, dev->base + CFG_OFFSET);
>>> +}
>>> +
>>> +static void bcm_iproc_i2c_disable(struct bcm_iproc_i2c_dev *dev)
>>> +{
>>> +    u32 val;
>>> +
>>> +    val = readl(dev->base + CFG_OFFSET);
>>> +    val &= ~(1 << CFG_EN_SHIFT);
>>> +    writel(val, dev->base + CFG_OFFSET);
>>> +}
>>> +
>>> +static int bcm_iproc_i2c_probe(struct platform_device *pdev)
>>> +{
>>> +    int irq, ret = 0;
>>> +    struct bcm_iproc_i2c_dev *dev;
>>> +    struct i2c_adapter *adap;
>>> +    struct resource *res;
>>> +
>>> +    dev = devm_kzalloc(&pdev->dev, sizeof(*dev), GFP_KERNEL);
>>> +    if (!dev)
>>> +        return -ENOMEM;
>>> +
>>> +    platform_set_drvdata(pdev, dev);
>>> +    dev->device = &pdev->dev;
>>> +    init_completion(&dev->done);
>>> +
>>> +    res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>>> +    if (!res)
>>> +        return -ENODEV;
>>>
>>
>> We can remove this resource check. This checking will happen with
>> devm_ioremap_resource()
>>
>>  Don't you need to obtain a valid resource and pass it into
> devm_ioremap_resource? Without 'res' being assigned a valid resource,
> devm_ioremap_resource will reject with "invalid resource".
>
>   platform_get_resource() will return a resource, checking on this
resource is happening at
http://lxr.free-electrons.com/source/lib/devres.c#L115. So no need to check
it explicitly.

If you check here it will be duplication of check with resource. Two times
we are checking on
the resource. No point of doing like that.

Thanks.

--001a11c33fccf9cab20509d428f3
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Wed, Dec 10, 2014 at 7:11 AM, Ray Jui <span dir=3D"ltr">&lt;<a href=
=3D"mailto:rjui@broadcom.com" target=3D"_blank">rjui@broadcom.com</a>&gt;</=
span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div clas=
s=3D""><div class=3D"h5"><br>
<br>
On 12/9/2014 5:33 PM, Varka Bhadram wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
On Wednesday 10 December 2014 06:24 AM, Ray Jui wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">
Add initial support to the Broadcom iProc I2C controller found in the<br>
iProc family of SoCs.<br>
<br>
The iProc I2C controller has separate internal TX and RX FIFOs, each has<br=
>
a size of 64 bytes. The iProc I2C controller supports two bus speeds<br>
including standard mode (100kHz) and fast mode (400kHz)<br>
<br>
Signed-off-by: Ray Jui &lt;<a href=3D"mailto:rjui@broadcom.com" target=3D"_=
blank">rjui@broadcom.com</a>&gt;<br>
Reviewed-by: Scott Branden &lt;<a href=3D"mailto:sbranden@broadcom.com" tar=
get=3D"_blank">sbranden@broadcom.com</a>&gt;<br>
---<br>
=C2=A0 drivers/i2c/busses/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =
=C2=A0 9 +<br>
=C2=A0 drivers/i2c/busses/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=
=A0 1 +<br>
=C2=A0 drivers/i2c/busses/i2c-bcm-iproc.c |=C2=A0 503<br>
++++++++++++++++++++++++++++++++++++<br>
=C2=A0 3 files changed, 513 insertions(+)<br>
=C2=A0 create mode 100644 drivers/i2c/busses/i2c-bcm-iproc.c<br>
<br></blockquote></blockquote></div></div></blockquote><div><span style=3D"=
font-family:monospace">(...) </span><br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex"><div class=3D""><div class=3D"h5"><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex"><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">
+static int bcm_iproc_i2c_xfer_single_msg(struct bcm_iproc_i2c_dev *dev,<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct i2c_msg *msg)<br>
+{<br>
</blockquote></blockquote></div></div><div><div class=3D"h5"><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">
<br>
dto...<br>
<br>
</blockquote></div></div>
One more indent? Sure.<div><div class=3D"h5"><br></div></div></blockquote><=
div><span style=3D"font-family:monospace">Yes... <br></span></div><div><spa=
n style=3D"font-family:monospace">=C2=A0static int bcm_iproc_i2c_xfer_singl=
e_msg(struct bcm_iproc_i2c_dev *dev,<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct i2c_=
msg *msg)</span></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><di=
v><div class=3D"h5">
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex"><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">
+=C2=A0 =C2=A0 int ret, i;<br>
+=C2=A0 =C2=A0 u8 addr;<br>
+=C2=A0 =C2=A0 u32 val;<br>
+=C2=A0 =C2=A0 unsigned long time_left =3D msecs_to_jiffies(I2C_TIMEOUT_<u>=
</u>MESC);<br>
+<br>
+=C2=A0 =C2=A0 if (msg-&gt;len &lt; 1 || msg-&gt;len &gt; M_TX_RX_FIFO_SIZE=
 - 1) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 dev_err(dev-&gt;device,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;supported data length is 1=
 - %u bytes\n&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 M_TX_RX_FIFO_SIZE =
- 1);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EINVAL;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 dev-&gt;msg =3D msg;<br>
+=C2=A0 =C2=A0 ret =3D __wait_for_bus_idle(dev);<br>
+=C2=A0 =C2=A0 if (ret)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return ret;<br>
+<br>
+=C2=A0 =C2=A0 ret =3D bcm_iproc_i2c_format_addr(dev, msg, &amp;addr);<br>
+=C2=A0 =C2=A0 if (ret)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return ret;<br>
+<br>
+=C2=A0 =C2=A0 /* load slave address into the TX FIFO */<br>
+=C2=A0 =C2=A0 writel(addr, dev-&gt;base + M_TX_OFFSET);<br>
+<br>
+=C2=A0 =C2=A0 /* for a write transaction, load data into the TX FIFO */<br=
>
+=C2=A0 =C2=A0 if (!(msg-&gt;flags &amp; I2C_M_RD)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 for (i =3D 0; i &lt; msg-&gt;len; i++) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 val =3D msg-&gt;buf[i];<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* mark the last byte */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (i =3D=3D msg-&gt;len - 1)<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 val |=3D 1 &lt;&lt=
; M_TX_WR_STATUS_SHIFT;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 writel(val, dev-&gt;base + M_TX_=
OFFSET);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 /* mark as incomplete before starting the transaction */<br>
+=C2=A0 =C2=A0 reinit_completion(&amp;dev-&gt;done);<br>
+<br>
+=C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0* Enable the &quot;start busy&quot; interrupt, which w=
ill be triggered after<br>
+=C2=A0 =C2=A0 =C2=A0* the transaction is done<br>
+=C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 writel(1 &lt;&lt; IE_M_START_BUSY_SHIFT, dev-&gt;base + IE_O=
FFSET);<br>
+<br>
+=C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0* Now we can activate the transfer. For a read operati=
on,<br>
specify the<br>
+=C2=A0 =C2=A0 =C2=A0* number of bytes to read<br>
+=C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 val =3D 1 &lt;&lt; M_CMD_START_BUSY_SHIFT;<br>
+=C2=A0 =C2=A0 if (msg-&gt;flags &amp; I2C_M_RD) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 val |=3D (M_CMD_PROTOCOL_BLK_RD &lt;&lt; M_CMD=
_PROTOCOL_SHIFT) |<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (msg-&gt;len &lt;&lt; M_CMD_RD_C=
NT_SHIFT);<br>
+=C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 val |=3D (M_CMD_PROTOCOL_BLK_WR &lt;&lt; M_CMD=
_PROTOCOL_SHIFT);<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 writel(val, dev-&gt;base + M_CMD_OFFSET);<br>
+<br>
+=C2=A0 =C2=A0 time_left =3D wait_for_completion_timeout(&amp;<u></u>dev-&g=
t;done, time_left);<br>
+<br>
+=C2=A0 =C2=A0 /* disable all interrupts */<br>
+=C2=A0 =C2=A0 writel(0, dev-&gt;base + IE_OFFSET);<br>
+<br>
+=C2=A0 =C2=A0 if (!time_left) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 dev_err(dev-&gt;device, &quot;transaction time=
s out\n&quot;);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* flush FIFOs */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 val =3D (1 &lt;&lt; M_FIFO_RX_FLUSH_SHIFT) |<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (1 &lt;&lt; M_FIFO_TX_FLUSH_SHIF=
T);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 writel(val, dev-&gt;base + M_FIFO_CTRL_OFFSET)=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EREMOTEIO;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 ret =3D bcm_iproc_i2c_check_status(<u></u>dev);<br>
+=C2=A0 =C2=A0 if (ret) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* flush both TX/RX FIFOs */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 val =3D (1 &lt;&lt; M_FIFO_RX_FLUSH_SHIFT) |<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (1 &lt;&lt; M_FIFO_TX_FLUSH_SHIF=
T);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 writel(val, dev-&gt;base + M_FIFO_CTRL_OFFSET)=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return ret;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0* For a read operation, we now need to load the data f=
rom FIFO<br>
+=C2=A0 =C2=A0 =C2=A0* into the memory buffer<br>
+=C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 if (msg-&gt;flags &amp; I2C_M_RD) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 for (i =3D 0; i &lt; msg-&gt;len; i++) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 msg-&gt;buf[i] =3D (readl(dev-&g=
t;base + M_RX_OFFSET) &gt;&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 M_RX=
_DATA_SHIFT) &amp; M_RX_DATA_MASK;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 dev_dbg(dev-&gt;device, &quot;xfer %c, addr=3D0x%02x, len=3D=
%d\n&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (msg-&gt;flags &amp; I2C_M_RD) ?=
 &#39;R&#39; : &#39;W&#39;, msg-&gt;addr,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 msg-&gt;len);<br>
+=C2=A0 =C2=A0 dev_dbg(dev-&gt;device, &quot;**** data start ****\n&quot;);=
<br>
+=C2=A0 =C2=A0 for (i =3D 0; i &lt; msg-&gt;len; i++)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 dev_dbg(dev-&gt;device, &quot;0x%02x &quot;,=
=C2=A0 msg-&gt;buf[i]);<br>
+=C2=A0 =C2=A0 dev_dbg(dev-&gt;device, &quot;**** data end ****\n&quot;);<b=
r>
+<br>
+=C2=A0 =C2=A0 return 0;<br>
+}<br>
+<br>
+static int bcm_iproc_i2c_xfer(struct i2c_adapter *adapter,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct i2c_m=
sg msgs[], int num)<br>
+{<br>
+=C2=A0 =C2=A0 struct bcm_iproc_i2c_dev *dev =3D i2c_get_adapdata(adapter);=
<br>
+=C2=A0 =C2=A0 int ret, i;<br>
+<br>
+=C2=A0 =C2=A0 /* go through all messages */<br>
+=C2=A0 =C2=A0 for (i =3D 0; i &lt; num; i++) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D bcm_iproc_i2c_xfer_single_msg(<u></u>d=
ev, &amp;msgs[i]);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dev_err(dev-&gt;device, &quot;xf=
er failed\n&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return ret;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 return num;<br>
+}<br>
+<br>
+static uint32_t bcm_iproc_i2c_functionality(<u></u>struct i2c_adapter *ada=
p)<br>
+{<br>
+=C2=A0 =C2=A0 return I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL;<br>
+}<br>
+<br>
+static const struct i2c_algorithm bcm_iproc_algo =3D {<br>
+=C2=A0 =C2=A0 .master_xfer =3D bcm_iproc_i2c_xfer,<br>
+=C2=A0 =C2=A0 .functionality =3D bcm_iproc_i2c_functionality,<br>
+};<br>
+<br>
+static int bcm_iproc_i2c_cfg_speed(struct bcm_iproc_i2c_dev *dev)<br>
+{<br>
+=C2=A0 =C2=A0 unsigned int bus_speed, speed_bit;<br>
+=C2=A0 =C2=A0 u32 val;<br>
+=C2=A0 =C2=A0 int ret =3D of_property_read_u32(dev-&gt;<u></u>device-&gt;o=
f_node,<br>
&quot;clock-frequency&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&amp;bus_speed);<br>
+=C2=A0 =C2=A0 if (ret &lt; 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 dev_err(dev-&gt;device, &quot;missing clock-fr=
equency property\n&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -ENODEV;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 switch (bus_speed) {<br>
+=C2=A0 =C2=A0 case 100000:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 speed_bit =3D 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 case 400000:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 speed_bit =3D 1;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 default:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 dev_err(dev-&gt;device, &quot;%d Hz bus speed =
not supported\n&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bus_speed);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 dev_err(dev-&gt;device, &quot;valid speeds are=
 100khz and 400khz\n&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EINVAL;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 val =3D readl(dev-&gt;base + TIM_CFG_OFFSET);<br>
+=C2=A0 =C2=A0 val &amp;=3D ~(1 &lt;&lt; TIME_CFG_MODE_400_SHIFT);<br>
+=C2=A0 =C2=A0 val |=3D speed_bit &lt;&lt; TIME_CFG_MODE_400_SHIFT;<br>
+=C2=A0 =C2=A0 writel(val, dev-&gt;base + TIM_CFG_OFFSET);<br>
+<br>
+=C2=A0 =C2=A0 dev_info(dev-&gt;device, &quot;bus set to %u Hz\n&quot;, bus=
_speed);<br>
+<br>
+=C2=A0 =C2=A0 return 0;<br>
+}<br>
+<br>
+static int bcm_iproc_i2c_init(struct bcm_iproc_i2c_dev *dev)<br>
+{<br>
+=C2=A0 =C2=A0 u32 val;<br>
+<br>
+=C2=A0 =C2=A0 /* put controller in reset */<br>
+=C2=A0 =C2=A0 val =3D readl(dev-&gt;base + CFG_OFFSET);<br>
+=C2=A0 =C2=A0 val |=3D 1 &lt;&lt; CFG_RESET_SHIFT;<br>
+=C2=A0 =C2=A0 val &amp;=3D ~(1 &lt;&lt; CFG_EN_SHIFT);<br>
+=C2=A0 =C2=A0 writel(val, dev-&gt;base + CFG_OFFSET);<br>
+<br>
+=C2=A0 =C2=A0 /* wait 100 usec per spec */<br>
+=C2=A0 =C2=A0 udelay(100);<br>
+<br>
+=C2=A0 =C2=A0 /* bring controller out of reset */<br>
+=C2=A0 =C2=A0 val =3D readl(dev-&gt;base + CFG_OFFSET);<br>
+=C2=A0 =C2=A0 val &amp;=3D ~(1 &lt;&lt; CFG_RESET_SHIFT);<br>
+=C2=A0 =C2=A0 writel(val, dev-&gt;base + CFG_OFFSET);<br>
+<br>
+=C2=A0 =C2=A0 /* flush TX/RX FIFOs and set RX FIFO threshold to zero */<br=
>
+=C2=A0 =C2=A0 val =3D (1 &lt;&lt; M_FIFO_RX_FLUSH_SHIFT) | (1 &lt;&lt; M_F=
IFO_TX_FLUSH_SHIFT);<br>
+=C2=A0 =C2=A0 writel(val, dev-&gt;base + M_FIFO_CTRL_OFFSET);<br>
+<br>
+=C2=A0 =C2=A0 /* disable all interrupts */<br>
+=C2=A0 =C2=A0 val =3D 0;<br>
+=C2=A0 =C2=A0 writel(val, dev-&gt;base + IE_OFFSET);<br>
+<br>
+=C2=A0 =C2=A0 /* clear all pending interrupts */<br>
+=C2=A0 =C2=A0 val =3D readl(dev-&gt;base + IS_OFFSET);<br>
+=C2=A0 =C2=A0 writel(val, dev-&gt;base + IS_OFFSET);<br>
+<br>
+=C2=A0 =C2=A0 return 0;<br>
+}<br>
+<br>
+static void bcm_iproc_i2c_enable(struct bcm_iproc_i2c_dev *dev)<br>
+{<br>
+=C2=A0 =C2=A0 u32 val;<br>
+<br>
+=C2=A0 =C2=A0 val =3D readl(dev-&gt;base + CFG_OFFSET);<br>
+=C2=A0 =C2=A0 val |=3D 1 &lt;&lt; CFG_EN_SHIFT;<br>
+=C2=A0 =C2=A0 writel(val, dev-&gt;base + CFG_OFFSET);<br>
+}<br>
+<br>
+static void bcm_iproc_i2c_disable(struct bcm_iproc_i2c_dev *dev)<br>
+{<br>
+=C2=A0 =C2=A0 u32 val;<br>
+<br>
+=C2=A0 =C2=A0 val =3D readl(dev-&gt;base + CFG_OFFSET);<br>
+=C2=A0 =C2=A0 val &amp;=3D ~(1 &lt;&lt; CFG_EN_SHIFT);<br>
+=C2=A0 =C2=A0 writel(val, dev-&gt;base + CFG_OFFSET);<br>
+}<br>
+<br>
+static int bcm_iproc_i2c_probe(struct platform_device *pdev)<br>
+{<br>
+=C2=A0 =C2=A0 int irq, ret =3D 0;<br>
+=C2=A0 =C2=A0 struct bcm_iproc_i2c_dev *dev;<br>
+=C2=A0 =C2=A0 struct i2c_adapter *adap;<br>
+=C2=A0 =C2=A0 struct resource *res;<br>
+<br>
+=C2=A0 =C2=A0 dev =3D devm_kzalloc(&amp;pdev-&gt;dev, sizeof(*dev), GFP_KE=
RNEL);<br>
+=C2=A0 =C2=A0 if (!dev)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -ENOMEM;<br>
+<br>
+=C2=A0 =C2=A0 platform_set_drvdata(pdev, dev);<br>
+=C2=A0 =C2=A0 dev-&gt;device =3D &amp;pdev-&gt;dev;<br>
+=C2=A0 =C2=A0 init_completion(&amp;dev-&gt;done);<br>
+<br>
+=C2=A0 =C2=A0 res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);<br>
+=C2=A0 =C2=A0 if (!res)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -ENODEV;<br>
</blockquote>
<br>
We can remove this resource check. This checking will happen with<br>
devm_ioremap_resource()<br>
<br>
</blockquote></div></div>
Don&#39;t you need to obtain a valid resource and pass it into devm_ioremap=
_resource? Without &#39;res&#39; being assigned a valid resource, devm_iore=
map_resource will reject with &quot;invalid resource&quot;.<div><div class=
=3D"h5"><br></div></div></blockquote><div>=C2=A0<span style=3D"font-family:=
monospace"> platform_get_resource() will return a resource, checking on thi=
s resource is happening at<br><a href=3D"http://lxr.free-electrons.com/sour=
ce/lib/devres.c#L115">http://lxr.free-electrons.com/source/lib/devres.c#L11=
5</a>. So no need to check it explicitly.<br><br></span></div><div><span st=
yle=3D"font-family:monospace">If you check here it will be duplication of c=
heck with resource. Two times we are checking on<br></span></div><div><span=
 style=3D"font-family:monospace">the resource. No point of doing like that.=
<br><br></span></div><div><span style=3D"font-family:monospace">Thanks. <br=
></span></div></div></div></div>

--001a11c33fccf9cab20509d428f3--
