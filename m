Return-Path: <SRS0=sJlC=F6=codeaurora.org=sdharia@kernel.org>
Subject: Re: [v3, 3/4] i2c: i2c-qcom-geni: Add bus driver for the Qualcomm
 GENI I2C controller
References: <1519781889-16117-4-git-send-email-kramasub@codeaurora.org>
 <CAD=FV=WbeP8xpVi7cji9hsNyxEam2D5D+_21ur_MuUO8FK42OQ@mail.gmail.com>
From: Sagar Dharia <sdharia@codeaurora.org>
Message-ID: <03c5ed5b-5160-bdd5-82f9-4a8beab33ca8@codeaurora.org>
Date: Wed, 7 Mar 2018 19:42:24 -0700
MIME-Version: 1.0
In-Reply-To: <CAD=FV=WbeP8xpVi7cji9hsNyxEam2D5D+_21ur_MuUO8FK42OQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Doug Anderson <dianders@chromium.org>, Jonathan Corbet <corbet@lwn.net>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Wolfram Sang <wsa@the-dreams.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Karthikeyan Ramasubramanian <kramasub@codeaurora.org>, linux-doc@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-i2c@vger.kernel.org, linux-serial@vger.kernel.org, Jiri Slaby <jslaby@suse.com>, evgreen@chromium.org, acourbot@chromium.org, Girish Mahadevan <girishm@codeaurora.org>, swboyd@chromium.org
List-ID: <devicetree@vger.kernel.org>

