From: Brendan Higgins <brendanhiggins@google.com>
Subject: Re: [PATCH v2 0/4] ipmi: bt-i2c: added IPMI Block Transfer over I2C
Date: Wed, 9 Aug 2017 18:04:17 -0700
Message-ID: <CAFd5g47FmTiygHDjm0-h2NAz8qa85zZVLKgCf9vGYP8iK6_+ZQ@mail.gmail.com>
References: <20170805011855.1027-1-brendanhiggins@google.com>
 <8f5579cb-2c4d-2cd0-e874-a44374e08417@acm.org> <CAFd5g46LmyjPnjKis7c-F9FbjzyU1MgvrVkR7vjrEC4oWV1doQ@mail.gmail.com>
 <fd82d68b-0ca4-fa43-4ed4-e18f684f6dee@acm.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <fd82d68b-0ca4-fa43-4ed4-e18f684f6dee@acm.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Corey Minyard <minyard@acm.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Arnd Bergmann <arnd@arndb.de>, Greg KH <gregkh@linuxfoundation.org>, Joel Stanley <joel@jms.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Benjamin Fair <benjaminfair@google.com>, linux-doc@vger.kernel.org, devicetree <devicetree@vger.kernel.org>, openipmi-developer@lists.sourceforge.net, OpenBMC Maillist <openbmc@lists.ozlabs.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

> Perhaps that is some level of abuse, but it's pretty common.  I'm not
> against it.
>
> There is standard IPMI firmware NetFN (though no commands defined) that if
> you use
> the driver automatically goes into "Maintenance mode" and modified the
> timeouts
> and handling to some extent to help with this.

That is a really good point, I missed that.
...
>
>
> There are ways to accomplish this that aren't that complex.  You can create
> an OEM
> command that can query the maximum message size and the ability to do
> sequence
> numbers in the messages.
>
> If messages larger than 32-bytes are supported, and the host I2C/SMBus
> driver
> supports it, you could use the standard SSIF SMBus commands to do this, they
> have an 8-bit length field.
>
> If sequence numbers are supported, The SSIF could use different SMBus
> commands
> to do the write and read requests.  Since this is only if you get an OEM
> command,
> and if you put the sequence numbers at the end where they are easy to add on
> the send side, this is a small change to the driver.

What if we just had an OEM command that changed the message structure from
that point on? We could abuse the "maintenance mode" NetFN to get back into
normal SSIF if necessary.

>
> So I think the changes would be small and contained.  I'm actually ok with a
> different driver, but I think it would be more valuable to the OpenBMC
> project
> to have a standardized interface that would work (in a not quite as
> efficient
> mode) with software that does not use the Linux IPMI driver.

I guess I see the all of my asks as hacky things which we can hopefully remove
at some point. Hopefully, most OpenBMC users won't want or need these things.
...
>>
>> Regardless of what we do with the "BT-I2C" stuff, I am still interested in
>> what
>> you think about this.
>
>
> I think you are right, it probably belongs some place else.  The way that
> makes the most
> sense to me would be to have an "ipmi" directory with a "host" and "slave"
> side, and since
> ipmi is not really a char driver, to move it to the main driver directory.
> That might be
> fairly disruptive, though.

That was my thinking exactly.

>
> The other option that makes sense to me would be to add a
> drivers/char/ipmi_slave directory,
> or something like that, and put the slave code there.  That would be less
> disruptive.

Right that is the approach I took, except I called it drivers/char/ipmi_bmc.

I originally thought doing the less disruptive thing is best; however, I know
there are also some OpenBMC people who are interested in implementing
IPMB. So maybe now is the time to bite the bullet and create an ipmi
directory under drivers/.

>
> -corey

In summary, I think I can live with making it a mangled form of SSIF, but
I would prefer to put it in its own driver.

In any case, I think I would rather focus on the the BMC side IPMI framework
now, since it is a bigger change and would also reduce the work of
implementing a BMC side SSIF driver.

Here is what I propose: we focus on the BMC side IPMI framework RFC that
I sent out the other day:
https://www.mail-archive.com/linux-kernel@vger.kernel.org/msg1463473.html
I will add a change to the BMC side IPMI framework patchset to move all the
IPMI stuff to the new drivers/ipmi directory as discussed and then drop the
patch in that patchset that depends on this patchset.

Let me know what you think
