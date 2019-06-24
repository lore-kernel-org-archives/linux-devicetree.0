From: Alex Elder <elder@linaro.org>
Subject: Re: [PATCH v2 00/17] net: introduce Qualcomm IPA driver
Date: Mon, 24 Jun 2019 11:21:28 -0500
Message-ID: <cf4e990c-1a59-802b-7565-4d7c876416b9@linaro.org>
References: <380a6185-7ad1-6be0-060b-e6e5d4126917@linaro.org>
 <a94676381a5ca662c848f7a725562f721c43ce76.camel@sipsolutions.net>
 <CAK8P3a0kV-i7BJJ2X6C=5n65rSGfo8fUiC4J_G-+M8EctYKbkg@mail.gmail.com>
 <fc0d08912bc10ad089eb74034726308375279130.camel@redhat.com>
 <36bca57c999f611353fd9741c55bb2a7@codeaurora.org>
 <153fafb91267147cf22e2bf102dd822933ec823a.camel@redhat.com>
 <CAK8P3a2Y+tcL1-V57dtypWHndNT3eDJdcKj29c_v+k8o1HHQig@mail.gmail.com>
 <f4249aa5f5acdd90275eda35aa16f3cfb29d29be.camel@redhat.com>
 <CAK8P3a2nzZKtshYfomOOSYkqx5HdU15Wr9b+3va0B1euNhFOAg@mail.gmail.com>
 <dbb32f185d2c3a654083ee0a7188379e1f88d899.camel@sipsolutions.net>
 <e6ba8a9063e63506c0b88a70418d74ca4efe85cd.camel@sipsolutions.net>
 <850eed1d-0fec-c396-6e91-b5f1f8440ded@linaro.org>
 <967604dd8d466a99b865649174f8b9cd34b2560e.camel@sipsolutions.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <967604dd8d466a99b865649174f8b9cd34b2560e.camel@sipsolutions.net>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Johannes Berg <johannes@sipsolutions.net>, Arnd Bergmann <arnd@arndb.de>, Dan Williams <dcbw@redhat.com>
Cc: Subash Abhinov Kasiviswanathan <subashab@codeaurora.org>, abhishek.esse@gmail.com, Ben Chan <benchan@google.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, cpratapa@codeaurora.org, David Miller <davem@davemloft.net>, DTML <devicetree@vger.kernel.org>, Eric Caruso <ejcaruso@google.com>, evgreen@chromium.org, Ilias Apalodimas <ilias.apalodimas@linaro.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-arm-msm@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-soc@vger.kernel.org, Networking <netdev@vger.kernel.org>, syadagir@codeaurora.org
List-Id: devicetree@vger.kernel.org

On 6/18/19 1:48 PM, Johannes Berg wrote:
> Just to add to Dan's response, I think he's captured our discussions and
> thoughts well.
> 
>> First, a few terms (correct or improve as you like):
> 
> Thanks for defining, we don't do that nearly often enough.
> 
>> - WWAN device is a hardware device (like IPA) that presents a
>>   connection between AP and modem, and presents an interface
>>   that allows the use of that connection to be managed.
> 
> Yes. But I was actually thinking of a "wwan_dev" to be a separate
> structure, not *directly* owned by a single driver and used to represent
> the hardware like a (hypothetical) "struct ipa_dev".

I think you're talking about creating a coordination interface
that allows multiple drivers to interact with a WWAN device,
which might implement several independent features.

>> - WWAN netdevice represents a Linux network interface, with its
>>   operations and queues, etc., but implements a standardized
>>   set of WWAN-specific operations.  It represents a logical
>> ' channel whose data is multiplexed over the WWAN device.
> 
> I'm not sure I'd asy it has much WWAN-specific operations? But yeah, I
> guess it might.

I want to withdraw this notion of a "WWAN netdevice"...

>> - WWAN channel is a user space abstraction that corresponds
>>   with a WWAN netdevice (but I'm not clear on all the ways
>>   they differ or interact).
> 
> As Dan said, this could be a different abstraction than a netdevice,
> like a TTY, etc.

Right, I get that now.

. . .

>> - Which WWAN channel attributes must be set *before* the
>>   channel is activated, and can't be changed?  Are there any
>>   that can be changed dynamically?
> 
> It's a good question. I threw a "u32 pdn" in there, but I'm not actually
> sure that's what you *really* need?
> 
> Maybe the modem and userspace just agree on some arbitrary "session
> identifier"? Dan mentions "MUX ID" or "MBIM Session ID", maybe there
> really is no good general term for this and we should just call it a
> "session identifier" and agree that it depends on the control protocol
> (MBIM vs. QMI vs. ...)?
> 
>> And while the whole point of this is to make things generic,
>> it might be nice to have a way to implement a new feature
>> before it can be "standardized".
> 
> Not sure I understand this?

I'm talking about a way to experiment with new functionality in a
way that's explicitly not part of the interface.  But doing that
isn't necessary and it's probably not a good idea anyway.

> FWIW, I actually came to this because we want to upstream a driver for
> an Intel modem, but ... can't really make up our mind on whether or not
> to use VLAN tags, something like rmnet (but we obviously cannot use
> rmnet, so that'd be another vendor specific interface like rmnet), or
> sysfs, or any of the other methods we have today ... :-)

OK cool then we have some common needs.   Let's get this defined so
we can use it for both!

					-Alex

> 
> johannes
> 
