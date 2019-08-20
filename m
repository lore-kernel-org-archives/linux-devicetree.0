From: Frank Rowand <frowand.list@gmail.com>
Subject: Re: [PATCH v7 3/7] of/platform: Add functional dependency link from
 DT bindings
Date: Mon, 19 Aug 2019 21:26:13 -0700
Message-ID: <15ab4fb0-7e69-9cc1-4a79-cff06767f7d9@gmail.com>
References: <20190724001100.133423-1-saravanak@google.com>
 <20190724001100.133423-4-saravanak@google.com>
 <141d2e16-26cc-1f05-1ac0-6784bab5ae88@gmail.com>
 <CAGETcx-dVnLCRA+1CX47gtZgtwTcrN5KefpjMzh9OJB-BEnqyg@mail.gmail.com>
 <19c99a6e-51c3-68d7-d1d6-640aae754c14@gmail.com>
 <CAGETcx-XcXZq7YFHsFdzBDniQku9cxFUJL_vBoEKKhCH+cDKRw@mail.gmail.com>
 <74931824-f8a1-0435-e00a-5b5cdbe8a8a2@gmail.com>
 <CAGETcx8UHA9kNkjjnBXcf_OYXaaPO9ky60M01Cfz3NFb1c1FZw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAGETcx8UHA9kNkjjnBXcf_OYXaaPO9ky60M01Cfz3NFb1c1FZw@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Saravana Kannan <saravanak@google.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Jonathan Corbet <corbet@lwn.net>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, David Collins <collinsd@codeaurora.org>, Android Kernel Team <kernel-team@android.com>, Linux Doc Mailing List <linux-doc@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 8/19/19 5:09 PM, Saravana Kannan wrote:
