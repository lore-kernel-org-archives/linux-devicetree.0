From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [PATCH 5/5] net: phy: dp83867: Use unsigned variables to store
 unsigned properties
Date: Mon, 13 May 2019 22:12:58 +0200
Message-ID: <b246b18d-5523-7b8b-9cd0-b8ccb8a511e9@gmail.com>
References: <20190510214550.18657-1-tpiepho@impinj.com>
 <20190510214550.18657-5-tpiepho@impinj.com>
 <49c6afc4-6c5b-51c9-74ab-9a6e8c2460a5@gmail.com>
 <3a42c0cc-4a4b-e168-c03e-1cc13bd2f5d4@gmail.com>
 <1557777496.4229.13.camel@impinj.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1557777496.4229.13.camel@impinj.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Trent Piepho <tpiepho@impinj.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>
Cc: "f.fainelli@gmail.com" <f.fainelli@gmail.com>, "andrew@lunn.ch" <andrew@lunn.ch>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 13.05.2019 21:58, Trent Piepho wrote:
> On Sat, 2019-05-11 at 14:32 +0200, Heiner Kallweit wrote:
>> On 11.05.2019 12:41, Heiner Kallweit wrote:
>>> On 10.05.2019 23:46, Trent Piepho wrote:
>>>> The variables used to store u32 DT properties were signed
>>>> ints.  This
>>>> doesn't work properly if the value of the property were to
>>>> overflow.
>>>> Use unsigned variables so this doesn't happen.
>>>>
>>>
>>> In patch 3 you added a check for DT properties being out of range.
>>> I think this would be good also for the three properties here.
>>> The delay values are only 4 bits wide, so you might also consider
>>> to switch to u8 or u16.
>>>
>>
>> I briefly looked over the rest of the driver. What is plain wrong
>> is to allocate memory for the private data structure in the
>> config_init callback. This has to be done in the probe callback.
>> An example is marvell_probe(). As you seem to work on this driver,
>> can you provide a patch for this?
> 
> It only allocates the data once, so it is not a memory leak.  But yes,
> totally wrong place to do it.  I can fix this.  It also does not set
> the signal line impedance from DT value unless unless also configuring
> clock skew, even though they are orthogonal concepts.  And fails to
> verify anything read from the DT.
> 
> Perhaps you could tell me if the approach I've taken in patch 3, 
> "Add ability to disable output clock", and patch 4, "Disable tx/rx
> delay when not configured", are considered acceptable?  I can conceive
> of arguments for alternate approaches.  I would like to add support for
>  these into u-boot too, but typically u-boot follows the kernel DT
> bindings, so I want to finalize the kernel DT semantics before sending
> patches to u-boot.
> 
I lack experience with these TI PHY's. Maybe Andrew or Florian can advise.

>>> Please note that net-next is closed currently. Please resubmit the
>>> patches once it's open again, and please annotate them properly
>>> with net-next.
> 
> Sorry, didn't know about this policy.  Been years since I've submitted
> net patches.  Is there a description somewhere of how this is done? 
> Googling net-next wasn't helpful.  I gather new patches are only
> allowed when the kernel merge window is open?  And they can't be queued
> on patchwork or a topic branch until this happens?
> 
https://www.kernel.org/doc/Documentation/networking/netdev-FAQ.txt

And the easy way to check whether net-next is open:
http://vger.kernel.org/~davem/net-next.html
