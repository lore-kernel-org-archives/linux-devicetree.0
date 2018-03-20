Return-Path: <SRS0=GJfZ=GK=codeaurora.org=kramasub@kernel.org>
Subject: Re: [PATCH v4 3/6] i2c: i2c-qcom-geni: Add bus driver for the
 Qualcomm GENI I2C controller
References: <1521071931-9294-1-git-send-email-kramasub@codeaurora.org>
 <1521071931-9294-4-git-send-email-kramasub@codeaurora.org>
 <CAD=FV=W+eiy80y2QKp_-jPEp4SG0WxmdKFTn-5de0A1F-XPrqA@mail.gmail.com>
From: Karthik Ramasubramanian <kramasub@codeaurora.org>
Message-ID: <3fc723f9-f995-6820-051e-446175539fe0@codeaurora.org>
Date: Tue, 20 Mar 2018 16:10:53 -0600
MIME-Version: 1.0
In-Reply-To: <CAD=FV=W+eiy80y2QKp_-jPEp4SG0WxmdKFTn-5de0A1F-XPrqA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Doug Anderson <dianders@chromium.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Wolfram Sang <wsa@the-dreams.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-doc@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-i2c@vger.kernel.org, linux-serial@vger.kernel.org, Jiri Slaby <jslaby@suse.com>, evgreen@chromium.org, acourbot@chromium.org, swboyd@chromium.org, Sagar Dharia <sdharia@codeaurora.org>, Girish Mahadevan <girishm@codeaurora.org>
List-ID: <devicetree@vger.kernel.org>



On 3/19/2018 3:08 PM, Doug Anderson wrote:
> Hi,
> 
> On Wed, Mar 14, 2018 at 4:58 PM, Karthikeyan Ramasubramanian
> <kramasub@codeaurora.org> wrote:
>> This bus driver supports the GENI based i2c hardware controller in the
>> Qualcomm SOCs. The Qualcomm Generic Interface (GENI) is a programmable
>> module supporting a wide range of serial interfaces including I2C. The
>> driver supports FIFO mode and DMA mode of transfer and switches modes
>> dynamically depending on the size of the transfer.
>>
>> Signed-off-by: Karthikeyan Ramasubramanian <kramasub@codeaurora.org>
>> Signed-off-by: Sagar Dharia <sdharia@codeaurora.org>
>> Signed-off-by: Girish Mahadevan <girishm@codeaurora.org>
>> ---
>>  drivers/i2c/busses/Kconfig         |  13 +
>>  drivers/i2c/busses/Makefile        |   1 +
>>  drivers/i2c/busses/i2c-qcom-geni.c | 648 +++++++++++++++++++++++++++++++++++++
>>  3 files changed, 662 insertions(+)
> 
> Since I reviewed v3 of the i2c patch, can you make sure that you CC me
> on future patches?  Thanks!  :)
> 
> Overall this looks pretty nice to me now.  A few minor comments...
Sorry for not keeping you in CC for this patch. I will keep you in the
CC going forward.
> 
> 
>> +static void geni_i2c_abort_xfer(struct geni_i2c_dev *gi2c)
>> +{
>> +       u32 val;
>> +       unsigned long time_left = ABORT_TIMEOUT;
>> +       unsigned long flags;
>> +
>> +       spin_lock_irqsave(&gi2c->lock, flags);
>> +       geni_i2c_err(gi2c, GENI_TIMEOUT);
>> +       gi2c->cur = NULL;
>> +       geni_se_abort_m_cmd(&gi2c->se);
>> +       spin_unlock_irqrestore(&gi2c->lock, flags);
>> +       do {
>> +               time_left = wait_for_completion_timeout(&gi2c->done, time_left);
>> +               val = readl_relaxed(gi2c->se.base + SE_GENI_M_IRQ_STATUS);
>> +       } while (!(val & M_CMD_ABORT_EN) && time_left);
>> +
>> +       if (!(val & M_CMD_ABORT_EN) && !time_left)
> 
> Why do you need to check !time_left?  Just "if (!(val & M_CMD_ABORT_EN))".
I will remove here and in the other places you mentioned.
> 
> 
>> +
>> +       gi2c->se.dev = &pdev->dev;
>> +       gi2c->se.wrapper = dev_get_drvdata(pdev->dev.parent);
>> +       res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>> +       gi2c->se.base = devm_ioremap_resource(&pdev->dev, res);
>> +       if (IS_ERR(gi2c->se.base))
>> +               return PTR_ERR(gi2c->se.base);
>> +
>> +       gi2c->se.clk = devm_clk_get(&pdev->dev, "se");
>> +       if (IS_ERR(gi2c->se.clk)) {
>> +               ret = PTR_ERR(gi2c->se.clk);
>> +               dev_err(&pdev->dev, "Err getting SE Core clk %d\n", ret);
>> +               return ret;
>> +       }
>> +
>> +       ret = device_property_read_u32(&pdev->dev, "clock-frequency",
>> +                                                       &gi2c->clk_freq_out);
>> +       if (ret) {
>> +               /* All GENI I2C slaves support 400kHz. So default to 400kHz. */
> 
> Can you explain this comment?  Are you saying that GENI only supports
> talking to I2C devices (devices are also known as "slaves" and GENI
> should be the I2C master) that talk 400 kHz I2C or better?  Why do you
> even have 100 kHz in your table above then?  I don't think this is
> what you meant...
> 
> Perhaps you meant to say "All GENI I2C masters support at least 400
> kHz, so default ot 400 kHz"
> 
> ...however, even if you changed the comment as I suggested I'm still
> not a fan.  As I said in my review of the prevous version:
> 
>> I feel like it should default to 100KHz.  i2c_parse_fw_timings()
>> defaults to this and to me the wording "New drivers almost always
>> should use the defaults" makes me feel this should be the defaults.
> 
> I would also say that even if all GENI I2C masters support at least
> 400 kHz that doesn't mean that all I2C devices on the bus support 400
> kHz.  You could certainly imagine someone sticking something on this
> bus that was super low cost and supported only 100 kHz I2C.
We felt that all the current slaves that are connected to our masters
support 400kHz. Hence we used that as a default frequency.

I agree with you regarding 100kHz as default frequency. I will update
that way in the next patch.
> 
> 
> -Doug
> 
Regards,
Karthik.
-- 
Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
