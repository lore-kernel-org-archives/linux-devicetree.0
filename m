From: Brendan Higgins <brendanhiggins@google.com>
Subject: Re: [PATCH v2 0/4] ipmi: bt-i2c: added IPMI Block Transfer over I2C
Date: Mon, 7 Aug 2017 18:25:29 -0700
Message-ID: <CAFd5g46LmyjPnjKis7c-F9FbjzyU1MgvrVkR7vjrEC4oWV1doQ@mail.gmail.com>
References: <20170805011855.1027-1-brendanhiggins@google.com> <8f5579cb-2c4d-2cd0-e874-a44374e08417@acm.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <8f5579cb-2c4d-2cd0-e874-a44374e08417@acm.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Corey Minyard <minyard@acm.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Arnd Bergmann <arnd@arndb.de>, Greg KH <gregkh@linuxfoundation.org>, Joel Stanley <joel@jms.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Benjamin Fair <benjaminfair@google.com>, linux-doc@vger.kernel.org, devicetree <devicetree@vger.kernel.org>, openipmi-developer@lists.sourceforge.net, OpenBMC Maillist <openbmc@lists.ozlabs.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Sat, Aug 5, 2017 at 3:23 PM, Corey Minyard <minyard@acm.org> wrote:
> On 08/04/2017 08:18 PM, Brendan Higgins wrote:
>>
>> This patchset introduces IPMI Block Transfer over I2C (BT-I2C), which has
>> the
>> same semantics as IPMI Block Transfer except it done over I2C.
>>
>> For the OpenBMC people, this is based on an RFC:
>> https://lists.ozlabs.org/pipermail/openbmc/2016-September/004505.html
>>
>> The documentation discusses the reason for this in greater detail, suffice
>> it to
>> say SSIF cannot be correctly implemented on some naive I2C devices. There
>> are
>> some additional reasons why we don't like SSIF, but those are again
>> covered in
>> the documentation for all those who are interested.
>
>
> I'm not terribly excited about this.  A few notes:

I was afraid so, alas.

>
> SMBus alerts are fairly broken in Linux right now.  I have a patch to fix
> this at:
> https://github.com/cminyard/linux-ipmi/commit/48136176ce1890f99857c73e0ace5bd8dfb61fbf
> I haven't been able to get much traction getting anyone to care.

Yeah, I have some work I would like to do there as well.

>
> The lack of a NACK could be worked around fairly easily in the current
> driver.  It looks like you
> are just returning a message too short to be valid.  That's easy.  I think
> it's a rather major
> deficiency in the hardware to not be able to NACK something, but that is
> what it is.

Right, we actually have multiple pieces of hardware that do not support
NACKing correctly. The most frustrating piece is the Aspeed chip which
does not provide and facility for arbitrary NACKs to be generated on the
slave side.

>
> What you have is not really BT over I2C.  You have just added a sequence
> number to the
> IPMI messages and dropped the SMBus command.  Other interfaces have sequence
> numbers,
> too.  Calling it BT is a little over the top.

Fair point, maybe ISIF (I2C System Interface)? I don't have strong feelings
about the name.

>
> Do you really need the performance required by having multiple outstanding
> messages?
> That adds a lot of complexity, if it's unnecessary it's just a waste.  The
> IPMI work on top
> of interfaces does not really require that much performance, it's just
> reading sensors,
> FRU data, and such.  Perhaps you have a reason, but I fail to see
> why it's really that big a deal.  The BT interface has this ability, but the
> driver does not
> take advantage of it and nobody has complained.
>

Yes, we do have some platforms which only have IPMI as a standard interface
and we are abusing some OEM commands to do some things that we probably
should not do with IPMI like doing firmware updates. Also, we have some
commands which take a really long time to complete (> 1s). Admittedly, this is
abusing IPMI to solve problems which should probably be solved elsewhere;
nevertheless, it is a feature we are actually using. And having an option to use
sequence numbers if definitely nice from our perspective.

We will probably want to improve the block transfer driver at some
point as well.

> And I don't understand the part about OpenBMC making use of sequence
> numbers.
> Why does that matter for this interface?  It's the host side that would care
> about
> that, the host would stick the numbers in and the slave would return it.  If
> you are
> using sequence numbers in OpenBMC, which sounds quite reasonable, I would
> think
> it would be a bad idea to to trust that the host would give you good
> sequence
> numbers.
>

I think, I illustrated the use case above, but to reiterate, the
desire is to have
multiple messages in flight at the same time because some messages take
a long time to service.

> Plus, with multiple outstanding messages, you really need to limit it.  A
> particular BMC
> may not be able to handle it the full 256, and the ability to have that many
> messages
> outstanding is probably not a good thing.
>

It is going to depend on the BMC of course; nevertheless, I would be willing
to implement a configurable limit.

> If you really need multiple outstanding messages, the host side IPMI message
> handler
> needs to change to allow that.  It's doable, and I know how, I just haven't
> seen the
> need.
>

