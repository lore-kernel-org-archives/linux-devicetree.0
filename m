Return-Path: <SRS0=wjve=F6=google.com=dianders@kernel.org>
MIME-Version: 1.0
Sender: dianders@google.com
In-Reply-To: <CAD=FV=UXK_wYky83nmQdk4dQtVSCV9=o3i2590ZyUMcq4rrdKQ@mail.gmail.com>
References: <1519781889-16117-4-git-send-email-kramasub@codeaurora.org>
 <CAD=FV=WbeP8xpVi7cji9hsNyxEam2D5D+_21ur_MuUO8FK42OQ@mail.gmail.com>
 <03c5ed5b-5160-bdd5-82f9-4a8beab33ca8@codeaurora.org> <CAD=FV=UXK_wYky83nmQdk4dQtVSCV9=o3i2590ZyUMcq4rrdKQ@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 8 Mar 2018 13:12:09 -0800
Message-ID: <CAD=FV=ULH+9aW_3m=WB3Fa4mBg3sR-S3AFY7XOKdZCDqkJdq1Q@mail.gmail.com>
Subject: Re: [v3, 3/4] i2c: i2c-qcom-geni: Add bus driver for the Qualcomm
 GENI I2C controller
Content-Type: text/plain; charset="UTF-8"
To: Sagar Dharia <sdharia@codeaurora.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Wolfram Sang <wsa@the-dreams.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Karthikeyan Ramasubramanian <kramasub@codeaurora.org>, linux-doc@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-i2c@vger.kernel.org, linux-serial@vger.kernel.org, Jiri Slaby <jslaby@suse.com>, evgreen@chromium.org, acourbot@chromium.org, Girish Mahadevan <girishm@codeaurora.org>, swboyd@chromium.org
List-ID: <devicetree@vger.kernel.org>

Hi,

On Wed, Mar 7, 2018 at 9:19 PM, Doug Anderson <dianders@chromium.org> wrote:
>>> DMA is hard and i2c transfers > 32 bytes are rare.  Do we really gain
>>> a lot by transferring i2c commands over DMA compared to a FIFO?
>>> Enough to justify the code complexity and the set of bugs that will
>>> show up?  I'm sure it will be a controversial assertion given that the
>>> code's already written, but personally I'd be supportive of ripping
>>> DMA mode out to simplify the driver.  I'd be curious if anyone else
>>> agrees.  To me it seems like premature optimization.
>>
>>
>> Yes, we have multiple clients (e.g. touch, NFC) using I2C for data transfers
>> bigger than 32 bytes (some transfers are 100s of bytes). The fifo size is
>> 32, so we can definitely avoid at least 1 interrupt when DMA mode is used
>> with data size > 32.
>
> Does that 1-2 interrupts make any real difference, though?  In theory
> it really shouldn't affect the transfer rate.  We should be able to
> service the interrupt plenty fast and if we were concerned we would
> tweak the watermark code a little bit.  So I guess we're worried about
> the extra CPU cycles (and power cost) to service those extra couple
> interrupts?
>
> In theory when touch data is coming in or NFC data is coming in then
> we're probably not in a super low power state to begin with.  If it's
> touch data we likely want to have the CPU boosted a bunch to respond
> to the user quickly.  If we've got 8 cores available all of which can
> run at 1GHz or more a few interrupts won't kill us.  NFC data is
> probably not common enough that we need to optimize power/CPU
> utilizatoin for that.
>
>
> So while i can believe that you do save an interrupt or two, I still
> am not convinced that those interrupts are worth a bunch of complex
> code (and a whole second code path) to save.
>
>
> ...also note that above you said that coming out of runtime suspend
> can take several msec.  That seems like it dwarfs any slight
> difference in timing between a FIFO-based operation and DMA.

One last note here (sorry for not thinking of this last night) is that
I would also be interested in considering _only_ supporting the DMA
path.  Is it somehow intrinsically bad to use the DMA flow for a
1-byte transfer?  Is there a bunch of extra overhead or power draw?

Specifically my main point is that maintaining two separate flows (the
FIFO flow vs the DMA flow) adds complexity, code size, and bugs.  If
there's a really good reason to maintain both flows then fine, but we
should really consider if this is something that's really giving us
value before we agree to it.


-Doug
