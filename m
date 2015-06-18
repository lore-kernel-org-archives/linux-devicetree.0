From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH 1/8] of: overlay: Implement indirect target support
Date: Wed, 17 Jun 2015 21:21:42 -0700
Message-ID: <55824756.7030009@roeck-us.net>
References: <1434138905-15886-1-git-send-email-pantelis.antoniou@konsulko.com> <1434138905-15886-2-git-send-email-pantelis.antoniou@konsulko.com> <CAL_JsqJgd6=xH_M7+KHc9kPqoJgg_XMi2BWw4MkO1Exma5kqiA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_JsqJgd6=xH_M7+KHc9kPqoJgg_XMi2BWw4MkO1Exma5kqiA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Cc: Grant Likely <grant.likely@secretlab.ca>, Matt Porter <mporter@konsulko.com>, Koen Kooi <koen@dominion.thruhere.net>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Pantelis Antoniou <panto@antoniou-consulting.com>
List-Id: devicetree@vger.kernel.org

On 06/17/2015 05:10 PM, Rob Herring wrote:
> On Fri, Jun 12, 2015 at 2:54 PM, Pantelis Antoniou
> <pantelis.antoniou@konsulko.com> wrote:
>> Some applications require applying the same overlay to a different
>> target according to some external condition (for instance depending
>> on the slot a card has been inserted, the overlay target is different).
>>
>> The indirect target use requires using the new
>> of_overlay_create_indirect() API which uses a text selector.
>>
>> The format requires the use of a target-indirect node as follows:
>>
>>          fragment@0 {
>>                  target-indirect {
>>                          foo { target = <&foo_target>; };
>>                          bar { target = <&bar_target>; };
>>                  };
>>          };
>
> The problem with this is it does not scale. The overlay has to be
> changed for every new target. If you had an add-on board (possibly

Not really. For our use case, at least, each target is a slot in the
chassis, so we end up with something like

		target-indirect {
			slot0 { target = <&sib0i2c>; };
			slot1 { target = <&sib1i2c>; };
			slot2 { target = <&sib2i2c>; };
			slot3 { target = <&sib3i2c>; };
			slot4 { target = <&sib4i2c>; };
			slot5 { target = <&sib5i2c>; };
			slot6 { target = <&sib6i2c>; };
			slot7 { target = <&sib7i2c>; };
			slot8 { target = <&sib8i2c>; };
		};

where sib[0-8]i2c is defined in the master dts file.

Since the number of slots is well defined, the overlay will
always work. Sure, it may have to be updated if it is used in
a chassis with 20 slots, but that doesn't happen that often.

> providing an overlay from an EEPROM), you would not want to have to
> rebuild overlays with every new host board. It also only handles
> translations of where to apply the overlay, but doesn't provide
> translations of phandles within the overlay. Say a node that is a
> clock or regulator consumer for example. Or am I missing something.
>
> Grant and I discussed this briefly. I think we need a connector
> definition in the base dtb which can provide the target for an
> overlay. The connector should provide the translation between
> connector local signals/buses and host signals/buses. We need to
> define what this translation would look like for each binding.
>
> At least for GPIO, we could have something similar to interrupt-map
> properties. For example, to map connector gpio 0 to host gpio 66 and
> connector gpio 1 to host gpio 44:
>
> gpio-map = <0 &host-gpio 66>, <1 &host-gpio 44>;
>
> We'd need to define how to handle I2C, SPI, regulators, and clocks
> minimally. Perhaps rather than trying to apply nodes into the base
> dtb, they should be under the connector and the kernel has to learn to
> not just look for child nodes for various bindings. Just thinking
> aloud...
>
Anything is fine with me, as long as it is usable (and does not require
us to create 9 overlay files for sib[0-8] from the example above).

The real tricky part is pci, where it is not just about simple target
redirection but irq numbers, memory address ranges, and bus number ranges.
It would be quite useful to have a workable solution for that as well,
but at least I don't have an idea how it could be done.

Talking about connector ...

Right now we have something like

	sib0 {
             compatible = "jnx,sib-connector", "simple-bus";
	    ... (various properties)
	};

Maybe we could use something like the following ?

	sib0 {
             compatible = "jnx,sib-connector", "simple-bus";
	    ... (various attributes)
	    ref0 = <&sib0i2c>;
	    ref1 = <&sib0spi>;
	};

and then just reference ref0 and ref1 as targets in the overlay itself ?

Guenter
