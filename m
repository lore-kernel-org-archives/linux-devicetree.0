From: Frank Rowand <frowand.list@gmail.com>
Subject: Re: [PATCH v7 3/7] of/platform: Add functional dependency link from
 DT bindings
Date: Wed, 21 Aug 2019 09:39:12 -0700
Message-ID: <983bb329-7bb4-7401-a9f1-2b8dfe87c1b7@gmail.com>
References: <20190724001100.133423-1-saravanak@google.com>
 <20190724001100.133423-4-saravanak@google.com>
 <141d2e16-26cc-1f05-1ac0-6784bab5ae88@gmail.com>
 <CAGETcx-dVnLCRA+1CX47gtZgtwTcrN5KefpjMzh9OJB-BEnqyg@mail.gmail.com>
 <19c99a6e-51c3-68d7-d1d6-640aae754c14@gmail.com>
 <CAGETcx-XcXZq7YFHsFdzBDniQku9cxFUJL_vBoEKKhCH+cDKRw@mail.gmail.com>
 <74931824-f8a1-0435-e00a-5b5cdbe8a8a2@gmail.com>
 <CAGETcx8UHA9kNkjjnBXcf_OYXaaPO9ky60M01Cfz3NFb1c1FZw@mail.gmail.com>
 <15ab4fb0-7e69-9cc1-4a79-cff06767f7d9@gmail.com>
 <CAGETcx-F7VoQsDihvJ1FY=Pw8Rhu69zh6pBzkV4nSabwYRvbZw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAGETcx-F7VoQsDihvJ1FY=Pw8Rhu69zh6pBzkV4nSabwYRvbZw@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Saravana Kannan <saravanak@google.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Jonathan Corbet <corbet@lwn.net>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, David Collins <collinsd@codeaurora.org>, Android Kernel Team <kernel-team@android.com>, Linux Doc Mailing List <linux-doc@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 8/20/19 3:09 PM, Saravana Kannan wrote:
> On Mon, Aug 19, 2019 at 9:26 PM Frank Rowand <frowand.list@gmail.com> wrote:
>>


< snip - the stuff I snipped deserves reply, but I want to focus on just
  one topic for this reply >

>> You have a real bug.  I have told you how to fix the real bug.  And you
>> have ignored my suggestion.  (To be honest, I do not know for sure that
>> my suggestion is feasible, but on the surface it appears to be.)
> 
> I'd actually say that your proposal is what's trying to paper over a
> generic problem by saying it's specific to one or a few set of
> resources. And it looks feasible to you because you haven't dove deep
> into this issue.

Not saying it is specific to one or a few sets of resources.  The
proposal suggests handling every single consumer supplier relationship
for which the bootloader has enabled a supplier resource via an
explicit message communicating the enabled resources.  And directly
handling those exact resources.

Think about the definition of "paper over" vs "directly address".


> 
>> Again,
>> my suggestion is to have the boot loader pass information to the kernel
>> (via a chosen property) telling the kernel which devices the bootloader
>> has enabled power to.  The power subsystem would use that information
>> early in boot to do a "get" on the power supplier (I am not using precise
>> power subsystem terminology, but it should be obvious what I mean).
>> The consumer device driver would also have to be aware of the information
>> passed via the chosen property because the power subsystem has done the
>> "get" on the consumer devices behalf (exactly how the consumer gets
>> that information is an implementation detail).  This approach is
>> more direct, less subtle, less fragile.
> 
> I'll have to disagree on your claim. You are adding unnecessary
> bootloader dependency when the kernel is completely capable of
> handling this on its own. You are requiring explicit "gets" by
> suppliers and then hoping all the consumers do the corresponding
> "puts" to balance it out. Somehow the consumers need to know which
> suppliers have parsed which bootloader input. And it's barely
> scratching the surface of the problem.

OK, let me flesh out a possible implementation just a little bit.

This is focused on devicetree, as is your patch series.  For ACPI
a parallel implementation would exist.

The bootloader chosen property could be a list of tuples, each tuple
containing: consumer phandle, supplier phandle.  Each tuple could
contain more data if the implementation demands, but I'm trying to
keep it simple to illustrate the concept.

In early-ish boot a core function processes the chosen property.  For
each consumer / supplier pair, the supplier compatible could be used
to determine the supplier type.  (This might not be enough info to
determine the supplier type - maybe the consumer property that points
to the supplier will also have to be specified in the chosen property
tuple, or maybe a supplier type could be added to the tuple.)  Given
the consumer, supplier, and resource type the appropriate "get"
would be done.

Late in boot, and possible repeated after modules are loaded, a core
function would scan the chosen property tuples, and for each
consumer / supplier pair, if both the consumer and the supplier
drivers are bound, it would be ASSUMED that it is ok to do the
appropriate type of "put", and the "put" would be done.


> 
> You are assuming this has to do with just power when it can be clocks,
> interconnects, etc. Why solve this repeated for each framework when
> you can have a generic solution?

No such assumption.


> 
> Also, while I understand what you mean by "get" it's not going to be
> as simple as a reference count to keep the resource on. In reality
> you'll need more complex handling. For example, having to keep a
> voltage rail at or above X mV because one consumer might fail if the
> voltage is < X mV. Or making sure a clock never goes about the
> bootloader set frequency before all the consumer drivers are probed to
> avoid overclocking one of the consumers. Trying to have this
> explicitly coordinated across multiple drivers would be a nightmare.
> It gets even more complicated with interconnects.
> 
> With my patch series, the consumers don't need to do anything. They
> just probe as usual. The suppliers don't need to track or coordinate
> with any consumers. For example, regulator suppliers just need to keep
> the voltage rail at (or above) the level that the boot loader left it
> on at and then apply the aggregated requests from their APIs once they
> get the sync_state() callback. And it actually works -- tested for
> regulators and clocks (and maybe even interconnects -- I forgot) in a
> device I have.
> 

And same for the possible implementation I sketched above.  The equivalent
of the sync_state() callback would be done by the end of boot (potentially
repeated after each module loads) core function making a similar call.
Hand waving here about what suppliers to call.

Of course this is not the only way to implement my concept, just an
example to suggest that it might be feasible and it might work.

< snip >

-Frank