Sure, we would also like SMBus alert support, but I figured it was probably
best to discuss this with you before we go too far down that path.

> I would agree that the multi-part messages in SSIF is a big pain and and a
> lot of
> unnecessary complexity.  I believe it is there to accommodate host hardware
> that is
> limited.  But SMBus can have 255 byte messages and there's no arbitrary
> limit on
> I2C.  It is the way of IPMI to support the least common denominator.
>
> Your interface will only work on Linux.  Other OSes (unless they choose to
> implement this
> driver) will be unable to use your BMC.  Of course there's the NACK issue,
> but that's a
> big difference, and it would probably still work with existing drivers on
> other OSes.

I hope I did not send the message that we are planning on using this instead
of SSIF forever and always. This is intended as an alternative to SSIF for some
systems for which I2C is really the only available hardware interface, but SSIF
is not well suited for said reasons.

It would be great for OpenBMC if someone added support for SSIF, but as far
as I know, no one is asking for it.

> Plus people may choose to use OpenBMC on things besides the aspeed devices
> that
> could do a NACK.  That's kind of the point of OpenBMC, isn't it?

Yes, using OpenBMC on other things is part of the point; however, all
of the projects
that I am currently aware of and am trying to support use Aspeed parts
which also
need an option.

>
> My suggestion would be to implement a BMC that supports standard SSIF single
> part
> messages by default.  That way any existing driver will work with it.  (I
> don't know
> about the NACK thing, but that's a much smaller issue than a whole new
> protocol.)

Coming up with a satisfactory solution to working around systems that cannot
NACK is my primary goal; I don't care about alternatives that do not address
this.

> Then use OEM extensions to query things like if it can do messages larger
> than 32
> bytes or supports sequence numbers, and how many outstanding messages it
> can have, and extend the current SSIF driver.  It wouldn't be very hard.

It would not be that hard to implement something that is naive, but I
think it would
be difficult to implement something that is maintainable and robust.
For example,
if I added an OEM extension that allowed me to add a sequence number, I would
have to find a place that I could put it that would allow IPMI
messages that do not
have the sequence number to still be sent and parsed correctly so that if either
the host or BMC reset the other would still be able to send the
message to return
it to the desired state. I can think of ways that this could be done,
but I cannot
think of anyway that it could be done cleanly and would not make maintaining
SSIF more complicated.

>
> In my experience, sticking with standards is a good thing, and designing
> your own
> protocols is fraught with peril.  I'm not trying to be difficult here, but I
> am against
> the proliferation of things that do not need to proliferate :).

I totally agree, which is why I tried to do something which looks like an
existing IPMI interface to all of the software outside of this. As I mentioned
above, I am afraid that hacking up SSIF to achieve the desired effects would
make it much harder to maintain. I figured that the stuff I was trying
to do does
not really look like SSIF, so I should not force it into SSIF. If we
don't advertise it
as SSIF, then no one will expect it to behave that way.

Moreover, if we put all of the hacky stuff in its own driver then we
don't have to
worry about it forever polluting SSIF; whereas, if we modify SSIF to support
whatever weird things we suggest, it becomes a lot harder go back and clean
it up if one day we find that no one is using it, which I do indeed hope becomes
the case.

I guess that I would say that sticking with standards is a good thing,
but if you
are going to break them, you must not make anything more difficult for the
people who are following them.

All this being said, we do not terribly mind keeping these patches internal, at
least for sometime (by then maybe we will have a better solution). The main
reason I wanted to upstream these is twofold: I heard that there are some
other people who ran into this problem and were interested in a solution of
this type and I thought this would be a good motivating example behind a new
BMC side IPMI framework that we are working on as it would help to illustrate
the desire to separate the hardware layer from the common routing layer as
you had done with the host side; however, as long as you are aware that there
may be other implementations, just possibly not in the mainline kernel, then
I suppose that is not really an issue. I will try to send out an RFC for this
framework tonight.

>
> -corey
>
>
>>
>> In addition, since I am adding both host side and BMC side support, I
>> figured
>> that now is a good time to resolve the problem of where to put BMC side
>> IPMI
>> drivers; right now we have it (there is only one) in drivers/char/ipmi/
>> with the
>> rest of the host side IPMI drivers, but I think it makes sense to put all
>> of the
>> host side IPMI drivers in one directory and all of the BMC side drivers in
>> another, preferably in a way that does not effect all of the current
>> OpenIPMI
>> users. I have not created a MAINTAINERS entry for the new directory yet,
>> as I
>> figured there might be some discussion to be had about it.

Regardless of what we do with the "BT-I2C" stuff, I am still interested in what
you think about this.

>>
>> I have tested this patchset on the Aspeed 2500 EVB.
>>
>> Changes since previous update:
>>    - Cleaned up some documentation.
>>    - Added patch which moves the Aspeed BT-BMC driver to the new ipmi_bmc
>>      directory.
>
>
>

Thanks
