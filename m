From: Peter Maydell <peter.maydell-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] ARM: cpu: Document and tweak clock-frequency property
Date: Sun, 8 Dec 2013 19:51:59 +0000
Message-ID: <CAFEAcA9oCPi0dj89NJ0k2wOsbVBCV=3=7FBrn=xuYdouJWc98Q@mail.gmail.com>
References: <1386331027-26065-1-git-send-email-broonie@kernel.org>
 <52A36AB3.6060102@gmail.com> <20131208161922.GK29268@sirena.org.uk>
 <CAFEAcA8qsb0f_5dVbytCD3fGQdT+W4=PJudCY1f-ee4Pwm=0=Q@mail.gmail.com> <20131208192237.GM29268@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131208192237.GM29268-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "linaro-kernel-cunTk1MwBs8s++Sfvej+rw@public.gmane.org" <linaro-kernel-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, arm-mail-list <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 8 December 2013 19:22, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> On Sun, Dec 08, 2013 at 04:38:58PM +0000, Peter Maydell wrote:
>
>> Sorry, but there is already shipping software (kvmtool
>> and QEMU) which isn't emitting clock-frequency properties
>> for cpu nodes, based on what you documented in the kernel
>> doc file, which says:
>
> I didn't document anything here except this patch, I was just trying to
> reconcile the implementation with the documentation.

I mean "you" in the sense of "the Linux kernel developers in
general" :-)

>> "The ARM architecture, in accordance with the ePAPR, requires
>> the cpus and cpu nodes to be present and contain the properties
>> described below."
>
>> not "must contain the properties described below and also
>> any others that the ePAPR spec says are mandatory".
>
> I think that's a fairly tortured way of reading the language there to be
> honest

It's the way that I read it, and presumably also the way it was read
by  Marc Z when he wrote the kvmtool device tree writing code, and
also I would assume the way it was read by the people who wrote the
random three or four dts files in arch/arm/boot/dts that I checked,
since none of them include clock-frequency properties as far as I
can see. If half a dozen different people all produced device
trees with cpu nodes without a clock-frequency property then
I think it's a bit hard to claim that it requires a tortured reading
of the documentation to decide that it's not mandatory.

> (and doesn't reflect the actual deployed code reading the binding
> which does use this property without documentation outside ePAPR and does
> warn if it's absent)

This code should be fixed, then... (I'm pretty sure the kernel
has not always warned about the absence of this property,
or there would not be such a wide prevalence of DTs and
DT generating code which omitted it.)

>> So I'm afraid you're stuck with this being an optional property.
>
> Like I say I think a reasonable and robust implementation shouldn't
> reject a device tree with it missing but that doesn't stop the device
> tree being out of spec.  This is also the existing kernel behaviour for
> this property so we're stuck with it anyway and my goal here was to
> minimise our deviation from the spec so I introduced the minimum
> practical change in the process of copying it in for discoverability.
>
> This sort of situation is going to become more and more common as people
> actually look at device trees in production; the kernel will have to be
> robust against device trees that it previously accepted even if they are
> out of spec (and should just generally be robust in parsing).  We've got
> to understand that the kernel will fill the role Windows does for PCs -
> things that run well enough with existing kernels are going to end up
> being released regardless of spec conformance.  Kernels should be
> liberal in what they accept, DTs should be conservative in what they
> contain and both need to understand that the other is going to get it
> wrong some of the time.

I agree generally with this, and I think I would also include that
the kernel should not start warning about things which it has
not warned about in the past, because this basically manifests
as "user experiences warning which they can't do much about";
it's directed at the wrong target and much too late.

If you want to make properties mandatory then you should
have some sort of setup for validating an entire device tree
including all the properties which the kernel doesn't happen
to use yet or doesn't use in every configuration. That can
then feel free to warn copiously about any missing mandatory
properties, obviously.

>> (It's also not at all clear what a virtual machine's devicetree
>> should set the clock-frequency properties to anyway...)
>
> Yes, it's a poorly considered property all round.  Most currently
> available silicon has variable clocks for the cores which is an issue
> with a fixed DT like FDT provides and like you say for simulators and so
> on it's meaningless.

So what would we lose by making it genuinely optional and
just silently doing something reasonable if it's not set?

thanks
-- PMM
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
