From: Alex Elder <elder@linaro.org>
Subject: Re: [PATCH v2 00/17] net: introduce Qualcomm IPA driver
Date: Mon, 24 Jun 2019 11:21:37 -0500
Message-ID: <db34aa39-6cf1-4844-1bfe-528e391c3729@linaro.org>
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
 <d533b708-c97a-710d-1138-3ae79107f209@linaro.org>
 <abdfc6b3a9981bcdef40f85f5442a425ce109010.camel@sipsolutions.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <abdfc6b3a9981bcdef40f85f5442a425ce109010.camel@sipsolutions.net>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Johannes Berg <johannes@sipsolutions.net>, Arnd Bergmann <arnd@arndb.de>, Dan Williams <dcbw@redhat.com>
Cc: Subash Abhinov Kasiviswanathan <subashab@codeaurora.org>, abhishek.esse@gmail.com, Ben Chan <benchan@google.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, cpratapa@codeaurora.org, David Miller <davem@davemloft.net>, DTML <devicetree@vger.kernel.org>, Eric Caruso <ejcaruso@google.com>, evgreen@chromium.org, Ilias Apalodimas <ilias.apalodimas@linaro.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-arm-msm@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-soc@vger.kernel.org, Networking <netdev@vger.kernel.org>, syadagir@codeaurora.org
List-Id: devicetree@vger.kernel.org

On 6/18/19 2:03 PM, Johannes Berg wrote:
> On Tue, 2019-06-18 at 08:45 -0500, Alex Elder wrote:
> 
>> If it had a well-defined way of creating new channels to be
>> multiplexed over the connection to the modem, the IPA driver
>> (rather than the rmnet driver) could present network interfaces
>> for each and perform the multiplexing.  
> 
> Right. That's what I was thinking of.

. . .

>> But I think the IPA driver would register with the WWAN core as
>> a "provider," and then the WWAN core would subsequently request
>> that it instantiate netdevices to represent channels on demand
>> (rather than registering them).
> 
> Yeah, I guess you could call it that way.
> 
> Really there are two possible ways (and they intersect to some extent).
> 
> One is the whole multi-function device, where a single WWAN device is
> composed of channels offered by actually different drivers, e.g. for a
> typical USB device you might have something like cdc_ether and the
> usb_wwan TTY driver. In this way, we need to "compose" the WWAN device
> similarly, e.g. by using the underlying USB device "struct device"
> pointer to tie it together.

I *think* this model makes the most sense.  But at this point
it would take very little to convince me otherwise...  (And then
I saw Arnd's message advocating the other one, unfortunately...)

> The other is something like IPA or the Intel modem driver, where the
> device is actually a single (e.g. PCIe) device and just has a single
> driver, but that single driver offers different channels.

What I don't like about this is that it's more monolithic.  It
seems better to have the low-level IPA or Intel modem driver (or
any other driver that can support communication between the AP
and WWAN device) present communication paths that other function-
specific drivers can attach to and use.

> Now, it's not clear to me where IPA actually falls, because so far we've
> been talking about the IPA driver only as providing *netdevs*, not any
> control channels, so I'm not actually sure where the control channel is.

There is user space code that handles all of this, and as far as I
can tell, parts of it will always remain proprietary.

> For the Intel device, however, the control channel is definitely
> provided by exactly the same driver as the data channels (netdevs).

I do see the need for a control interface.  But I suspect it
would *overlap* with what you describe and might need to be more
general and/or extensible.  Are there control channels specific to
use for a modem--like a "modem control interface" or something?
Is there something broader, like "this WWAN device supports
functions A, and B with protocols X, Y; please open a connection
to A with protocol X."  Do both exist?  I'm just trying to contain
whatever a "control channel" really represents, and what it would
be associated with.

> "provider" is a good word, and in fact the Intel driver would also be a
> provider for a GNSS channel (TBD how to represent, a tty?), one or
> multiple debug/tracing channels, data channels (netdevs), AT command
> channels (mbim, ...?) (again tbd how to represent, ttys?), etc.

Yes, this is much clearer to me now.

> What I showed in the header files I posted so far was the provider only
> having "data channel" ops (create/remove a netdev) but for each channel
> type we either want a new method there, or we just change the method to
> be something like
> 
> 	int (*create_channel)(..., enum wwan_chan_type chan_type, ...);
> 
> and simply require that the channel is attached to the wwan device with
> the representation-specific call (wwan_attach_netdev, wwan_attach_tty,
> ...).

Or maybe have the WWAN device present interfaces with attributes,
and have drivers that are appropriate for each interface attach
to only the ones they recognize they support.

					-Alex

> This is a bit less comfortable because then it's difficult to know what
> was actually created upon the request, so it's probably better to have
> different methods for the different types of representations (like I had
> - add_netdev, add_tty, ...).
> 
> Note also that I said "representation-specific", while passing a
> "channel type", so for this we'd actually need a convention on what
> channel type has what kind of representation, which again gets awkward.
> Better to make it explicit.
> 
> (And even then, we might be able to let userspace have some control,
> e.g. the driver might be able to create a debug channel as both a TTY or
> something else)
> 
> johannes
> 
