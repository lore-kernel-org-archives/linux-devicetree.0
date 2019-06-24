From: Alex Elder <elder@linaro.org>
Subject: Re: [PATCH v2 00/17] net: introduce Qualcomm IPA driver
Date: Mon, 24 Jun 2019 11:21:45 -0500
Message-ID: <a9230cf8-c8f6-9270-c0e4-b56f340c3ecc@linaro.org>
References: <380a6185-7ad1-6be0-060b-e6e5d4126917@linaro.org>
 <a94676381a5ca662c848f7a725562f721c43ce76.camel@sipsolutions.net>
 <CAK8P3a0kV-i7BJJ2X6C=5n65rSGfo8fUiC4J_G-+M8EctYKbkg@mail.gmail.com>
 <066e9b39f937586f0f922abf801351553ec2ba1d.camel@sipsolutions.net>
 <b3686626-e2d8-bc9c-6dd0-9ebb137715af@linaro.org>
 <b23a83c18055470c5308fcd1eed018056371fc1d.camel@sipsolutions.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <b23a83c18055470c5308fcd1eed018056371fc1d.camel@sipsolutions.net>
Content-Language: en-US
Sender: netdev-owner@vger.kernel.org
To: Johannes Berg <johannes@sipsolutions.net>, Arnd Bergmann <arnd@arndb.de>
Cc: abhishek.esse@gmail.com, Ben Chan <benchan@google.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, cpratapa@codeaurora.org, David Miller <davem@davemloft.net>, Dan Williams <dcbw@redhat.com>, DTML <devicetree@vger.kernel.org>, Eric Caruso <ejcaruso@google.com>, evgreen@chromium.org, Ilias Apalodimas <ilias.apalodimas@linaro.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-arm-msm@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-soc@vger.kernel.org, Networking <netdev@vger.kernel.org>, Subash Abhinov Kasiviswanathan <subashab@codeaurora.org>, syadagir@codeaurora.org
List-Id: devicetree@vger.kernel.org

On 6/18/19 2:14 PM, Johannes Berg wrote:
> On Tue, 2019-06-18 at 08:16 -0500, Alex Elder wrote:
>> On 6/17/19 6:28 AM, Johannes Berg wrote:
>>> On Tue, 2019-06-11 at 13:56 +0200, Arnd Bergmann wrote:
>>>> On Tue, Jun 11, 2019 at 10:12 AM Johannes Berg
>>>> <johannes@sipsolutions.net> wrote:
>>>>
>>>>>> As I've made clear before, my work on this has been focused on the IPA transport,

. . .

>> The IPA driver was very large, and in an effort to have an initial driver
>> that was more easily accepted upstream, it was carved down to support
>> a single, very simple use case.  It supports only a single channel for
>> carrying network data, and does not expose any of the IPA's other
>> capabilities like filtering and routing (and multiplexing).
> 
> Ok. But it *does* use (or even require using) rmnet, so it has multiple
> channels in a sense, no?

Yes.  It's a multiplexing protocol, supporting one *or more* channels.

>> Originally the IPA code had an IOCTL interface for adding and removing
>> multiplexed channel IDs, but the simplified use case expected only one
>> channel to be used.  
> 
> What did those channels do? Create different netdevs? Something else
I don't know.  The code I started with only supported the use of
one channel, but assumed the use of rmnet anyway (for aggregation
and checksum offload most likely).

. . .

>> So getting back to your question, the IPA in its current form only
>> has a single "multiplexed" channel carried over the connection
>> between the AP and modem.  Previously (and in the future) there
>> was a way to add or remove channels.
> 
> What would those channels do?
> 
> I've not really been very clear with the differentiation between a
> channel and what's multiplexed inside of the channel.
> 
> Using the terminology you defined in your other mail, are you saying
> that IPA (originally) allowed multiple *connections* to the device, or
> is there basically just one connection, with multiple (QMAP-muxed)
> *channels* on top of it?

One connection, with the ability to have multiple multiplexed
channels.

> If the latter, why did IPA need ioctls, rather than rmnet?

The "full" IPA driver supported a lot more than what is being
proposed right now.  The strategy for getting support upstream
was to drastically reduce the size of the driver by focusing
on a single use case:  providing a netdev data interface served
by the modem.

But even to support that, the IPA driver needed to allow user
space to identify certain resources that need to be used for
implementing that netdev, or configuring whether certain
features (e.g. download checksum) were to be used.

. . .

>> The hardware can aggregate multiple packets received from the
>> modem into a single buffer, which the rmnet driver is then able
>> to deaggregate.
> 
> Right, I gathered that much, but I'm not really sure I see why userspace
> would even be allowed to control this? Either the device is doing it or
> not, but the driver is going to have to cope either way?

Maybe because doing aggregation or not is a policy decision?
And/or a tunable parameter?  There might be a more appropriate
way to do this.

. . .

>> My goal continues to be getting a baseline IPA driver accepted
>> upstream as soon as possible, so I can then start building on
>> that foundation.
> 
> Yeah. My goal is actually the same, but for the Intel driver, but I
> don't have much code yet (it's being cleaned up now) :-)

Well then I guess I'll beat you to it (or I *hope* I do)...

					-Alex

> 
> johannes
> 
