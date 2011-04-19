From: John Williams <john.williams@petalogix.com>
Subject: Re: [PATCH v3] uio/pdrv_genirq: Add OF support
Date: Tue, 19 Apr 2011 22:37:40 +1000
Message-ID: <BANLkTin0krYi+MqngSQ5n-752vDa_a8ZtA@mail.gmail.com>
References: <1303116654-5042-1-git-send-email-monstr@monstr.eu>
 <20110418160658.GD23814@pengutronix.de> <BANLkTimFnfgiQ5aMq_KwqHP8p92pjOJJwg@mail.gmail.com>
 <20110419061121.GB5252@ponder.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20110419061121.GB5252@ponder.secretlab.ca>
Sender: linux-kernel-owner@vger.kernel.org
To: Grant Likely <grant.likely@secretlab.ca>
Cc: Wolfram Sang <w.sang@pengutronix.de>, Michal Simek <monstr@monstr.eu>, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, hjk@hansjkoch.de, arnd@arndb.de
List-Id: devicetree@vger.kernel.org

On Tue, Apr 19, 2011 at 4:11 PM, Grant Likely <grant.likely@secretlab.c=
a> wrote:
> On Tue, Apr 19, 2011 at 11:58:25AM +1000, John Williams wrote:
>> On Tue, Apr 19, 2011 at 2:06 AM, Wolfram Sang <w.sang@pengutronix.de=
> wrote:
>> > Hi,
>> >
>> >> For example with "uio" compatible string:
>> >> static const struct of_device_id __devinitconst uio_of_genirq_mat=
ch[] =3D {
>> >> =A0 =A0 =A0 { .compatible =3D "uio", },
>> >> =A0 =A0 =A0 { /* empty for now */ },
>> >> };
>> >
>> > Please use a proper example with "vendor,device".
>> > (And after that it won't be empty anymore)
>>
>> My vote is, and always has been 'generic-uio' :)
>>
>> Putting some random vendor/device string in there is just nuts. Do y=
ou
>> really want a kernel patch every time some one binds their device to
>> it?
>>
>> Or, is there no expectation that anybody would attempt to merge such=
 a
>> pointless patch to begin with?
>>
>> As we discussed at ELC, putting a real vendor/device in there is als=
o
>> broken because all instances in the system wil bind to the generic
>> uio, which is not necessarily what is desired.
>>
>> I know the arguments against the 'generic-uio' tag, but come on, let=
's
>> look at the lesser of two evils here! =A0I call BS on this DTS purit=
y.
>
> Call it what you like, but the reasons are well founded. =A0The alter=
native
> that has been proposed which I am in agreement with is to investigate
> giving userspace the hook to tell the kernel at runtime which devices
> should be picked up by the uio driver.

OK, so let's talk about this interface.  As I see it, it must be able
to handle bind per-instance, not per compatibility.

=46or example, we make systems with multiple, identical timers.  One
will be used as the system timer, the others need to be (optionally)
bound to generic UIO.

Therefore, it's not OK to just do

echo "vendor,device" >> /sys/class/something/generic-uio/compatlist

or whatever, as this would bind all instances matching vendor,device.

So, the question I have is, how to handle bind per-instance?

I can accept that the generic-uio idea is permanently blocked, but
please can we have some concrete suggestions on an approach that would
be acceptable?

> In the mean time, explicitly modifying the match table is an okay
> compromise.

My mind is still boggling that in this day and age it could possibly
be preferred to modify code, instead of a data structure.  However,
clearly this is a lost cause!

John
