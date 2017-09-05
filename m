From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] devicetree: Remove remaining references/tests for "chosen@0"
Date: Tue, 5 Sep 2017 09:30:22 -0500
Message-ID: <CAL_JsqJNoWAAi3Nj5KxAf5ov73nfPVaGeT1RTNgzZGpdxZ7s=w@mail.gmail.com>
References: <alpine.LFD.2.21.1709020416130.13598@localhost.localdomain>
 <1504390854.4974.108.camel@kernel.crashing.org> <alpine.LFD.2.21.1709030637090.24875@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <alpine.LFD.2.21.1709030637090.24875-bi+AKbBUZKY6gyzm1THtWbp2dZbC/Bob@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Robert P. J. Day" <rpjday-L09J2beyid0N/H6P543EQg@public.gmane.org>
Cc: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux-MIPS <linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>, Linux PPC Mailing List <linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sun, Sep 3, 2017 at 5:43 AM, Robert P. J. Day <rpjday-L09J2beyid0N/H6P543EQg@public.gmane.org> wrote:
> On Sun, 3 Sep 2017, Benjamin Herrenschmidt wrote:
>
>> On Sat, 2017-09-02 at 04:43 -0400, Robert P. J. Day wrote:
>> > Since, according to a recent devicetree ML posting by Rob Herring,
>> > the node "/chosen@0" is most likely for real Open Firmware and
>> > does not apply to DTSpec, remove all remaining tests and
>> > references for that node, of which there are very few left:
>>
>> Technically that would break Open Firmware systems where the node is
>> really called chosen@0
>>
>> Now I'm not sure such a thing actually exist however.
>>
>> My collection of DTs don't seem to have one, except in the ancient
>> html variants that were extracted by the pengionppc folks for the
>> original PowerMac 8600 but I wonder if that's a bug in the
>> extraction script since they also have @0 on /packages etc...
>
>   obviously, this isn't a priority issue, i was just working off a
> comment by rob herring that "chosen@0" is not defined by the current
> DTSpec 0.1, so it seemed appropriate to toss it. if there's a reason
> to hang onto it, that's fine with me.
>
>   however, given the diff stat of the change to remove every single
> reference to that node name in the current kernel source:
>
>  arch/microblaze/kernel/prom.c | 3 +--
>  arch/mips/generic/yamon-dt.c  | 4 ----
>  arch/powerpc/boot/oflib.c     | 7 ++-----
>  drivers/of/base.c             | 2 --
>  drivers/of/fdt.c              | 5 +----
>  5 files changed, 4 insertions(+), 17 deletions(-)
>
> it seems inconsistent that three architectures would be testing for
> that node, but none of the rest. consistency suggests that every
> architecture should take it into account, or none should.

I generally agree and have moved various things from arch to
drivers/of/ to ensure that. But for legacy things, we have to allow
for exceptions. I agree with Ben and think that microblaze (they
generally just copied PPC), MIPS, and the FDT code in drivers/of/ can
be changed.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
