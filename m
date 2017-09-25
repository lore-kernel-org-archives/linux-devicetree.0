From: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v2 10/11] staging: typec: fusb302: Hook up mux support
 using tcpc_gen_mux support
Date: Mon, 25 Sep 2017 13:35:31 +0200
Message-ID: <1aa88cc3-b2ab-2308-1039-c1b7729c313b@redhat.com>
References: <20170905164221.11266-1-hdegoede@redhat.com>
 <20170905164221.11266-11-hdegoede@redhat.com>
 <20170912222027.hzpejmmxkwbw6seu@rob-hp-laptop>
 <e3c8476e-9795-804b-b09f-812045d58976@redhat.com>
 <CAL_JsqLNByxG-S1hokoVVA7xeouQdTNkCOouGp=r8h8Sx5BMxw@mail.gmail.com>
 <df2008cc-a73a-5898-1ade-e0c90c759584@redhat.com>
 <CAL_JsqJ=tonhAWp7eO79zTOzV6mu0ER6hPMigqyB754L1Z2UhA@mail.gmail.com>
 <e442bb48-a038-4e2e-6950-4220e28692d3@redhat.com>
 <3d207dc4-1dba-ce34-21af-bab001ec68c5@axentia.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
In-Reply-To: <3d207dc4-1dba-ce34-21af-bab001ec68c5@axentia.se>
Content-Language: en-US
Sender: platform-driver-x86-owner@vger.kernel.org
To: Peter Rosin <peda@axentia.se>, Rob Herring <robh@kernel.org>
Cc: MyungJoo Ham <myungjoo.ham@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Guenter Roeck <linux@roeck-us.net>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Mathias Nyman <mathias.nyman@intel.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, devel@driverdev.osuosl.org, Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, Sathyanarayanan Kuppuswamy Natarajan <sathyaosid@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linux USB List <linux-usb@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi,

