Return-Path: <SRS0=jZeC=MC=gmail.com=ricardo.ribalda@kernel.org>
MIME-Version: 1.0
References: <20180820063953.6866-1-vkoul@kernel.org> <20180820063953.6866-3-vkoul@kernel.org>
 <153509585617.28926.14526626631390463379@swboyd.mtv.corp.google.com>
 <20180824101635.GO2388@vkoul-mobl> <153539758798.129321.2300393649173468216@swboyd.mtv.corp.google.com>
 <20180828033851.GA2388@vkoul-mobl>
In-Reply-To: <20180828033851.GA2388@vkoul-mobl>
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date: Thu, 20 Sep 2018 21:39:41 +0200
Message-ID: <CAPybu_0Patmox+1rd19mD03qfSbhNzR+6gmaJwsmhu650s36fA@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] i2c: Add Qualcomm CCI I2C driver
Content-Type: text/plain; charset="UTF-8"
To: Vinod Koul <vkoul@kernel.org>
Cc: swboyd@chromium.org, wsa+renesas@sang-engineering.com, linux-i2c@vger.kernel.org, bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, Todor Tomov <todor.tomov@linaro.org>
List-ID: <devicetree@vger.kernel.org>

Hi

Sorry to enter the discussion this late.

I have been using this driver with release/qcomlt-4.14 on a db820c and
if I try to use the i2c bus before camss is running I get a Timeout
error and the bus is unusable after that. I have sent a patch that
fixes this issue, in case you want to merge it/add it before this
driver goes upstream.

Is there a way to use the i2c bus without using the camera?

Cheers

On Tue, Aug 28, 2018 at 5:39 AM Vinod <vkoul@kernel.org> wrote:
>
> On 27-08-18, 12:19, Stephen Boyd wrote:
> > Quoting Vinod (2018-08-24 03:16:35)
> > > On 24-08-18, 00:30, Stephen Boyd wrote:
> > > > Quoting Vinod Koul (2018-08-19 23:39:53)
>
> > > > > +static int cci_i2c_write(struct cci *cci, u16 master,
> > > > > +                        u16 addr, u8 *buf, u16 len)
> > > > > +{
> > > > > +       u8 queue = QUEUE_0;
> > > > > +       u8 load[12] = { 0 };
> > > > > +       int i = 0, j, ret;
> > > > > +       u32 val;
> > > > > +
> > > > > +       /*
> > > > > +        * Call validate queue to make sure queue is empty before starting.
> > > > > +        * This is to avoid overflow / underflow of queue.
> > > > > +        */
> > > > > +       ret = cci_validate_queue(cci, master, queue);
> > > > > +       if (ret < 0)
> > > > > +               return ret;
> > > > > +
> > > > > +       val = CCI_I2C_SET_PARAM | (addr & 0x7f) << 4;
> > > > > +       writel(val, cci->base + CCI_I2C_Mm_Qn_LOAD_DATA(master, queue));
> > > > > +
> > > > > +       load[i++] = CCI_I2C_WRITE | len << 4;
> > > >
> > > > Can 'len' really be 16 bits? Because this assignment truncates that very
> > > > quickly.
> > >
> > > Yes, this is passed from i2c_msg->len which is 16 bytes. But here it
> > > doesn't support so it is truncated here
> > >
> > > >
> > > > > +
> > > > > +       for (j = 0; j < len; j++)
> > > >
> > > > Well I guess len can be at most '11', so maybe the type should be u8
> > > > instead?
> > >
> > > I can use a local variable and cast to it, but am not sure that helps!
> >
> > Maybe just a comment indicating that max len is 11?
>
> Sure, will add
>
> > > > > +               return PTR_ERR(cci->base);
> > > > > +       }
> > > > > +
> > > > > +       /* Interrupt */
> > > > > +
> > > > > +       ret = platform_get_irq(pdev, 0);
> > > > > +       if (ret < 0) {
> > > > > +               dev_err(dev, "missing IRQ: %d\n", ret);
> > > > > +               return ret;
> > > > > +       }
> > > > > +       cci->irq = ret;
> > > > > +
> > > > > +       ret = devm_request_irq(dev, cci->irq, cci_isr,
> > > > > +                              IRQF_TRIGGER_RISING, dev_name(dev), cci);
> > > > > +       if (ret < 0) {
> > > > > +               dev_err(dev, "request_irq failed, ret: %d\n", ret);
> > > > > +               return ret;
> > > > > +       }
> > > > > +
> > > > > +       disable_irq(cci->irq);
> > > >
> > > > Why? Is the irq always triggering or something?
> > >
> > > I supposed Todor didn't want to enable IRQ until everything is set.
> > > I could move this block before adding i2c adapter.
> >
> > But does it actually matter? The interrupt is "enabled" from request to
> > this function call so it's still possible to trigger. I'd just remove
> > the irq disabling unless it actually matters.
>
> Agreed, will do that
>
> > > > > +static const struct cci_data cci_8916_data = {
> > > > > +       .num_masters = 1,
> > > > > +       .queue_size = { 64, 16 },
> > > > > +       .quirks = {
> > > > > +               .max_write_len = 10,
> > > > > +               .max_read_len = 12,
> > > > > +       },
> > > > > +       .res = {
> > > > > +               .clock = {
> > > > > +                       "camss_top_ahb",
> > > > > +                       "cci_ahb",
> > > > > +                       "camss_ahb",
> > > > > +                       "cci"
> > > >
> > > > I guess this is another design where you just want to "get all the clks"
> > > > and not care about what they are?
> > >
> > > Yes that is how this seems to be
> >
> > Ok. I'm going to merge the "get all the clks" API soon. Maybe you can
> > use that here.
>
> Sure, once merged I will send a patch for this driver, which I guess
> would be after next merge window..
>
> --
> ~Vinod



-- 
Ricardo Ribalda
