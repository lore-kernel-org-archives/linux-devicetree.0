Return-Path: <SRS0=vAV8=LK=chromium.org=swboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
From: Stephen Boyd <swboyd@chromium.org>
In-Reply-To: <20180824101635.GO2388@vkoul-mobl>
References: <20180820063953.6866-1-vkoul@kernel.org>
 <20180820063953.6866-3-vkoul@kernel.org>
 <153509585617.28926.14526626631390463379@swboyd.mtv.corp.google.com>
 <20180824101635.GO2388@vkoul-mobl>
Message-ID: <153539758798.129321.2300393649173468216@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH v4 2/2] i2c: Add Qualcomm CCI I2C driver
Date: Mon, 27 Aug 2018 12:19:47 -0700
To: Vinod <vkoul@kernel.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-i2c@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>, linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, Todor Tomov <todor.tomov@linaro.org>
List-ID: <devicetree@vger.kernel.org>

Quoting Vinod (2018-08-24 03:16:35)
> On 24-08-18, 00:30, Stephen Boyd wrote:
> > Quoting Vinod Koul (2018-08-19 23:39:53)
> > =

> > > +       if (!time) {
> > > +               dev_err(cci->dev, "master %d queue %d timeout\n",
> > > +                       master, queue);
> > > +
> > > +               cci_halt(cci, master);
> > > +
> > > +               return -ETIMEDOUT;
> > > +       }
> > > +
> > > +       ret =3D cci->master[master].status;
> > > +       if (ret < 0)
> > > +               dev_err(cci->dev, "master %d queue %d error %d\n",
> > > +                       master, queue, ret);
> > > +
> > > +       return ret;
> > > +}
> > > +
> > > +static int cci_validate_queue(struct cci *cci, u8 master, u8 queue)
> > > +{
> > > +       u32 val;
> > > +
> > > +       val =3D readl(cci->base + CCI_I2C_Mm_Qn_CUR_WORD_CNT(master, =
queue));
> > > +       if (val =3D=3D cci->data->queue_size[queue])
> > > +               return -EINVAL;
> > > +
> > > +       if (!val)
> > > +               return val;
> > =

> > return 0?
> =

> do you want to make it explicit? both seem to me to do the same thing

Yes, please.

> > =

> > > +               }
> > > +       } while (--words_read);
> > > +
> > > +       return 0;
> > > +}
> > > +
> > > +static int cci_i2c_write(struct cci *cci, u16 master,
> > > +                        u16 addr, u8 *buf, u16 len)
> > > +{
> > > +       u8 queue =3D QUEUE_0;
> > > +       u8 load[12] =3D { 0 };
> > > +       int i =3D 0, j, ret;
> > > +       u32 val;
> > > +
> > > +       /*
> > > +        * Call validate queue to make sure queue is empty before sta=
rting.
> > > +        * This is to avoid overflow / underflow of queue.
> > > +        */
> > > +       ret =3D cci_validate_queue(cci, master, queue);
> > > +       if (ret < 0)
> > > +               return ret;
> > > +
> > > +       val =3D CCI_I2C_SET_PARAM | (addr & 0x7f) << 4;
> > > +       writel(val, cci->base + CCI_I2C_Mm_Qn_LOAD_DATA(master, queue=
));
> > > +
> > > +       load[i++] =3D CCI_I2C_WRITE | len << 4;
> > =

> > Can 'len' really be 16 bits? Because this assignment truncates that very
> > quickly.
> =

> Yes, this is passed from i2c_msg->len which is 16 bytes. But here it
> doesn't support so it is truncated here
> =

> > =

> > > +
> > > +       for (j =3D 0; j < len; j++)
> > =

> > Well I guess len can be at most '11', so maybe the type should be u8
> > instead?
> =

> I can use a local variable and cast to it, but am not sure that helps!

Maybe just a comment indicating that max len is 11?

> =

> > > +               return PTR_ERR(cci->base);
> > > +       }
> > > +
> > > +       /* Interrupt */
> > > +
> > > +       ret =3D platform_get_irq(pdev, 0);
> > > +       if (ret < 0) {
> > > +               dev_err(dev, "missing IRQ: %d\n", ret);
> > > +               return ret;
> > > +       }
> > > +       cci->irq =3D ret;
> > > +
> > > +       ret =3D devm_request_irq(dev, cci->irq, cci_isr,
> > > +                              IRQF_TRIGGER_RISING, dev_name(dev), cc=
i);
> > > +       if (ret < 0) {
> > > +               dev_err(dev, "request_irq failed, ret: %d\n", ret);
> > > +               return ret;
> > > +       }
> > > +
> > > +       disable_irq(cci->irq);
> > =

> > Why? Is the irq always triggering or something?
> =

> I supposed Todor didn't want to enable IRQ until everything is set.
> I could move this block before adding i2c adapter.

But does it actually matter? The interrupt is "enabled" from request to
this function call so it's still possible to trigger. I'd just remove
the irq disabling unless it actually matters.

> =

> > > +static const struct cci_data cci_8916_data =3D {
> > > +       .num_masters =3D 1,
> > > +       .queue_size =3D { 64, 16 },
> > > +       .quirks =3D {
> > > +               .max_write_len =3D 10,
> > > +               .max_read_len =3D 12,
> > > +       },
> > > +       .res =3D {
> > > +               .clock =3D {
> > > +                       "camss_top_ahb",
> > > +                       "cci_ahb",
> > > +                       "camss_ahb",
> > > +                       "cci"
> > =

> > I guess this is another design where you just want to "get all the clks"
> > and not care about what they are?
> =

> Yes that is how this seems to be

Ok. I'm going to merge the "get all the clks" API soon. Maybe you can
use that here.
