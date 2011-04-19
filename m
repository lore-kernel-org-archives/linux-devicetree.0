From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH v3] uio/pdrv_genirq: Add OF support
Date: Tue, 19 Apr 2011 08:49:31 -0600
Message-ID: <BANLkTin-qL3ppG1jRjBu3S16SWcNjD=3kA@mail.gmail.com>
References: <1303116654-5042-1-git-send-email-monstr@monstr.eu>
 <20110418160658.GD23814@pengutronix.de> <BANLkTimFnfgiQ5aMq_KwqHP8p92pjOJJwg@mail.gmail.com>
 <20110419061121.GB5252@ponder.secretlab.ca> <BANLkTin0krYi+MqngSQ5n-752vDa_a8ZtA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <BANLkTin0krYi+MqngSQ5n-752vDa_a8ZtA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: John Williams <john.williams@petalogix.com>
Cc: Wolfram Sang <w.sang@pengutronix.de>, Michal Simek <monstr@monstr.eu>, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, hjk@hansjkoch.de, arnd@arndb.de
List-Id: devicetree@vger.kernel.org

On Tue, Apr 19, 2011 at 6:37 AM, John Williams
<john.williams@petalogix.com> wrote:
> On Tue, Apr 19, 2011 at 4:11 PM, Grant Likely <grant.likely@secretlab=
=2Eca> wrote:
>> On Tue, Apr 19, 2011 at 11:58:25AM +1000, John Williams wrote:
>>> On Tue, Apr 19, 2011 at 2:06 AM, Wolfram Sang <w.sang@pengutronix.d=
e> wrote:
>>> > Hi,
>>> >
>>> >> For example with "uio" compatible string:
>>> >> static const struct of_device_id __devinitconst uio_of_genirq_ma=
tch[] =3D {
>>> >> =A0 =A0 =A0 { .compatible =3D "uio", },
>>> >> =A0 =A0 =A0 { /* empty for now */ },
>>> >> };
>>> >
>>> > Please use a proper example with "vendor,device".
>>> > (And after that it won't be empty anymore)
>>>
>>> My vote is, and always has been 'generic-uio' :)
>>>
>>> Putting some random vendor/device string in there is just nuts. Do =
you
>>> really want a kernel patch every time some one binds their device t=
o
>>> it?
>>>
>>> Or, is there no expectation that anybody would attempt to merge suc=
h a
>>> pointless patch to begin with?
>>>
>>> As we discussed at ELC, putting a real vendor/device in there is al=
so
>>> broken because all instances in the system wil bind to the generic
>>> uio, which is not necessarily what is desired.
>>>
>>> I know the arguments against the 'generic-uio' tag, but come on, le=
t's
>>> look at the lesser of two evils here! =A0I call BS on this DTS puri=
ty.
>>
>> Call it what you like, but the reasons are well founded. =A0The alte=
rnative
>> that has been proposed which I am in agreement with is to investigat=
e
>> giving userspace the hook to tell the kernel at runtime which device=
s
>> should be picked up by the uio driver.
>
> OK, so let's talk about this interface. =A0As I see it, it must be ab=
le
> to handle bind per-instance, not per compatibility.
>
> For example, we make systems with multiple, identical timers. =A0One
> will be used as the system timer, the others need to be (optionally)
> bound to generic UIO.
>
> Therefore, it's not OK to just do
>
> echo "vendor,device" >> /sys/class/something/generic-uio/compatlist
>
> or whatever, as this would bind all instances matching vendor,device.
>
> So, the question I have is, how to handle bind per-instance?

By manipulating a property on the device instance of course!  :-)

Something like:  echo "generic-uio" >>
/sys/devices/path/to/device/a-property-that-changes-the-driver-it-will-=
bind-to.

>> In the mean time, explicitly modifying the match table is an okay
>> compromise.
>
> My mind is still boggling that in this day and age it could possibly
> be preferred to modify code, instead of a data structure. =A0However,
> clearly this is a lost cause!

I don't think anybody wants this as a long term solution.  It is
merely a stop-gap so that development is not stalled while working out
a real interface.

g.
