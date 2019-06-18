From: Alex Elder <elder@linaro.org>
Subject: Re: [PATCH v2 00/17] net: introduce Qualcomm IPA driver
Date: Tue, 18 Jun 2019 08:45:26 -0500
Message-ID: <d533b708-c97a-710d-1138-3ae79107f209@linaro.org>
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
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <dbb32f185d2c3a654083ee0a7188379e1f88d899.camel@sipsolutions.net>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Johannes Berg <johannes@sipsolutions.net>, Arnd Bergmann <arnd@arndb.de>, Dan Williams <dcbw@redhat.com>
Cc: Subash Abhinov Kasiviswanathan <subashab@codeaurora.org>, abhishek.esse@gmail.com, Ben Chan <benchan@google.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, cpratapa@codeaurora.org, David Miller <davem@davemloft.net>, DTML <devicetree@vger.kernel.org>, Eric Caruso <ejcaruso@google.com>, evgreen@chromium.org, Ilias Apalodimas <ilias.apalodimas@linaro.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-arm-msm@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-soc@vger.kernel.org, Networking <netdev@vger.kernel.org>, syadagir@codeaurora.org
List-Id: devicetree@vger.kernel.org

On 6/17/19 6:42 AM, Johannes Berg wrote:
> On Wed, 2019-06-12 at 17:06 +0200, Arnd Bergmann wrote:
>> On Wed, Jun 12, 2019 at 4:28 PM Dan Williams <dcbw@redhat.com> wrote:
>>> On Wed, 2019-06-12 at 10:31 +0200, Arnd Bergmann wrote:
>>>> On Tue, Jun 11, 2019 at 7:23 PM Dan Williams <dcbw@redhat.com> wrote:
>>>
>>> I was trying to make the point that rmnet doesn't need to care about
>>> how the QMAP packets get to the device itself; it can be pretty generic
>>> so that it can be used by IPA/qmi_wwan/rmnet_smd/etc.
>>
>> rmnet at the moment is completely generic in that regard already,
>> however it is implemented as a tunnel driver talking to another
>> device rather than an abstraction layer below that driver.
> 
> It doesn't really actually *do* much other than muck with the headers a
> small amount, but even that isn't really much.
> 
> You can probably implement that far more efficiently on some devices
> where you have a semi-decent DMA engine that at least supports S/G.

If it had a well-defined way of creating new channels to be
multiplexed over the connection to the modem, the IPA driver
(rather than the rmnet driver) could present network interfaces
for each and perform the multiplexing.  As I think Arnd
suggested, this could at least partially be done with library
code (to be shared with other "back-end" interfaces) rather
than using a layered driver.  This applies to aggregation,
channel flow control, and checksum offload as well.

But I'm only familiar with IPA; I don't know whether the above
statements make any sense for other "back-end" drivers.

>>>> I understand that the rmnet model was intended to provide a cleaner
>>>> abstraction, but it's not how we normally structure subsystems in
>>>> Linux, and moving to a model more like how wireless_dev works
>>>> would improve both readability and performance, as you describe
>>>> it, it would be more like (ignoring for now the need for multiple
>>>> connections):
>>>>
>>>>    ipa_dev
>>>>         rmnet_dev
>>>>                wwan_dev
>>>>                       net_device
>>>
>>> Perhaps I'm assuming too much from this diagram but this shows a 1:1
>>> between wwan_dev and "lower" devices.
> 
> I guess the fuller picture would be something like
> 
> ipa_dev
> 	rmnet_dev
> 		wwan_dev
> 			net_device*
> 
> (i.e. with multiple net_devices)
> 
>>> What Johannes is proposing (IIRC) is something a bit looser where a
>>> wwan_dev does not necessarily provide netdev itself, but is instead the
>>> central point that various channels (control, data, gps, sim card, etc)
>>> register with. That way the wwan_dev can provide an overall view of the
>>> WWAN device to userspace, and userspace can talk to the wwan_dev to ask
>>> the lower drivers (ipa, rmnet, etc) to create new channels (netdev,
>>> tty, otherwise) when the control channel has told the modem firmware to
>>> expect one.
> 
> Yeah, that's more what I had in mind after all our discussions (will
> continue this below).

This is great.  The start of a more concrete discussion of the
pieces that are missing...

>> Right, as I noted above, I simplified it a bit. We probably want to
>> have multiple net_device instances for an ipa_dev, so there has
>> to be a 1:n relationship instead of 1:1 at one of the intermediate
>> levels, but it's not obvious which level that should be.
>>
>> In theory we could even have a single net_device instance correspond
>> to the ipa_dev, but then have multiple IP addresses bound to it,
>> so each IP address corresponds to a channel/queue/napi_struct,
>> but the user visible object remains a single device.
> 
> I don't think this latter (multiple IP addresses) works well - you want
> a hardware specific header ("ETH_P_MAP") to carry the channel ID,
> without looking up the IP address and all that.

I agree with this.  It's not just multiple IP addresses for
an interface, it really is multiplexed--with channel ids.
It's another addressing parameter orthogonal to the IP space.

> But anyway, as I alluded to above, I had something like this in mind:
> 
> driver_dev
>   struct device *dev (USB, PCI, ...)
>   net_device NA
>   net_device NB
>   tty TA
>  ...
> 
> (I'm cutting out the rmnet layer here for now)
> 
> while having a separate that just links all the pieces together:
> 
> wwan_device W
>   ---> dev
>   ---> NA
>   ---> NB
>   ---> TA
> 
> So the driver is still responsible for creating the netdevs (or can of
> course delegate that to an "rmnet" library), but then all it also does
> is register the netdevs with the WWAN core like
> 
> 	wwan_add_netdev(dev, NA)
> 
> and the WWAN core would allocate the wwan_device W for this.

That would be nice.  I believe you're saying that (in my case)
the IPA driver creates and owns the netdevices.

But I think the IPA driver would register with the WWAN core as
a "provider," and then the WWAN core would subsequently request
that it instantiate netdevices to represent channels on demand
(rather than registering them).

> That way, the drivers can concentrate on providing all the necessary
> bits, and - crucially - even *different* drivers can end up linking to
> the same wwan_device. For example, if you have a modem that has a multi-
> function USB device, then an ethernet driver might create the netdev and
> a tty driver might create the control channel, but if they both agree on
> using the right "struct device" instance, you can still get the correct
> wwan_device out of it all.
> 
> And, in fact, some should then be
> 
> 	wwan_maybe_add_netdev(dev, N)
> 
> because the ethernet driver may not know if it attached to a modem or
> not, but if the control channel also attaches it's a modem for sure,
> with that ethernet channel attached to it.
> 
> Additionally, I'm thinking API such as
> 
> 	wwan_add(dev, &ops, opsdata)
> 
> that doesn't automatically attach any channels, but provides "ops" to
> the core to create appropriate channels. I think this latter would be
> something for IPA/rmnet to use, perhaps for rmnet to offer the right ops
> structure.

Yes, that's more like what I meant above.  I see you're thinking
as you write...

					-Alex
> 
> johannes
> 
