Return-Path: <SRS0=20ow=F7=codeaurora.org=kramasub@kernel.org>
Subject: Re: [PATCH v3 4/4] tty: serial: msm_geni_serial: Add serial driver
 support for GENI based QUP
References: <1519781889-16117-1-git-send-email-kramasub@codeaurora.org>
 <1519781889-16117-5-git-send-email-kramasub@codeaurora.org>
 <152002870571.108663.443363731684218377@swboyd.mtv.corp.google.com>
 <f900dc96-0150-079d-bcd6-9d2e05f8fde1@codeaurora.org>
 <152037270430.218381.11080419743809466427@swboyd.mtv.corp.google.com>
 <d8089e60-9344-8a7e-502d-3e04e357811b@codeaurora.org>
 <152054835314.219802.7795128053459733073@swboyd.mtv.corp.google.com>
From: Karthik Ramasubramanian <kramasub@codeaurora.org>
Message-ID: <d762f656-65d3-8b4a-2200-4b8a45de8ba9@codeaurora.org>
Date: Thu, 8 Mar 2018 21:57:23 -0700
MIME-Version: 1.0
In-Reply-To: <152054835314.219802.7795128053459733073@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Stephen Boyd <swboyd@chromium.org>, andy.gross@linaro.org, corbet@lwn.net, david.brown@linaro.org, gregkh@linuxfoundation.org, mark.rutland@arm.com, robh+dt@kernel.org, wsa@the-dreams.de
Cc: linux-doc@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-i2c@vger.kernel.org, linux-serial@vger.kernel.org, jslaby@suse.com, evgreen@chromium.org, acourbot@chromium.org, Girish Mahadevan <girishm@codeaurora.org>, Sagar Dharia <sdharia@codeaurora.org>, Doug Anderson <dianders@google.com>
List-ID: <devicetree@vger.kernel.org>



On 3/8/2018 3:32 PM, Stephen Boyd wrote:
> Quoting Karthik Ramasubramanian (2018-03-07 22:06:29)
>>
>>
>> On 3/6/2018 2:45 PM, Stephen Boyd wrote:
>>> Quoting Karthik Ramasubramanian (2018-03-05 16:51:23)
>>>> On 3/2/2018 3:11 PM, Stephen Boyd wrote:
>>>
>>> Ok. I've seen similar designs in some mmc drivers. For example, you can
>>> look at drivers/mmc/host/meson-gx-mmc.c and see that they register a
>>> clk_ops and then just start using that clk directly from the driver.
>>> There are also some helper functions for dividers that would hopefully
>>> make the job of calculating the best divider easier.
>> Thanks for the pointers. I will take a look at it. In the meanwhile I
>> had discussions with our clock team. They pointed out that the register
>> to write the divider value here is outside the scope of clock controller
>> which makes it trickier to implement your suggestion. They are already
>> in the mailing list and we will discuss further and get back to you in
>> this regard.
> 
> Ok. Let me know if I can help answer any questions.
Ok.
> 
>>>>>
>>>>> Why are these noirq variants? Please add a comment.
>>>> The intention is to enable the console UART port usage as late as
>>>> possible in the suspend cycle. Hence noirq variants. I will add this as
>>>> a comment. Please let me know if the usage does not match the intention.
>>>
>>> Hm.. Does no_console_suspend not work? Or not work well enough?
>> It works. When console suspend is disabled, the suspend operation does
>> not get triggered and the resume operation checks if the console suspend
>> is disabled and performs the needed thing.
> 
> Ok so then do we need the noirq variants? Or console suspend is special
> enough for this to not matter?
I am a little confused as to whether you prefer the console to not 
suspend at all or you prefer the console suspend at an earlier stage 
than no_irq stage.

If it is former, then with the console_suspend_enabled flag set by 
default this seems the right thing to do. Atleast my understanding is 
that console is expecting the serial port to suspend as well.

If it is latter, then I will check the stage at which suspend_console() 
is initiated and can suspend the serial port after that.
> 
Regards,
Karthik.
-- 
Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
