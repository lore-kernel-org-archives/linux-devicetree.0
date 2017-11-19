From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/2] iio: light: add support to UVIS25 sensor
Date: Sun, 19 Nov 2017 16:44:52 +0000
Message-ID: <20171119164452.4f457021@archlinux>
References: <20171025181609.3803-1-lorenzo.bianconi@st.com>
        <20171025181609.3803-2-lorenzo.bianconi@st.com>
        <20171026183540.288dfdea@archlinux>
        <CAA2SeN+WGorb6t52euEnVYOp+R8Mxa0_Y9eeM0qo6=-MsnZ3EQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAA2SeN+WGorb6t52euEnVYOp+R8Mxa0_Y9eeM0qo6=-MsnZ3EQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lorenzo Bianconi <lorenzo.bianconi83-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Lorenzo BIANCONI <lorenzo.bianconi-qxv4g6HH51o@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, 27 Oct 2017 15:26:09 +0200
Lorenzo Bianconi <lorenzo.bianconi83-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> > On Wed, 25 Oct 2017 20:16:08 +0200
> > Lorenzo Bianconi <lorenzo.bianconi83-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> >
> > Really minor English comment to start.
> > add support 'for' UVIS25 sensor
> >  
> 
> Hi Jonathan,
> 
> I added regmap support, thanks for the hint, the code is much better :)
> Just wondering how to manage drdy issue in more elegant way.
> As you outlined, the problem is due to the fact the trigger interrupt
> is currently masked
> but st_uvis25_set_enable() in st_uvis25_read_oneshot() actually
> enables interrupt generation
> so during the msleep() we get tons of interrupts if we configured the
> line as IRQ_TYPE_LEVEL_HIGH.
Can you clear it with a single read at the start of the read_oneshot?

> One possible solution could be to drop trigger support and push data
> to iio buffer directly in main irq thread handler (but in this way we
> are force to use just this kind of trigger).
> What do you think?

Not ideal... It's another case of hardware doing something unhelpful
for software.  We'll have to paper over it as usual ;)

Go with which ever route you think works out nicest.

Sorry for the delay on this reply - I missed your reply on my first
pass through my emails in amongst the other parts of the thread.

> 
> Reagrds,
> Lorenzo
> 
<snip>
> 
> >> +
> >> +     err = hw->tf->read(hw->dev, addr, sizeof(data), &data);
> >> +     if (err < 0) {
> >> +             dev_err(hw->dev, "failed to read %02x register\n", addr);
> >> +             goto unlock;
> >> +     }
> >> +
> >> +     data = (data & ~mask) | ((val << __ffs(mask)) & mask);
> >> +
> >> +     err = hw->tf->write(hw->dev, addr, sizeof(data), &data);
> >> +     if (err < 0)
> >> +             dev_err(hw->dev, "failed to write %02x register\n", addr);
> >> +
> >> +unlock:
> >> +     mutex_unlock(&hw->lock);
> >> +
> >> +     return err < 0 ? err : 0;
> >> +}
> >> +
> >> +int st_uvis25_set_enable(struct st_uvis25_hw *hw, bool enable)
> >> +{
> >> +     int err;
> >> +
> >> +     err = st_uvis25_write_with_mask(hw, ST_UVIS25_REG_CTRL1_ADDR,
> >> +                                     ST_UVIS25_REG_ODR_MASK, enable);
> >> +     if (err < 0)
> >> +             return err;
> >> +
> >> +     hw->enabled = enable;
> >> +
> >> +     return 0;
> >> +}
> >> +
> >> +static int st_uvis25_read_oneshot(struct st_uvis25_hw *hw, u8 addr, int *val)
> >> +{
> >> +     u8 data;
> >> +     int err;
> >> +
> >> +     err = st_uvis25_set_enable(hw, true);
> >> +     if (err < 0)
> >> +             return err;
> >> +
> >> +     msleep(1500);  
> >
> > Could drive this off the interrupt rather than disabling the interrupt?
> > Would that be a little neater (simple completion here).
> >  
> 
> What do you mean? I did not get you.
If the interrupt 'stuck' case wasn't occuring you could basically
let the buffered path run once in order to get the oneshot read.
Thus you could use an interrupt instead of a sleep.
Doesn't really matter though.

> 
> >> +
> >> +     err = hw->tf->read(hw->dev, addr, sizeof(data), &data);
> >> +     if (err < 0)
> >> +             return err;  
> >
> > Is there a potential race here if for some reason we managed to
> > got to sleep for another conversion?  I think to be completely
> > safe you need force an additional read after the disable (or
> > will that fail to clear the data ready?
> >  
> 
> We can move the read access after the st_uvis25_set_enable(hw, false)
> in order to avoid an unnecessary read, do you agree?
You could perhaps get a later reading if you did that?
I don't suppose it really matters.
> 
> >> +
> >> +     st_uvis25_set_enable(hw, false);
> >> +
> >> +     *val = data;
> >> +
> >> +     return IIO_VAL_INT;
> >> +}
> >> +
> >> +static int st_uvis25_read_raw(struct iio_dev *iio_dev,
> >> +                           struct iio_chan_spec const *ch,
> >> +                           int *val, int *val2, long mask)
> >> +{
> >> +     int ret;
> >> +
> >> +     ret = iio_device_claim_direct_mode(iio_dev);
> >> +     if (ret)
> >> +             return ret;
> >> +
> >> +     switch (mask) {
> >> +     case IIO_CHAN_INFO_PROCESSED: {
> >> +             struct st_uvis25_hw *hw = iio_priv(iio_dev);
> >> +
> >> +             /*
> >> +              * mask irq line during oneshot read since the sensor
> >> +              * does not export the capability to disable data-ready line
> >> +              * in the register map and it is enabled by default.
> >> +              * If the line is unmasked during read_raw() it will be set
> >> +              * active and never reset since the trigger is disabled
> >> +              */  
> >
> > Nasty but well documented...
> >
> > I wonder if there is a nicer way to handle this... If we leave it on
> > the issues is that we end up with the status being checked by the interrupt
> > handler for the trigger (harmless if a waste of time) then the trigger
> > being fired (with nothing associated with it).  No consumers are attached
> > so we call notify done for all of them and finally that will result in
> > a try reenable. You could supply one of those that results in a read
> > to the device.  It think that would always deal with your case of
> > the data ready getting stuck high..
> >
> > (Not totally sure though as it's been a while since I dealt with a
> > sensor with this particular issue).
> >  
> >> +             if (hw->irq > 0)
> >> +                     disable_irq(hw->irq);
> >> +             ret = st_uvis25_read_oneshot(hw, ch->address, val);
> >> +             if (hw->irq > 0)
> >> +                     enable_irq(hw->irq);
> >> +             break;
> >> +     }
> >> +     default:
> >> +             ret = -EINVAL;
> >> +             break;
> >> +     }