On 25-09-17 12:34, Peter Rosin wrote:
> On 2017-09-13 17:48, Hans de Goede wrote:
>> Hi,
>>
>> On 13-09-17 17:07, Rob Herring wrote:
>>> On Wed, Sep 13, 2017 at 9:06 AM, Hans de Goede <hdegoede@redhat.com> wrote:
>>>> Hi,
>>>>
>>>>
>>>> On 13-09-17 15:38, Rob Herring wrote:
>>>>>
>>>>> On Wed, Sep 13, 2017 at 3:56 AM, Hans de Goede <hdegoede@redhat.com>
>>>>> wrote:
>>>>>>
>>>>>> Hi,
>>>>>>
>>>>>>
>>>>>> On 13-09-17 00:20, Rob Herring wrote:
>>>>>>>
>>>>>>>
>>>>>>> On Tue, Sep 05, 2017 at 06:42:20PM +0200, Hans de Goede wrote:
>>>>>>>>
>>>>>>>>
>>>>>>>> Add mux support to the fusb302 driver, call devm_tcpc_gen_mux_create()
>>>>>>>> to let the generic tcpc_mux_dev code create a tcpc_mux_dev for us.
>>>>>>>>
>>>>>>>> Also document the mux-names used by the generic tcpc_mux_dev code in
>>>>>>>> our devicetree bindings.
>>>>>>>>
>>>>>>>> Cc: Rob Herring <robh+dt@kernel.org>
>>>>>>>> Cc: Mark Rutland <mark.rutland@arm.com>
>>>>>>>> Cc: devicetree@vger.kernel.org
>>>>>>>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>>>>>>>> ---
>>>>>>>>      Documentation/devicetree/bindings/usb/fcs,fusb302.txt |  3 +++
>>>>>>>>      drivers/staging/typec/fusb302/fusb302.c               | 11
>>>>>>>> ++++++++++-
>>>>>>>>      2 files changed, 13 insertions(+), 1 deletion(-)
>>>>>>>>
>>>>>>>> diff --git a/Documentation/devicetree/bindings/usb/fcs,fusb302.txt
>>>>>>>> b/Documentation/devicetree/bindings/usb/fcs,fusb302.txt
>>>>>>>> index 472facfa5a71..63d639eadacd 100644
>>>>>>>> --- a/Documentation/devicetree/bindings/usb/fcs,fusb302.txt
>>>>>>>> +++ b/Documentation/devicetree/bindings/usb/fcs,fusb302.txt
>>>>>>>> @@ -6,6 +6,9 @@ Required properties :
>>>>>>>>      - interrupts             : Interrupt specifier
>>>>>>>>        Optional properties :
>>>>>>>> +- mux-controls           : List of mux-ctrl-specifiers containing 1 or
>>>>>>>> 2
>>>>>>>> muxes
>>>>>>>> +- mux-names              : "type-c-mode-mux" when using 1 mux, or
>>>>>>>> +                           "type-c-mode-mux", "usb-role-mux" when
>>>>>>>> using
>>>>>>>> 2 muxes
>>>>>>>
>>>>>>>
>>>>>>>
>>>>>>> I'm not sure this is the right place for this. The mux is outside the
>>>>>>> FUSB302. In a type-C connector node or USB phy node would make more
>>>>>>> sense to me.
>>>>>>
>>>>>>
>>>>>>
>>>>>> The mux certainly does not belong in the USB phy node, it sits between
>>>>>> the
>>>>>> USB PHY
>>>>>> and the Type-C connector and can for example also mux the Type-C pins to
>>>>>> a
>>>>>> Display
>>>>>> Port PHY.
>>>>>
>>>>>
>>>>> Thinking about this some more, the mux(es) should be its own node(s).
>>>>> Then the question is where to put the nodes.
>>>>
>>>>
>>>> Right, the mux will be its own node per
>>>> Documentation/devicetree/bindings/mux/mux-controller.txt
>>>> the bindings bit this patch is adding is only adding phandles pointing
>>>> to that mux-node as the fusb302 "consumes" the mux functionality.
>>>>
>>>> So as such (the fusb302 is the component which should control the mux)
>>>> I do believe that the bindings this patch adds are correct.
>>>
>>> Humm, that's not how the mux binding works. The mux controller is what
>>> drives the mux select lines and is the provider. The consumer is the
>>> mux device itself. What decides the mux state is determined by what
>>> you are muxing, not which node has mux-controls property.
>>>
>>> By putting mux-controls in fusb302 node, you are saying fusb302 is a
>>> mux (or contains a mux).
>>>
>>>
>>>>>> As for putting it in a type-C connector node, currently we do not have
>>>>>> such
>>>>>> a node,
>>>>>
>>>>>
>>>>> Well, you should. Type-C connectors are certainly complicated enough
>>>>> that we'll need one. Plus we already require connector nodes for
>>>>> display outputs, so what do we do once you add display muxing?
>>>>
>>>>
>>>> An interesting question, I'm working on this for x86 + ACPI boards actually,
>>>> not a board using DT I've been adding DT bindings docs for device-properties
>>>> I use because that seems like the right thing to do where the binding is
>>>> obvious
>>>> (which I believe it is in this case as the fusb302 is the mux consumer) and
>>>> because the device-property code should work the same on x86 + ACPI
>>>> (where some platform-specific drivers attach the device properties) and
>>>> on e.g. ARM + DT.
>>>>
>>>> The rest should probably be left to be figured out when an actual DT
>>>> using device using the fusb302 or another Type-C controller shows up.
>>>
>>> Well this is a new one (maybe, I suppose others have sneaked by). If
>>> ACPI folks want to use DT bindings, then what do I care. But I have no
>>> interest in reviewing ACPI properties. The whole notion of sharing
>>> bindings between DT and ACPI beyond anything trivial is flawed IMO.
>>> The ptifalls have been discussed multiple times before, so I'm not
>>> going to repeat them here.
>>
>> Ok, so shall I just drop the Documentation/devicetree/bindings/usb/fcs,fusb302.txt
>> part of this patch then ?
> 
> I totally agree with the concern that Rob expressed about handling USB C
> muxes in a non-adhoc way. And this makes this series scary. I don't know
> enough details about USB C muxes and PD (I just have a very superficial
> mental model) to tell if this series is going down the right path. Or
> how terrible it will be to fix things up if not?
> 
> The series extends the mux subsystem with muxes that pins semantics
> to specific states. That is new, and shows up exactly here when Rob is
> not happy about the binding. And if Rob does not want this in the
> DT bindings then I'm not so sure it is wise to do it at all? This
> problem doesn't go away just because you remove the binding. I think
> I would feel much better if there was a path forward on how to
> represent USB C muxes in DT and how that would fit with the driver
> structure.
> 
> If you compare to the i2c-muxes, there is a relatively new i2c-mux-gpmux
> driver that uses some general purpose mux from the mux subsystem to
> implement an i2c-mux. If USB C muxes where to be done similarly, I'd
> imagine there should be a general abstraction of what USB C muxes provide
> somewhere outside of the mux subsystem, and a bunch of implementations
> of that abstraction. One of those implementations could be to use "raw"
> muxes from the mux subsystem. Of course, this is not what this series is
> doing.
> 
> Also, muxes that are not general purpose such as the ones added to the
> mux subsystem by this series could perhaps be repurposed for some other
> application, but since the interface implemented does not really obey
> the rules (the provided mux controller interacts with different sets of
> signals depending on the state) this will not be possible.
> 
> These issues are what has caused me to do a lot of thinking and to sit
> silent, sorry about that, but I would like input from someone more
> experienced. If possible. But I'm not sure where to turn?
> 
> As a crazy example, why is it not possible to hook up one signal pair
> from the USB C mux, not to DP, but instead to some I2C controller? Then,
> if done right, i2c-mux-gpmux could be hooked up with the relevant mux
> controller and use the signal pair for I2C, with the mux controller
> acting as a gate. So, maybe a bit crazy, but something like that is how
> I think it should work from the mux subsystem point of view. And while
> maybe crazy and while it might not be technically possible to do I2C
> over a USB C connector for some reason, I do think that whatever
> abstraction you come up with for USB C muxes, it has to deal with and
> broker requests from both the USB subsystem and whatever other
> subsystems deals with the alt pairs. Be it graphics for DP signals, or
> whatever. IIUC, the alt signals need not be graphics, and it would be
> sad to implement the USB C mux it in a way that makes it hard to use
> the alt pairs for something else.
> 
> [maybe my understanding of USB C is just wrong]

So 2 things:

1) The Type-C subsys does actually abstract the mux outside of the
Type-C port-manager (TCPM) core in the form of a tcpc_mux_dev, so for
DT based platforms we could instantiate a tcpc_mux_dev from a node
which then represents the mux as usual.

2) What is very different from how the mux subsys currently is used,
is who is in control of the mux. Currently a subsys which wants to
route data through the mux selects the mux in the right mode, and
then deselects it when done. This assumes that the mux can mux
the data paths to the requested destination at all times, just not
to multiple destinations at once. With Type-C and any moment in
time, there really is only one correct setting as the mux is
connect to a Type-C device on the other side which typically
only has one config. So what happens with Type-C is that the TCPM
negotiates with the externally connected Type-C device, and then
sets the mux to the one and only correct setting for that device
to be fully functional.

So your i2c example, for example, will not work with the normal
way where the i2c subsys asks the mux to mux a data-pair to the i2c
controller, as that only makes sense when your theoretical Type-C
device which talks i2c over a pair is connected externally, where
as when something else is connected then trying to talk i2c might
even damage the connected device. So with Type-C it is the TCPM
and only the TCPM which controls the mux.

Regards,

Hans
