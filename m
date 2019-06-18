From: Subash Abhinov Kasiviswanathan <subashab@codeaurora.org>
Subject: Re: [PATCH v2 00/17] net: introduce Qualcomm IPA driver
Date: Tue, 18 Jun 2019 15:15:42 -0600
Message-ID: <6c70950d0c78bc02a3d016918ec3929e@codeaurora.org>
References: <380a6185-7ad1-6be0-060b-e6e5d4126917@linaro.org>
 <a94676381a5ca662c848f7a725562f721c43ce76.camel@sipsolutions.net>
 <CAK8P3a0kV-i7BJJ2X6C=5n65rSGfo8fUiC4J_G-+M8EctYKbkg@mail.gmail.com>
 <066e9b39f937586f0f922abf801351553ec2ba1d.camel@sipsolutions.net>
 <b3686626-e2d8-bc9c-6dd0-9ebb137715af@linaro.org>
 <b23a83c18055470c5308fcd1eed018056371fc1d.camel@sipsolutions.net>
 <CAK8P3a1FeUQR3pgoQxHoRK05JGORyR+TFATVQiijLWtFKTv6OQ@mail.gmail.com>
 <613cdfde488eb23d7207c7ba6258662702d04840.camel@sipsolutions.net>
 <CAK8P3a2onXpxiE4y9PzRwuPM2dh=h_BKz7Eb0=LLPgBbZoK1bQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAK8P3a2onXpxiE4y9PzRwuPM2dh=h_BKz7Eb0=LLPgBbZoK1bQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Johannes Berg <johannes@sipsolutions.net>, Alex Elder <elder@linaro.org>, abhishek.esse@gmail.com, Ben Chan <benchan@google.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, cpratapa@codeaurora.org, David Miller <davem@davemloft.net>, Dan Williams <dcbw@redhat.com>, DTML <devicetree@vger.kernel.org>, Eric Caruso <ejcaruso@google.com>, evgreen@chromium.org, Ilias Apalodimas <ilias.apalodimas@linaro.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-arm-msm@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-soc@vger.kernel.org, Networking <netdev@vger.kernel.org>, syadagir@codeaurora.org
List-Id: devicetree@vger.kernel.org

On 2019-06-18 14:55, Arnd Bergmann wrote:
> On Tue, Jun 18, 2019 at 10:36 PM Johannes Berg
> <johannes@sipsolutions.net> wrote:
>> 
>> On Tue, 2019-06-18 at 21:59 +0200, Arnd Bergmann wrote:
>> >
>> > From my understanding, the ioctl interface would create the lower
>> > netdev after talking to the firmware, and then user space would use
>> > the rmnet interface to create a matching upper-level device for that.
>> > This is an artifact of the strong separation of ipa and rmnet in the
>> > code.
>> 
>> Huh. But if rmnet has muxing, and IPA supports that, why would you 
>> ever
>> need multiple lower netdevs?
> 
> From my reading of the code, there is always exactly a 1:1 relationship
> between an rmnet netdev an an ipa netdev. rmnet does the encapsulation/
> decapsulation of the qmap data and forwards it to the ipa netdev,
> which then just passes data through between a hardware queue and
> its netdevice.
> 

There is a n:1 relationship between rmnet and IPA.
rmnet does the de-muxing to multiple netdevs based on the mux id
in the MAP header for RX packets and vice versa.

> [side note: on top of that, rmnet also does "aggregation", which may
>  be a confusing term that only means transferring multiple frames
>  at once]
> 
>> > ipa definitely has multiple hardware queues, and the Alex'
>> > driver does implement  the data path on those, just not the
>> > configuration to enable them.
>> 
>> OK, but perhaps you don't actually have enough to use one for each
>> session?
> 
> I'm lacking the terminology here, but what I understood was that
> the netdev and queue again map to a session.
> 
>> > Guessing once more, I suspect the the XON/XOFF flow control
>> > was a workaround for the fact that rmnet and ipa have separate
>> > queues. The hardware channel on IPA may fill up, but user space
>> > talks to rmnet and still add more frames to it because it doesn't
>> > know IPA is busy.
>> >
>> > Another possible explanation would be that this is actually
>> > forwarding state from the base station to tell the driver to
>> > stop sending data over the air.
>> 
>> Yeah, but if you actually have a hardware queue per upper netdev then
>> you don't really need this - you just stop the netdev queue when the
>> hardware queue is full, and you have flow control automatically.
>> 
>> So I really don't see any reason to have these messages going back and
>> forth unless you plan to have multiple sessions muxed on a single
>> hardware queue.
> 

Hardware may flow control specific PDNs (rmnet interfaces) based on QoS 
-
not necessarily only in case of hardware queue full.

> Sure, I definitely understand what you mean, and I agree that would
> be the right way to do it. All I said is that this is not how it was 
> done
> in rmnet (this was again my main concern about the rmnet design
> after I learned it was required for ipa) ;-)
> 
>      Arnd

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
