From: "Andrew F. Davis" <afd@ti.com>
Subject: Re: [PATCH v3 4/5] regulators: tps65912: Add regulator driver for the
 TPS65912 PMIC
Date: Wed, 30 Sep 2015 15:29:30 -0500
Message-ID: <560C462A.1000707@ti.com>
References: <1443106374-4126-1-git-send-email-afd@ti.com>
 <1443106374-4126-5-git-send-email-afd@ti.com>
 <20150925180533.GN30445@sirena.org.uk> <5605AA1C.3090905@ti.com>
 <20150929151320.GT30445@sirena.org.uk> <560AD3B2.1070102@ti.com>
 <20150929183818.GA15635@sirena.org.uk> <560ADF61.9030105@ti.com>
 <20150930172844.GF15635@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <20150930172844.GF15635@sirena.org.uk>
Sender: linux-gpio-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Lee Jones <lee.jones@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Samuel Ortiz <sameo@linux.intel.com>, Liam Girdwood <lgirdwood@gmail.com>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 09/30/2015 12:28 PM, Mark Brown wrote:
> On Tue, Sep 29, 2015 at 01:58:41PM -0500, Andrew F. Davis wrote:
>> On 09/29/2015 01:38 PM, Mark Brown wrote:
>
>>> Oh, ick.  The binding has a compatible string in the individual
>>> regulator bindings which is broken unless there really are lots of
>>> variants being configured via DT (which is just not the case here).
>>> It's not only more typing in the DT,
>
>> I don't see this, the alternative is matching to this "regulator-compatible",
>> why not just use the existing compatible.
>
> No, you don't need to use regulator-compatible - that's deprecated.
> Just use the node names.
>

Are we sure matching on node names is a good idea? Most are just arbitrary
names meant to be human readable and reference-able, giving them function
may lead to confusion. This seems to be why we have "compatible", for specific
identification of node function. But I'm new so maybe I'm wrong?

>>> it also means that we can't read
>>> back the configuration of the device unless the user goes and creates a
>>> DT which explicitly lists each regulator on the device which is
>>> unhelpful.  We should be able to read back the configurations of all the
>>> regulators by simply listing the device in DT.
>
>> Could you expand this? I'm not sure I understand why we still cant do this
>> using this new way.
>
> I'm not sure what there is to add...  if the regulator is only
> instantiated when it features in the device tree then obviously it must
> be included in the device to be instantiated.
>

This is already the case then, missing regulator nodes in old drivers will not
get instantiated ether. And old drivers don't always store any more info about
available regulators than mine does.

>> Bindings should have compatible strings when they describe hardware like this,
>> we can then do stuff like put the LDO and DCDC drivers in separate modules for
>> instance, letting DT only load what we need. There are other benefits like
>> not having to search our own DT binding for data, and we only get probed for
>> devices in the DT.
>
> Only getting probed for device is in DT is exactly the problem here, and
> nothing prevents us having separate modules for things without
> enumerating everything in DT.
>

Sure, but then we have to do some fiddling with MFD_CORE to do that work,
why not remove the dependency and let DT do that for DT only drivers?

>> This also eliminates the need for MFD_CORE, we just call
>> of_platform_populate on ourself and DT helpers do the rest. Why hard code
>> mfd_cell's and do matching when DT does the same thing.
>
> Putting everything in DT means more work for people integrating the
> device and means that we have to have a full and complete understanding
> of the device at the time we write the DT, including decions about how
> we split the functionality of the device between subsystems.
>

We are not adding anything extra to the DT node, we just use the "compatible"
string to identify and match the node vs. "regulator-name", or the nodes name,
or whatever else has been used. The node is then just filled with the standard
optional properties just like every other driver's node.

>>> The fact that this is different to the bindings for other regulator
>>> drivers and requires more code ought to have been a big warning sign
>>> here :(
>
>> The binding is the same as the new tps65218 driver, different isn't always
>> a warning sign. And what do you mean "requires more code"? This regulator
>> driver is smaller than almost any other. DT takes care of everything for
>> us relating to hardware instantiation like it should.
>
> That's not a new driver, it's from more than a year ago (before or about
> the same time the helpers got added IIRC).
>

Newer than a lot, I chose to base my driver off of that not just because
it is a similar TI part, but because it was the cleanest, simplest looking
one IMHO. The helpers would require more code (you need to know how many
regulators you have and call the helpers in a loop).

I have another PMIC I'm about to push a driver for when this gets figured out
that does the same thing, and it's more important I think to do it this way for
this new part. Some of the new regulators are designed without a dedicated
SOC or board to power in mind, so they will have a whole bunch for different
regulator types on one chip and it will be up to the designer to pick which ones
to turn on and use. With this DT approach you can just list the ones you want,
and we may even be able to split different types into different modules, then
we can use the same regulator driver in different spins of the PMIC with more
or less of that type of regulator, we just add that same node under a different
parent PMIC driver.

I could use the helper with this style and save a couple lines of code if we
could make regulator_of_get_init_data to also match on "compatible", it
currently only matches on "regulator-compatible" or the node name. I could make
this addition and send the patch if you would like to see what I have in mind.