> On Mon, Aug 19, 2019 at 2:30 PM Frank Rowand <frowand.list@gmail.com> wrote:
>>
>> On 8/19/19 1:49 PM, Saravana Kannan wrote:
>>> On Mon, Aug 19, 2019 at 10:16 AM Frank Rowand <frowand.list@gmail.com> wrote:
>>>>
>>>> On 8/15/19 6:50 PM, Saravana Kannan wrote:
>>>>> On Wed, Aug 7, 2019 at 7:06 PM Frank Rowand <frowand.list@gmail.com> wrote:
>>>>>>
>>>>>> On 7/23/19 5:10 PM, Saravana Kannan wrote:
>>>>>>> Add device-links after the devices are created (but before they are
>>>>>>> probed) by looking at common DT bindings like clocks and
>>>>>>> interconnects.
>>>>
>>>>
>>>> < very big snip (lots of comments that deserve answers) >
>>>>
>>>>
>>>>>>
>>>>>> /**
>>>>>>  * of_link_property - TODO:
>>>>>>  * dev:
>>>>>>  * con_np:
>>>>>>  * prop:
>>>>>>  *
>>>>>>  * TODO...
>>>>>>  *
>>>>>>  * Any failed attempt to create a link will NOT result in an immediate return.
>>>>>>  * of_link_property() must create all possible links even when one of more
>>>>>>  * attempts to create a link fail.
>>>>>>
>>>>>> Why?  isn't one failure enough to prevent probing this device?
>>>>>> Continuing to scan just results in extra work... which will be
>>>>>> repeated every time device_link_check_waiting_consumers() is called
>>>>>
>>>>> Context:
>>>>> As I said in the cover letter, avoiding unnecessary probes is just one
>>>>> of the reasons for this patch. The other (arguably more important)
>>>>
>>>> Agree that it is more important.
>>>>
>>>>
>>>>> reason for this patch is to make sure suppliers know that they have
>>>>> consumers that are yet to be probed. That way, suppliers can leave
>>>>> their resource on AND in the right state if they were left on by the
>>>>> bootloader. For example, if a clock was left on and at 200 MHz, the
>>>>> clock provider needs to keep that clock ON and at 200 MHz till all the
>>>>> consumers are probed.
>>>>>
>>>>> Answer: Let's say a consumer device Z has suppliers A, B and C. If the
>>>>> linking fails at A and you return immediately, then B and C could
>>>>> probe and then figure that they have no more consumers (they don't see
>>>>> a link to Z) and turn off their resources. And Z could fail
>>>>> catastrophically.
>>>>
>>>> Then I think that this approach is fatally flawed in the current implementation.
>>>
>>> I'm waiting to hear how it is fatally flawed. But maybe this is just a
>>> misunderstanding of the problem?
>>
>> Fatally flawed because it does not handle modules that add a consumer
>> device when the module is loaded.
> 
> If you are talking about modules adding child devices of the device
> they are managing, then that's handled correctly later in the series.

They may or they may not.  I do not know.  I am not going to audit all
current cases of devices being added to check that relationship and I am
not going to monitor all future patches that add devices.  Adding devices
is an existing pattern of behavior that the new feature must be able to
handle.

I have not looked at patch 6 yet (the place where modules adding child
devices is handled).  I am guessing that patch 6 could be made more
general to remove the parent child relationship restriction.

> 
> If you are talking about modules adding devices that aren't defined in
> DT, then right, I'm not trying to handle that. The module needs to
> make sure it keeps the resources needed for new devices it's adding
> are in the right state or need to add the right device links.

I am not talking about devices that are not defined in the devicetree.


> 
>>> In the text below, I'm not sure if you mixing up two different things
>>> or just that your wording it a bit ambiguous. So pardon my nitpick to
>>> err on the side of clarity.
>>
>> Please do nitpick.  Clarity is good.
>>
>>
>>>
>>>> A device can be added by a module that is loaded.
>>>
>>> No, in the example I gave, of_platform_default_populate_init() would
>>> add all 3 of those devices during arch_initcall_sync().
>>
>> The example you gave does not cover all use cases.
>>
>> There are modules that add devices when the module is loaded.  You can not
>> ignore systems using such modules.
> 
> I'll have to agree to disagree on that. While I understand that the
> design should be good and I'm happy to work on that, you can't insist
> that a patch series shouldn't be allowed because it's only improving
> 99% of the cases and leaves the other 1% in the status quo. You are
> just going to bring the kernel development to a grinding halt.

No, you do not get to disagree on that.  And you are presenting a straw
man argument.

You are proposing a new feature that contributes fragility and complexity
to the house of cards that device instantiation and driver probing already
is.

The feature is clever but it is intertwined into an area that is already
complex and in many cases difficult to work within.

I had hoped that the feature was robust enough and generic enough to
accept.  The proposed feature is a hack to paper over a specific problem
that you are facing.  I had hoped that the feature would appear generic
enough that I would not have to regard it as an attempt to paper over
the real problem.  I have not given up this hope yet but I still am
quite cautious about this approach to addressing your use case.

You have a real bug.  I have told you how to fix the real bug.  And you
have ignored my suggestion.  (To be honest, I do not know for sure that
my suggestion is feasible, but on the surface it appears to be.)  Again,
my suggestion is to have the boot loader pass information to the kernel
(via a chosen property) telling the kernel which devices the bootloader
has enabled power to.  The power subsystem would use that information
early in boot to do a "get" on the power supplier (I am not using precise
power subsystem terminology, but it should be obvious what I mean).
The consumer device driver would also have to be aware of the information
passed via the chosen property because the power subsystem has done the
"get" on the consumer devices behalf (exactly how the consumer gets
that information is an implementation detail).  This approach is
more direct, less subtle, less fragile.


> 
>>>
>>>>  In that case the device
>>>> was not present at late boot when the suppliers may turn off their resources.
>>>
>>> In that case, the _drivers_ for those devices aren't present at late
>>> boot. So that they can't request to keep the resources on for their
>>> consumer devices. Since there are no consumer requests on resources,
>>> the suppliers turn off their resources at late boot (since there isn't
>>> a better location as of today). The sync_state() call back added in a
>>> subsequent patche in this series will provide the better location.
>>
>> And the sync_state() call back will not deal with modules that add consumer
>> devices when the module is loaded, correct?
> 
> Depends. If it's just more devices from DT, then it'll be fine. If
> it's not, then the module needs to take care of the needs of devices
> it's adding.> 
>>>
>>>> (I am assuming the details since I have not reviewed the patches later in
>>>> the series that implement this part.)
>>>>
>>>> Am I missing something?
>>>
>>> I think you are mixing up devices getting added/populated with drivers
>>> getting loaded as modules?
>>
>> Only some modules add devices when they are loaded.  But these modules do
>> exist.
> 
> Out of the billions of Android devices, how many do you see this happening in?

The Linux kernel is not just used by Android devices.

-Frank

> 
> Thanks,
> Saravana
> 