Hi Doug,
Thank you for reviewing the patch. I will take a stab at a few comments 
below. We will address most of the other comments in next version of I2C 
patch.
> 
> 
>> +
>> +#define I2C_AUTO_SUSPEND_DELAY 250
> 
> Why 250 ms?  That seems like an eternity.  Is it really that expensive
> to turn resources off and on?  I would sorta just expect clocks and
> stuff to get turned off right after a transaction finished unless
> another one was pending right behind it...
> 
The response from RPMh to turn on/off shared resources also take quite a 
few msecs. The QUP serial bus block sits quite a few shared-NOCs away 
from the memory and runtime-PM is used a bandwidth vote/NOC vote for 
these NOCs from QUP to memory. Also the RPC between apps and RPMh can 
sometimes take longer depending on other tasks running on apps. This 250 
msec avoids thrashing of these RPCs between apps and RPMh.
If you plan to keep these NOCs on forever, then your are right: 
runtime-PM will be only used to turn on/off local clocks and we won't 
even need autosuspend. that's not true on products where this driver is 
currently deployed.
>> +
>> +static const struct geni_i2c_clk_fld geni_i2c_clk_map[] = {
>> +       {KHz(100), 7, 10, 11, 26},
>> +       {KHz(400), 2,  5, 12, 24},
>> +       {KHz(1000), 1, 3,  9, 18},
> 
> So I guess this is all relying on an input serial clock of 19.2MHz?
> Maybe document that?
> 
> Assuming I'm understanding the math here, is it really OK for your
> 100kHz and 1MHz mode to be running slightly fast?
> 
> 19200. / 2 / 24
>>>> 400.0
> 
> 19200. / 7 / 26
>>>> 105.49450549450549
> 
> 19200. / 1 / 18
>>>> 1066.6666666666667
> 
> It seems like you'd want the fastest clock that you can make that's
> _less than_ the spec.
> 
> 
> It would also be interesting to know if it's expected that boards
> might need to tweak the t_high / t_low depending on their electrical
> characteristics.  In the past I've had lots of requests from board
> makers to tweak things because they've got a long trace, or a stronger
> or weaker pull, or ...  If so we might later need to add some dts
> properties like "i2c-scl-rising-time-ns" and make the math more
> dynamic here, unless your hardware somehow automatically adjusts for
> this type of thing...
>These values are derived by our HW team to comply with the t-high and 
t-low specs of I2C. We have confirmed on scope that the frequency of SCL 
is indeed less than/equal to the spec. We have not come across slaves 
who have needed to tweak these things. We are open to adding these 
properties in dts if you have any such slaves not conforming due to 
board-layout of other reasons.
>> +       mode = msg->len > 32 ? GENI_SE_DMA : GENI_SE_FIFO;
> 
> DMA is hard and i2c transfers > 32 bytes are rare.  Do we really gain
> a lot by transferring i2c commands over DMA compared to a FIFO?
> Enough to justify the code complexity and the set of bugs that will
> show up?  I'm sure it will be a controversial assertion given that the
> code's already written, but personally I'd be supportive of ripping
> DMA mode out to simplify the driver.  I'd be curious if anyone else
> agrees.  To me it seems like premature optimization.

Yes, we have multiple clients (e.g. touch, NFC) using I2C for data 
transfers bigger than 32 bytes (some transfers are 100s of bytes). The 
fifo size is 32, so we can definitely avoid at least 1 interrupt when 
DMA mode is used with data size > 32.
> 
> 
>> +       geni_se_select_mode(&gi2c->se, mode);
>> +       writel_relaxed(msg->len, gi2c->se.base + SE_I2C_RX_TRANS_LEN);
>> +       geni_se_setup_m_cmd(&gi2c->se, I2C_READ, m_param);
>> +       if (mode == GENI_SE_DMA) {
>> +               rx_dma = geni_se_rx_dma_prep(&gi2c->se, msg->buf, msg->len);
> 
> Randomly I noticed a flag called "I2C_M_DMA_SAFE".  Do we need to
> check this flag before using msg->buf for DMA?  ...or use
> i2c_get_dma_safe_msg_buf()?
> 
> ...btw: the relative lack of people doing this in the kernel is
> further evidence of DMA not really being worth it for i2c busses.
I cannot comment about other drivers here using or not using DMA since 
they may not be exercised with slaves like NFC?
>> +       ret = pm_runtime_get_sync(gi2c->se.dev);
>> +       if (ret < 0) {
>> +               dev_err(gi2c->se.dev, "error turning SE resources:%d\n", ret);
>> +               pm_runtime_put_noidle(gi2c->se.dev);
>> +               /* Set device in suspended since resume failed */
>> +               pm_runtime_set_suspended(gi2c->se.dev);
>> +               return ret;
> 
> Wow, that's a cluster of arcane calls to handle a call that probably
> will never fail (it just enables clocks and sets pinctrl).  Sigh.
> ...but as far as I can tell the whole sequence is right.  You
> definitely need a "put" after a failed get and it looks like
> pm_runtime_set_suspended() has a special exception where it can be
> called if you got a runtime error...
We didn't have this in before either. But this condition is somewhat 
frequent if I2C transactions are called on cusp of exiting system 
suspend. (e.g. PMIC slave getting a wakeup-IRQ and trying to read from 
PMIC through I2C to read its status as to what caused that wake-up. At 
that time, get_sync doesn't really enable resources (kernel 4.9) since 
the runtime-pm ref-count isn't decremented. We run the risk of unclocked 
access if these arcane calls aren't present. You can go through 
runtime-pm documentation chapter 6 for more details.

>> +       ret = devm_request_irq(&pdev->dev, gi2c->irq, geni_i2c_irq,
>> +                              IRQF_TRIGGER_HIGH, "i2c_geni", gi2c);
>> +       if (ret) {
>> +               dev_err(&pdev->dev, "Request_irq failed:%d: err:%d\n",
>> +                       gi2c->irq, ret);
>> +               return ret;
>> +       }
>> +       disable_irq(gi2c->irq);
> 
> Can you explain the goal of the disable_irq() here.  Is it actually
> needed for something or does it somehow save power?  From drivers I've
> reviewed in the past this doesn't seem like a common thing to do, so
> I'm curious what it's supposed to gain for you.  I'd be inclined to
> just delete the whole disable/enable of the irq from this driver.

Qualcomm's power team suggests we enable/disable unused IRQs. Otherwise 
they can block apps from entering some low-power mode (unless the 
interrupt is in some list?) I will confirm again with them and let you know.
>> +       /* Make sure no transactions are pending */
>> +       ret = i2c_trylock_bus(&gi2c->adap, I2C_LOCK_SEGMENT);
>> +       if (!ret) {
>> +               dev_err(gi2c->se.dev, "late I2C transaction request\n");
>> +               return -EBUSY;
>> +       }
> 
> Does this happen?  How?
> 
> Nothing about this code looks special for your hardware.  If this is
> really needed, why is it not part of the i2c core since there's
> nothing specific about your driver here?
> 
There have been some clients that don't implement sys-suspend/resume 
callbacks (so i2c adapter has no clue they are done with their 
transactions) and this allows us to be flexible when they call I2C 
transactions extremely late.

> 
>> +       if (!pm_runtime_status_suspended(device)) {
>> +               geni_i2c_runtime_suspend(device);
>> +               pm_runtime_disable(device);
>> +               pm_runtime_set_suspended(device);
>> +               pm_runtime_enable(device);
>> +       }
> 
> Similar question.  Why do you need this special case code?  Are there
> cases where we're all the way at suspend_noirq and yet we still
> haven't runtime suspended?  Can you please document how we get into
> this state?
> This is when transaction happens less-than 250 msec of the 
system-suspend. PM-runtime has not gotten a chance to auto-suspend us 
since timer hasn't expired before system-suspend is attempted. These 
calls make sure that we truly turn off driver resources and make 
runtime-PM state consistent with the HW state. We can document this.


Thanks
Sagar
-- 
Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
