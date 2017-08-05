From: Corey Minyard <minyard-HInyCGIudOg@public.gmane.org>
Subject: Re: [PATCH v2 0/4] ipmi: bt-i2c: added IPMI Block Transfer over I2C
Date: Sat, 5 Aug 2017 17:23:06 -0500
Message-ID: <8f5579cb-2c4d-2cd0-e874-a44374e08417@acm.org>
References: <20170805011855.1027-1-brendanhiggins@google.com>
Reply-To: minyard-HInyCGIudOg@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170805011855.1027-1-brendanhiggins-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Content-Language: en-GB
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Brendan Higgins <brendanhiggins-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, corbet-T1hC0tSOHrs@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org, benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org, benjaminfair-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org
Cc: linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, openipmi-developer-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, openbmc-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 08/04/2017 08:18 PM, Brendan Higgins wrote:
> This patchset introduces IPMI Block Transfer over I2C (BT-I2C), which has the
> same semantics as IPMI Block Transfer except it done over I2C.
>
> For the OpenBMC people, this is based on an RFC:
> https://lists.ozlabs.org/pipermail/openbmc/2016-September/004505.html
>
> The documentation discusses the reason for this in greater detail, suffice it to
> say SSIF cannot be correctly implemented on some naive I2C devices. There are
> some additional reasons why we don't like SSIF, but those are again covered in
> the documentation for all those who are interested.

I'm not terribly excited about this.  A few notes:

SMBus alerts are fairly broken in Linux right now.  I have a patch to 
fix this at:
https://github.com/cminyard/linux-ipmi/commit/48136176ce1890f99857c73e0ace5bd8dfb61fbf
I haven't been able to get much traction getting anyone to care.

The lack of a NACK could be worked around fairly easily in the current 
driver.  It looks like you
are just returning a message too short to be valid.  That's easy.  I 
think it's a rather major
deficiency in the hardware to not be able to NACK something, but that is 
what it is.

What you have is not really BT over I2C.  You have just added a sequence 
number to the
IPMI messages and dropped the SMBus command.  Other interfaces have 
sequence numbers,
too.  Calling it BT is a little over the top.

Do you really need the performance required by having multiple 
outstanding messages?
That adds a lot of complexity, if it's unnecessary it's just a waste.  
The IPMI work on top
of interfaces does not really require that much performance, it's just 
reading sensors,
FRU data, and such.  Perhaps you have a reason, but I fail to see
why it's really that big a deal.  The BT interface has this ability, but 
the driver does not
take advantage of it and nobody has complained.

And I don't understand the part about OpenBMC making use of sequence 
numbers.
Why does that matter for this interface?  It's the host side that would 
care about
that, the host would stick the numbers in and the slave would return 
it.  If you are
using sequence numbers in OpenBMC, which sounds quite reasonable, I 
would think
it would be a bad idea to to trust that the host would give you good 
sequence
numbers.

Plus, with multiple outstanding messages, you really need to limit it.  
A particular BMC
may not be able to handle it the full 256, and the ability to have that 
many messages
outstanding is probably not a good thing.

If you really need multiple outstanding messages, the host side IPMI 
message handler
needs to change to allow that.  It's doable, and I know how, I just 
haven't seen the
need.

I would agree that the multi-part messages in SSIF is a big pain and and 
a lot of
unnecessary complexity.  I believe it is there to accommodate host 
hardware that is
limited.  But SMBus can have 255 byte messages and there's no arbitrary 
limit on
I2C.  It is the way of IPMI to support the least common denominator.

Your interface will only work on Linux.  Other OSes (unless they choose 
to implement this
driver) will be unable to use your BMC.  Of course there's the NACK 
issue, but that's a
big difference, and it would probably still work with existing drivers 
on other OSes.
Plus people may choose to use OpenBMC on things besides the aspeed 
devices that
could do a NACK.  That's kind of the point of OpenBMC, isn't it?

My suggestion would be to implement a BMC that supports standard SSIF 
single part
messages by default.  That way any existing driver will work with it.  
(I don't know
about the NACK thing, but that's a much smaller issue than a whole new 
protocol.)
Then use OEM extensions to query things like if it can do messages 
larger than 32
bytes or supports sequence numbers, and how many outstanding messages it
can have, and extend the current SSIF driver.  It wouldn't be very hard.

In my experience, sticking with standards is a good thing, and designing 
your own
protocols is fraught with peril.  I'm not trying to be difficult here, 
but I am against
the proliferation of things that do not need to proliferate :).

-corey

>
> In addition, since I am adding both host side and BMC side support, I figured
> that now is a good time to resolve the problem of where to put BMC side IPMI
> drivers; right now we have it (there is only one) in drivers/char/ipmi/ with the
> rest of the host side IPMI drivers, but I think it makes sense to put all of the
> host side IPMI drivers in one directory and all of the BMC side drivers in
> another, preferably in a way that does not effect all of the current OpenIPMI
> users. I have not created a MAINTAINERS entry for the new directory yet, as I
> figured there might be some discussion to be had about it.
>
> I have tested this patchset on the Aspeed 2500 EVB.
>
> Changes since previous update:
>    - Cleaned up some documentation.
>    - Added patch which moves the Aspeed BT-BMC driver to the new ipmi_bmc
>      directory.


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
