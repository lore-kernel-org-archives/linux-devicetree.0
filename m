From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 10/11] staging: typec: fusb302: Hook up mux support
 using tcpc_gen_mux support
Date: Wed, 13 Sep 2017 08:38:55 -0500
Message-ID: <CAL_JsqLNByxG-S1hokoVVA7xeouQdTNkCOouGp=r8h8Sx5BMxw@mail.gmail.com>
References: <20170905164221.11266-1-hdegoede@redhat.com> <20170905164221.11266-11-hdegoede@redhat.com>
 <20170912222027.hzpejmmxkwbw6seu@rob-hp-laptop> <e3c8476e-9795-804b-b09f-812045d58976@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
In-Reply-To: <e3c8476e-9795-804b-b09f-812045d58976@redhat.com>
Sender: platform-driver-x86-owner@vger.kernel.org
To: Hans de Goede <hdegoede@redhat.com>
Cc: MyungJoo Ham <myungjoo.ham@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Guenter Roeck <linux@roeck-us.net>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Peter Rosin <peda@axentia.se>, Mathias Nyman <mathias.nyman@intel.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, devel@driverdev.osuosl.org, Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, Sathyanarayanan Kuppuswamy Natarajan <sathyaosid@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linux USB List <linux-usb@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Sep 13, 2017 at 3:56 AM, Hans de Goede <hdegoede@redhat.com> wrote:
> Hi,
>
>
> On 13-09-17 00:20, Rob Herring wrote:
>>
>> On Tue, Sep 05, 2017 at 06:42:20PM +0200, Hans de Goede wrote:
>>>
>>> Add mux support to the fusb302 driver, call devm_tcpc_gen_mux_create()
>>> to let the generic tcpc_mux_dev code create a tcpc_mux_dev for us.
>>>
>>> Also document the mux-names used by the generic tcpc_mux_dev code in
>>> our devicetree bindings.
>>>
>>> Cc: Rob Herring <robh+dt@kernel.org>
>>> Cc: Mark Rutland <mark.rutland@arm.com>
>>> Cc: devicetree@vger.kernel.org
>>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>>> ---
>>>   Documentation/devicetree/bindings/usb/fcs,fusb302.txt |  3 +++
>>>   drivers/staging/typec/fusb302/fusb302.c               | 11 ++++++++++-
>>>   2 files changed, 13 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/usb/fcs,fusb302.txt
>>> b/Documentation/devicetree/bindings/usb/fcs,fusb302.txt
>>> index 472facfa5a71..63d639eadacd 100644
>>> --- a/Documentation/devicetree/bindings/usb/fcs,fusb302.txt
>>> +++ b/Documentation/devicetree/bindings/usb/fcs,fusb302.txt
>>> @@ -6,6 +6,9 @@ Required properties :
>>>   - interrupts             : Interrupt specifier
>>>     Optional properties :
>>> +- mux-controls           : List of mux-ctrl-specifiers containing 1 or 2
>>> muxes
>>> +- mux-names              : "type-c-mode-mux" when using 1 mux, or
>>> +                           "type-c-mode-mux", "usb-role-mux" when using
>>> 2 muxes
>>
>>
>> I'm not sure this is the right place for this. The mux is outside the
>> FUSB302. In a type-C connector node or USB phy node would make more
>> sense to me.
>
>
> The mux certainly does not belong in the USB phy node, it sits between the
> USB PHY
> and the Type-C connector and can for example also mux the Type-C pins to a
> Display
> Port PHY.

Thinking about this some more, the mux(es) should be its own node(s).
Then the question is where to put the nodes.

> As for putting it in a type-C connector node, currently we do not have such
> a node,

Well, you should. Type-C connectors are certainly complicated enough
that we'll need one. Plus we already require connector nodes for
display outputs, so what do we do once you add display muxing?

> the closest thing we do have to a node describing it is actually the fusb302
> node
> itself. E.g. it may also contain a regulator to turn Vbus on / off (already
> there
> in the code, but I forgot to document this when I added the missing DT
> bindings
> doc for the fusb302 with a previous patch).

Either you can have a vbus-supply property in connector node or it can
be implied that the controller chip provides that. For example, HDMI
connectors have a hpd-gpios property if HPD is connected to GPIO or
they have nothing and it's implicit that the HDMI encoder handles HPD.


> Also these properties:
>
>>>   - fcs,max-sink-microvolt : Maximum voltage to negotiate when configured
>>> as sink
>>>   - fcs,max-sink-microamp  : Maximum current to negotiate when configured
>>> as sink
>>>   - fcs,max-sink-microwatt : Maximum power to negotiate when configured
>>> as sink
>
>
> Have more to do with the charger-IC used (which determines the limits) then
> with
> the fusb302 itself, but the fusb302 needs to know these as it negotiates the
> limits.

Those should probably be elsewhere and not be fusb302 specific. I did
ack that, but it was a single node for a single component which is
fine. But once we start adding more external pieces we need to pay
more attention to the overall structure.

> Likewise the fusb302 negotiates how the data pins will be used and thus to
> which pins
> on the SoC the mux should mux the data pins.
>
> TL;DR: The fusb302 does all the negotiation and ties all the Type-C
> connected
> ICs together, so this seems like the right place for it (it certainly is the
> natural place to put these from a driver code pov).

Things in DT should follow what the h/w design looks like which is not
necessarily aligned with the driver structure. If the USB PD chip
needs information from the charger, then we need a kernel interface
for that.

My concern here is not so much this binding in particular, but rather
that we handle Type-C connectors in a common way and not adhoc with
each platform doing things their own way. Otherwise, we end up with a
mess of platform specific bindings like charger/battery bindings
(though there's some work improving those).

Rob
