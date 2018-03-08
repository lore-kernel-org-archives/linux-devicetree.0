Return-Path: <SRS0=cG+Z=F6=codeaurora.org=kramasub@kernel.org>
Subject: Re: [PATCH v3 4/4] tty: serial: msm_geni_serial: Add serial driver
 support for GENI based QUP
References: <1519781889-16117-1-git-send-email-kramasub@codeaurora.org>
 <1519781889-16117-5-git-send-email-kramasub@codeaurora.org>
 <152002870571.108663.443363731684218377@swboyd.mtv.corp.google.com>
 <f900dc96-0150-079d-bcd6-9d2e05f8fde1@codeaurora.org>
 <152037270430.218381.11080419743809466427@swboyd.mtv.corp.google.com>
From: Karthik Ramasubramanian <kramasub@codeaurora.org>
Message-ID: <d8089e60-9344-8a7e-502d-3e04e357811b@codeaurora.org>
Date: Wed, 7 Mar 2018 23:06:29 -0700
MIME-Version: 1.0
In-Reply-To: <152037270430.218381.11080419743809466427@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Stephen Boyd <swboyd@chromium.org>, andy.gross@linaro.org, corbet@lwn.net, david.brown@linaro.org, gregkh@linuxfoundation.org, mark.rutland@arm.com, robh+dt@kernel.org, wsa@the-dreams.de
Cc: linux-doc@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-i2c@vger.kernel.org, linux-serial@vger.kernel.org, jslaby@suse.com, evgreen@chromium.org, acourbot@chromium.org, Girish Mahadevan <girishm@codeaurora.org>, Sagar Dharia <sdharia@codeaurora.org>, Doug Anderson <dianders@google.com>
List-ID: <devicetree@vger.kernel.org>



On 3/6/2018 2:45 PM, Stephen Boyd wrote:
> Quoting Karthik Ramasubramanian (2018-03-05 16:51:23)
>> On 3/2/2018 3:11 PM, Stephen Boyd wrote:
>>> Quoting Karthikeyan Ramasubramanian (2018-02-27 17:38:09)
>>>
>>>> +               size_t chars_to_write = 0;
>>>> +               size_t avail = DEF_FIFO_DEPTH_WORDS - DEF_TX_WM;
>>>> +
>>>> +               /*
>>>> +                * If the WM bit never set, then the Tx state machine is not
>>>> +                * in a valid state, so break, cancel/abort any existing
>>>> +                * command. Unfortunately the current data being written is
>>>> +                * lost.
>>>> +                */
>>>> +               while (!qcom_geni_serial_poll_bit(uport, SE_GENI_M_IRQ_STATUS,
>>>> +                                               M_TX_FIFO_WATERMARK_EN, true))
>>>
>>> Does this ever timeout? So many nested while loops makes it hard to
>>> follow.
>> Yes. Based on the baud rate of 115200 and the FIFO Depth & Width of (16
>> * 32), the poll should not take more than 5 ms under the timeout scenario.
> 
> Sure, but I'm asking if this has any sort of timeout associated with it.
> It looks to be a while loop that could possibly go forever?
I will change it from a while loop to if condition to make it clear.
> 
>>>> +static void qcom_geni_serial_console_write(struct console *co, const char *s,
>>>> +                             unsigned int count)
>>>> +{
>>>> +       struct uart_port *uport;
>>>> +       struct qcom_geni_serial_port *port;
>>>> +       bool locked = true;
>>>> +       unsigned long flags;
>>>> +
>>>> +       WARN_ON(co->index < 0 || co->index >= GENI_UART_CONS_PORTS);
>>>> +
>>>> +       port = get_port_from_line(co->index);
>>>> +       if (IS_ERR(port))
>>>> +               return;
>>>> +
>>>> +       uport = &port->uport;
>>>> +       if (oops_in_progress)
>>>> +               locked = spin_trylock_irqsave(&uport->lock, flags);
>>>> +       else
>>>> +               spin_lock_irqsave(&uport->lock, flags);
>>>> +
>>>> +       if (locked) {
>>>> +               __qcom_geni_serial_console_write(uport, s, count);
>>>
>>> So if oops is in progress, and we didn't lock here, we don't output
>>> data? I'd think we would always want to write to the fifo, just make the
>>> lock grab/release conditional.
>> If we fail to grab the lock, then there is another active writer. So
>> trying to write to the fifo will put the hardware in bad state because
>> writer has programmed the hardware to write 'x' number of words and this
>> thread will over-write it with 'y' number of words. Also the data that
>> you might see in the console might be garbled.
> 
> I suspect that because this is the serial console, and we want it to
> always output stuff even when we're going down in flames, we may want to
> ignore that case and just wait for the fifo to free up and then
> overwrite the number of words that we want to output and push out more
> characters.
> 
> I always get confused though because there seem to be lots of different
> ways to do things in serial drivers and not too much clear documentation
> that I've read describing what to do.
Ok. If the active writer is interrupted due to OOPS handler, then the 
interrupted write can be cancelled and the write from OOPS handler can 
be performed.
> 
>>>
>>>> +               spin_unlock_irqrestore(&uport->lock, flags);
>>>> +       }
>>>> +}
> [...]
>>>> +
>>>> +       if (m_irq_status & (M_TX_FIFO_WATERMARK_EN | M_CMD_DONE_EN) &&
>>>> +           m_irq_en & (M_TX_FIFO_WATERMARK_EN | M_CMD_DONE_EN))
>>>> +               qcom_geni_serial_handle_tx(uport);
>>>> +
>>>> +       if (s_irq_status & S_GP_IRQ_0_EN || s_irq_status & S_GP_IRQ_1_EN) {
>>>> +               if (s_irq_status & S_GP_IRQ_0_EN)
>>>> +                       uport->icount.parity++;
>>>> +               drop_rx = true;
>>>> +       } else if (s_irq_status & S_GP_IRQ_2_EN ||
>>>> +                                       s_irq_status & S_GP_IRQ_3_EN) {
>>>> +               uport->icount.brk++;
>>>
>>> How does break character handling work? I see the accounting here, but
>>> don't see any uart_handle_break() call anywhere.
>> The reason it is not added is because the hardware does not indicate
>> when the break character occured. It can be any one of the FIFO words.
>> The statistics is updated to give an idea that the break happened. We
>> can add uart_handle_break() but it may not be at an accurate position
>> for the above mentioned reason.
> 
> Sounds like the previous uart design. We would want uart_handle_break()
> support for kgdb to work over serial. Do we still get an interrupt
> signal that a break character is somewhere in the fifo? If we get that,
> then does it also put a NUL (0) character into the fifo that we can
> find? I had to do something like that before, where we detect the irq
> and then we go through the fifo a character at a time to find the break
> character that looks like a NUL, and then let sysrq core handle the
> characters after that break character comes in.
I will use the same logic as in blsp2 serial to catch the break 
character, same as NULL and push the break character to the framework.
> 
>>>
>>>
>>>> +}
>>>> +
>>>> +static unsigned long get_clk_div_rate(unsigned int baud, unsigned int *clk_div)
>>>> +{
>>>> +       unsigned long ser_clk;
>>>> +       unsigned long desired_clk;
>>>> +
>>>> +       desired_clk = baud * UART_OVERSAMPLING;
>>>> +       ser_clk = get_clk_cfg(desired_clk);
>>>> +       if (!ser_clk) {
>>>> +               pr_err("%s: Can't find matching DFS entry for baud %d\n",
>>>> +                                                               __func__, baud);
>>>> +               return ser_clk;
>>>> +       }
>>>> +
>>>> +       *clk_div = ser_clk / desired_clk;
>>>
>>> How wide can clk_div be? It may be better to implement the ser_clk as an
>>> actual clk in the common clk framework, and then have the serial driver
>>> or the i2c driver call clk_set_rate() on that clk and have the CCF
>>> implementation take care of determining the rate that the parent clk can
>>> supply and how it can fit it into the frequency that the divider can
>>> support.
>> Based on my current expertise with the CCF, I will address this comment
>> in a later patchset than the next one.
> 
> Ok. I've seen similar designs in some mmc drivers. For example, you can
> look at drivers/mmc/host/meson-gx-mmc.c and see that they register a
> clk_ops and then just start using that clk directly from the driver.
> There are also some helper functions for dividers that would hopefully
> make the job of calculating the best divider easier.
Thanks for the pointers. I will take a look at it. In the meanwhile I 
had discussions with our clock team. They pointed out that the register 
to write the divider value here is outside the scope of clock controller 
which makes it trickier to implement your suggestion. They are already 
in the mailing list and we will discuss further and get back to you in 
this regard.
> 
>>>> +
>>>> +       uport->uartclk = clk_rate;
>>>> +       clk_set_rate(port->se.clk, clk_rate);
>>>> +       ser_clk_cfg = SER_CLK_EN;
>>>> +       ser_clk_cfg |= (clk_div << CLK_DIV_SHFT);
>>>
>>> Drop useless cast.
>> I think you mean parenthesis. I do not see casting here.
> 
> Yes! You got it.
> 
>>>> +#endif
>>>> +       .pm = qcom_geni_serial_cons_pm,
>>>> +};
>>>> +
>>>> +static int qcom_geni_serial_probe(struct platform_device *pdev)
>>>> +{
>>>> +       int ret = 0;
>>>> +       int line = -1;
>>>> +       struct qcom_geni_serial_port *port;
>>>> +       struct uart_port *uport;
>>>> +       struct resource *res;
>>>> +       struct uart_driver *drv;
>>>> +
>>>> +       drv = (void *)of_device_get_match_data(&pdev->dev);
>>>
>>> Useless cast.
>> There were compiler warnings assigning a const void * to a void *. That
>> is why I have the cast in place.
> 
> Oh. Yes you shouldn't cast away the const. Please make the compiler
> warning go away without casting it away.
Ok. I will figure out an alternative to this one.
> 
>>>
>>>
>>> Also, I see some serial drivers do the mapping when the port is
>>> requested. That can't be done here?
>> By "when the port is requested" do you mean console's setup operation.
>> It can be done, but given that it is a one-time operation I am not sure
>> if it makes any difference between mapping here and there.
> 
> No. I meant the uart_ops::uart_request() function and also
> uart_ops::config_port(). Take a look at msm_config_port() and
> msm_request_port() for how it was done on pre-geni qcom uarts.
> 
I will take a look at it and update accordingly.
> I suppose we should try to probe this as a module and run a getty on it
> and then remove and probe the module a couple times after that.
> That should shake out some bugs.
> 
>>>> +
>>>> +static const struct dev_pm_ops qcom_geni_serial_pm_ops = {
>>>> +       .suspend_noirq = qcom_geni_serial_sys_suspend_noirq,
>>>> +       .resume_noirq = qcom_geni_serial_sys_resume_noirq,
>>>
>>> Why are these noirq variants? Please add a comment.
>> The intention is to enable the console UART port usage as late as
>> possible in the suspend cycle. Hence noirq variants. I will add this as
>> a comment. Please let me know if the usage does not match the intention.
> 
> Hm.. Does no_console_suspend not work? Or not work well enough?
It works. When console suspend is disabled, the suspend operation does 
not get triggered and the resume operation checks if the console suspend 
is disabled and performs the needed thing.
> 
Regards,
Karthik.
-- 
Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
